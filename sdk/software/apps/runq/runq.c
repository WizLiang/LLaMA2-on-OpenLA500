/* Inference for Llama-2 Transformer model in pure C, int8 quantized forward pass. */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdint.h>
#include <time.h>
#include <math.h>
#include <string.h>
#if defined _WIN32
    #include "win.h"
#else
    #include <unistd.h>
#endif

//BSP板级支持包所需全局变量
unsigned long UART_BASE = 0xbf000000;					//UART16550的虚地址
unsigned long CONFREG_TIMER_BASE = 0xbf20f100;			//CONFREG计数器的虚地址
unsigned long CONFREG_CLOCKS_PER_SEC = 50000000L;		//CONFREG时钟频率
unsigned long CORE_CLOCKS_PER_SEC = 33000000L;			//处理器核时钟频率

// 包含由 xxd 生成的头文件
#include "stories_data.h" // 假设包含 stories260K_q80_bin[] 和 stories260K_q80_bin_len
#include "tok512.h" // 假设包含 tok512_bin[] 和 tok512_bin_len

// ----------------------------------------------------------------------------
// Globals
int GS = 0; // group size global for quantization of the weights

// ... (Config, QuantizedTensor, TransformerWeights, RunState, Transformer 结构体定义保持不变) ...
typedef struct {
    int dim; 
    int hidden_dim; 
    int n_layers; 
    int n_heads; 
    int n_kv_heads;
    int vocab_size;
    int seq_len; 
} Config;

typedef struct {
    int8_t* q;    
    float* s;  
} QuantizedTensor;

typedef struct {
    QuantizedTensor *q_tokens; 
    float* token_embedding_table;
    float* rms_att_weight; 
    float* rms_ffn_weight; 
    QuantizedTensor *wq; 
    QuantizedTensor *wk; 
    QuantizedTensor *wv; 
    QuantizedTensor *wo; 
    QuantizedTensor *w1; 
    QuantizedTensor *w2; 
    QuantizedTensor *w3; 
    float* rms_final_weight; 
    QuantizedTensor *wcls;
} TransformerWeights;

typedef struct {
    float *x; 
    float *xb; 
    float *xb2; 
    float *hb; 
    float *hb2; 
    QuantizedTensor xq; 
    QuantizedTensor hq; 
    float *q; 
    float *k; 
    float *v; 
    float *att; 
    float *logits; 
    float* key_cache;  
    float* value_cache;
} RunState;

typedef struct {
    Config config; 
    TransformerWeights weights; 
    RunState state; 
    float* data; // 指向模型数据的指针 (现在是 stories260K_q80_bin)
    ssize_t file_size; // 模型数据的大小 (现在是 stories260K_q80_bin_len)
} Transformer;


// ... (malloc_run_state, free_run_state, dequantize, quantize, init_quantized_tensors 保持不变) ...
void malloc_run_state(RunState* s, Config* p) {
    int kv_dim = (p->dim * p->n_kv_heads) / p->n_heads;
    s->x = calloc(p->dim, sizeof(float));
    s->xb = calloc(p->dim, sizeof(float));
    s->xb2 = calloc(p->dim, sizeof(float));
    s->hb = calloc(p->hidden_dim, sizeof(float));
    s->hb2 = calloc(p->hidden_dim, sizeof(float));
    s->xq = (QuantizedTensor) { .q = calloc(p->dim, sizeof(int8_t)), .s = calloc(p->dim / (GS ? GS:1), sizeof(float)) };
    s->hq = (QuantizedTensor) { .q = calloc(p->hidden_dim, sizeof(int8_t)), .s = calloc(p->hidden_dim / (GS ? GS:1), sizeof(float)) };
    s->q = calloc(p->dim, sizeof(float));
    s->k = calloc(kv_dim, sizeof(float));
    s->v = calloc(kv_dim, sizeof(float));
    s->att = calloc(p->n_heads * p->seq_len, sizeof(float));
    s->logits = calloc(p->vocab_size, sizeof(float));
    s->key_cache = calloc(p->n_layers * p->seq_len * kv_dim, sizeof(float));
    s->value_cache = calloc(p->n_layers * p->seq_len * kv_dim, sizeof(float));
    if (!s->x || !s->xb || !s->xb2 || !s->hb || !s->hb2 || !s->xq.q || !s->xq.s || !s->hq.q || !s->hq.s
     || !s->q || !s->k || !s->v || !s->att || !s->logits || !s->key_cache
     || !s->value_cache) {
        fprintf(stderr, "malloc failed in malloc_run_state!\n");
        exit(EXIT_FAILURE);
    }
}

void free_run_state(RunState* s) {
    free(s->x); free(s->xb); free(s->xb2); free(s->hb); free(s->hb2);
    free(s->xq.q); free(s->xq.s); free(s->hq.q); free(s->hq.s);
    free(s->q); free(s->k); free(s->v); free(s->att); free(s->logits);
    free(s->key_cache); free(s->value_cache);
}

void dequantize(QuantizedTensor *qx, float* x, int n) {
    for (int i = 0; i < n; i++) {
        x[i] = (float)qx->q[i] * qx->s[i / (GS ? GS:1)];
    }
}

void quantize(QuantizedTensor *qx, float* x, int n) {
    if (GS == 0) { fprintf(stderr, "Error: GS (group size) is 0 in quantize\n"); exit(EXIT_FAILURE); }
    int num_groups = n / GS;
    float Q_MAX = 127.0f;
    for (int group = 0; group < num_groups; group++) {
        float wmax = 0.0;
        for (int i = 0; i < GS; i++) {
            float val = fabsf(x[group * GS + i]);
            if (val > wmax) wmax = val;
        }
        float scale = wmax / Q_MAX;
        if (scale == 0.0f) scale = 1.0f / Q_MAX;
        qx->s[group] = scale;
        for (int i = 0; i < GS; i++) {
            float quant_value = x[group * GS + i] / scale;
            qx->q[group * GS + i] = (int8_t) roundf(quant_value);
        }
    }
}

QuantizedTensor *init_quantized_tensors(void **ptr, int n, int size_each) {
    if (GS == 0 && size_each > 0) { fprintf(stderr, "Error: GS (group size) is 0 in init_quantized_tensors with size_each > 0\n"); exit(EXIT_FAILURE); }
    void *p = *ptr;
    QuantizedTensor *res = malloc(n * sizeof(QuantizedTensor));
    if (!res) { fprintf(stderr, "malloc failed: QuantizedTensor array\n"); exit(EXIT_FAILURE); }
    for(int i=0; i<n; i++) {
        res[i].q = (int8_t*)p;
        p = (int8_t*)p + size_each;
        res[i].s = (float*)p;
        p = (float*)p + size_each / (GS ? GS:1);
    }
    *ptr = p;
    return res;
}


// memory_map_weights 函数保持不变，因为它操作的是一个内存指针
void memory_map_weights(TransformerWeights *w, Config* p, void* ptr, uint8_t shared_classifier) {
    int head_size = p->dim / p->n_heads;
    float* fptr = (float*) ptr;
    w->rms_att_weight = fptr; fptr += p->n_layers * p->dim;
    w->rms_ffn_weight = fptr; fptr += p->n_layers * p->dim;
    w->rms_final_weight = fptr; fptr += p->dim;

    ptr = (void*)fptr;
    w->q_tokens = init_quantized_tensors(&ptr, 1, p->vocab_size * p->dim);
    w->token_embedding_table = malloc(p->vocab_size * p->dim * sizeof(float));
    if (!w->token_embedding_table) { fprintf(stderr, "malloc failed: token_embedding_table\n"); exit(EXIT_FAILURE); }
    dequantize(w->q_tokens, w->token_embedding_table, p->vocab_size * p->dim);

    w->wq = init_quantized_tensors(&ptr, p->n_layers, p->dim * (p->n_heads * head_size));
    w->wk = init_quantized_tensors(&ptr, p->n_layers, p->dim * (p->n_kv_heads * head_size));
    w->wv = init_quantized_tensors(&ptr, p->n_layers, p->dim * (p->n_kv_heads * head_size));
    w->wo = init_quantized_tensors(&ptr, p->n_layers, (p->n_heads * head_size) * p->dim);

    w->w1 = init_quantized_tensors(&ptr, p->n_layers, p->dim * p->hidden_dim);
    w->w2 = init_quantized_tensors(&ptr, p->n_layers, p->hidden_dim * p->dim);
    w->w3 = init_quantized_tensors(&ptr, p->n_layers, p->dim * p->hidden_dim);

    w->wcls = shared_classifier ? w->q_tokens : init_quantized_tensors(&ptr, 1, p->dim * p->vocab_size);
}

// 修改 build_transformer 函数
void build_transformer(Transformer *t /* char* checkpoint_path 参数不再需要 */) {
    // 1. 直接使用嵌入式数据
    t->data = (float*)stories260K_q80_bin; // stories260K_q80_bin 来自 model.h
    t->file_size = stories260K_q80_bin_len; // stories260K_q80_bin_len 来自 model.h

    // 2. 从 t->data (即 stories260K_q80_bin) 的头部解析元数据
    // 这些偏移量和结构需要与您的 model.bin 文件头格式完全一致
    unsigned char* current_ptr = (unsigned char*)t->data;

    // 读取 magic number (并验证)
    uint32_t magic_number;
    memcpy(&magic_number, current_ptr, sizeof(uint32_t));
    current_ptr += sizeof(uint32_t);
    if (magic_number != 0x616b3432) { // "ak42"
        fprintf(stderr, "Bad magic number in embedded model data: 0x%x\n", magic_number);
        exit(EXIT_FAILURE);
    }

    // 读取 version (并验证)
    int version;
    memcpy(&version, current_ptr, sizeof(int));
    current_ptr += sizeof(int);
    if (version != 2) {
        fprintf(stderr, "Bad version in embedded model data: %d, need version 2\n", version);
        exit(EXIT_FAILURE);
    }

    // 读取 Config 结构体
    memcpy(&t->config, current_ptr, sizeof(Config));
    current_ptr += sizeof(Config);

    // 读取 shared_classifier flag
    uint8_t shared_classifier;
    memcpy(&shared_classifier, current_ptr, sizeof(uint8_t));
    current_ptr += sizeof(uint8_t);

    // 读取 group_size (GS)
    int group_size_from_data;
    memcpy(&group_size_from_data, current_ptr, sizeof(int));
    current_ptr += sizeof(int);
    GS = group_size_from_data; // 设置全局 GS
    if (GS == 0) {
        fprintf(stderr, "Error: Group size (GS) read from model data is 0.\n");
        exit(EXIT_FAILURE);
    }


    // 确保我们已经跳过了整个头部 (通常是256字节)
    // header_size 是固定的，或者也可以从模型元数据中读取（如果存在）
    int header_size = 256; // llama.c 中 version 2 的 header_size
    void* weights_ptr = ((char*)t->data) + header_size;

    // 调用 memory_map_weights，它现在会从 t->data (嵌入式数据) 中解析权重
    memory_map_weights(&t->weights, &t->config, weights_ptr, shared_classifier);

    // 分配 RunState 缓冲区
    malloc_run_state(&t->state, &t->config);
}

// free_transformer 函数保持不变，它释放 t->data (如果之前是 mmap，现在是嵌入式数据，则不应释放 stories260K_q80_bin 本身)
// 但是，由于 stories260K_q80_bin 是全局/静态数组，不应该被 free。
// Transformer 结构体中的 t->data 只是指向它。
// 需要修改 free_transformer，使其不再尝试 free(t->data)
void free_transformer(Transformer* t) {
    // 释放 QuantizedTensors 内部由 init_quantized_tensors 分配的数组
    if (t->weights.q_tokens) free(t->weights.q_tokens);
    if (t->weights.token_embedding_table) free(t->weights.token_embedding_table);
    if (t->weights.wq) free(t->weights.wq);
    if (t->weights.wk) free(t->weights.wk);
    if (t->weights.wv) free(t->weights.wv);
    if (t->weights.wo) free(t->weights.wo);
    if (t->weights.w1) free(t->weights.w1);
    if (t->weights.w2) free(t->weights.w2);
    if (t->weights.w3) free(t->weights.w3);
    if (t->weights.wcls && t->weights.wcls != t->weights.q_tokens) {
         free(t->weights.wcls);
    }

    // t->data 指向 stories260K_q80_bin (全局/静态数组)，不应在此处释放
    // if (t->data != NULL) {
    //     free(t->data); // <--- 注释掉或移除这一行
    //     t->data = NULL;
    // }
    
    free_run_state(&t->state);
}


// ... (rmsnorm, softmax, matmul, forward 函数保持不变) ...
void rmsnorm(float* o, float* x, float* weight, int size) {
    float ss = 0.0f;
    for (int j = 0; j < size; j++) ss += x[j] * x[j];
    ss /= size; ss += 1e-5f; ss = 1.0f / sqrtf(ss);
    for (int j = 0; j < size; j++) o[j] = weight[j] * (ss * x[j]);
}

void softmax(float* x, int size) {
    float max_val = x[0];
    for (int i = 1; i < size; i++) if (x[i] > max_val) max_val = x[i];
    float sum = 0.0f;
    for (int i = 0; i < size; i++) { x[i] = expf(x[i] - max_val); sum += x[i]; }
    for (int i = 0; i < size; i++) x[i] /= sum;
}

void matmul(float* xout, QuantizedTensor *x, QuantizedTensor *w, int n, int d) {
    int i;
    #pragma omp parallel for private(i)
    for (i = 0; i < d; i++) {
        float val = 0.0f;
        int in = i * n;
        for (int j_group_start = 0; j_group_start < n; j_group_start += GS) {
            int32_t group_ival = 0;
            for (int k_offset = 0; k_offset < GS; k_offset++) {
                int current_j = j_group_start + k_offset;
                if (current_j < n) {
                    group_ival += ((int32_t) x->q[current_j]) * ((int32_t) w->q[in + current_j]);
                }
            }
            val += ((float) group_ival) * w->s[(in + j_group_start) / GS] * x->s[j_group_start / GS];
        }
        xout[i] = val;
    }
}

float* forward(Transformer* transformer, int token, int pos) {
    Config* p = &transformer->config;
    TransformerWeights* w = &transformer->weights;
    RunState* s = &transformer->state;
    float *x = s->x;
    int dim = p->dim;
    int kv_dim = (p->dim * p->n_kv_heads) / p->n_heads;
    int kv_mul = p->n_heads / p->n_kv_heads;
    int hidden_dim =  p->hidden_dim;
    int head_size = dim / p->n_heads;

    memcpy(x, w->token_embedding_table + token*dim, dim * sizeof(float));

    for(int l = 0; l < p->n_layers; l++) {
        rmsnorm(s->xb, x, w->rms_att_weight + l*dim, dim);
        quantize(&s->xq, s->xb, dim);
        matmul(s->q, &s->xq, w->wq + l, dim, dim);
        matmul(s->k, &s->xq, w->wk + l, dim, kv_dim);
        matmul(s->v, &s->xq, w->wv + l, dim, kv_dim);

        for (int i = 0; i < dim; i+=2) {
            int head_dim_idx = i % head_size;
            float freq = 1.0f / powf(10000.0f, (float)head_dim_idx / head_size);
            float val = (float)pos * freq;
            float fcr = cosf(val);
            float fci = sinf(val);
            int rotn = i < kv_dim ? 2 : 1;
            for (int v_idx = 0; v_idx < rotn; v_idx++) {
                float* vec = v_idx == 0 ? s->q : s->k;
                float v0 = vec[i], v1 = vec[i+1];
                vec[i]   = v0 * fcr - v1 * fci;
                vec[i+1] = v0 * fci + v1 * fcr;
            }
        }
        int loff = l * p->seq_len * kv_dim;
        float* key_cache_row = s->key_cache + loff + pos * kv_dim;
        float* value_cache_row = s->value_cache + loff + pos * kv_dim;
        memcpy(key_cache_row, s->k, kv_dim * sizeof(*key_cache_row));
        memcpy(value_cache_row, s->v, kv_dim * sizeof(*value_cache_row));
        
        int h;
        #pragma omp parallel for private(h)
        for (h = 0; h < p->n_heads; h++) {
            float* q_head = s->q + h * head_size;
            float* att_head = s->att + h * p->seq_len;
            for (int t = 0; t <= pos; t++) {
                float* k_cached = s->key_cache + loff + t * kv_dim + (h / kv_mul) * head_size;
                float score = 0.0f;
                for (int i_hs = 0; i_hs < head_size; i_hs++) score += q_head[i_hs] * k_cached[i_hs];
                score /= sqrtf((float)head_size);
                att_head[t] = score;
            }
            softmax(att_head, pos + 1);
            float* xb_head = s->xb + h * head_size;
            memset(xb_head, 0, head_size * sizeof(float));
            for (int t = 0; t <= pos; t++) {
                float* v_cached = s->value_cache + loff + t * kv_dim + (h / kv_mul) * head_size;
                float a = att_head[t];
                for (int i_hs = 0; i_hs < head_size; i_hs++) xb_head[i_hs] += a * v_cached[i_hs];
            }
        }
        quantize(&s->xq, s->xb, dim);
        matmul(s->xb2, &s->xq, w->wo + l, dim, dim);
        for (int i = 0; i < dim; i++) x[i] += s->xb2[i];
        rmsnorm(s->xb, x, w->rms_ffn_weight + l*dim, dim);
        quantize(&s->xq, s->xb, dim);
        matmul(s->hb, &s->xq, w->w1 + l, dim, hidden_dim);
        matmul(s->hb2, &s->xq, w->w3 + l, dim, hidden_dim);
        for (int i = 0; i < hidden_dim; i++) {
            float val_swiglu = s->hb[i];
            val_swiglu *= (1.0f / (1.0f + expf(-val_swiglu)));
            val_swiglu *= s->hb2[i];
            s->hb[i] = val_swiglu;
        }
        quantize(&s->hq, s->hb, hidden_dim);
        matmul(s->xb, &s->hq, w->w2 + l, hidden_dim, dim);
        for (int i = 0; i < dim; i++) x[i] += s->xb[i];
    }
    rmsnorm(x, x, w->rms_final_weight, dim);
    quantize(&s->xq, x, dim);
    matmul(s->logits, &s->xq, w->wcls, dim, p->vocab_size);
    return s->logits;
}


// ... (TokenIndex, Tokenizer 结构体定义保持不变) ...
typedef struct {
    char *str;
    int id;
} TokenIndex;

typedef struct {
    char** vocab;
    float* vocab_scores;
    TokenIndex *sorted_vocab;
    int vocab_size;
    unsigned int max_token_length;
    unsigned char byte_pieces[512]; 
} Tokenizer;


// ... (compare_tokens 保持不变) ...
int compare_tokens(const void *a, const void *b) {
    return strcmp(((TokenIndex*)a)->str, ((TokenIndex*)b)->str);
}

// 修改 build_tokenizer 函数
void build_tokenizer(Tokenizer* t, int vocab_size_from_config /* tokenizer_path 不再需要 */) {
    t->vocab_size = vocab_size_from_config;
    t->vocab = (char**)malloc(t->vocab_size * sizeof(char*));
    if (!t->vocab) { fprintf(stderr, "malloc failed: t->vocab\n"); exit(EXIT_FAILURE); }
    t->vocab_scores = (float*)malloc(t->vocab_size * sizeof(float));
    if (!t->vocab_scores) { fprintf(stderr, "malloc failed: t->vocab_scores\n"); free(t->vocab); exit(EXIT_FAILURE); }
    t->sorted_vocab = NULL;

    for (int i = 0; i < 256; i++) {
        t->byte_pieces[i * 2] = (unsigned char)i;
        t->byte_pieces[i * 2 + 1] = '\0';
    }

    // 直接从 tok512_bin (来自 token.h) 解析数据
    unsigned char* p_tokenizer_data = tok512_bin;
    unsigned char* end_tokenizer_data = tok512_bin + tok512_bin_len; // 用于边界检查

    // 1. 读取 max_token_length
    if (p_tokenizer_data + sizeof(int) > end_tokenizer_data) {
        fprintf(stderr, "Error reading max_token_length: not enough data in tok512_bin\n");
        exit(EXIT_FAILURE);
    }
    memcpy(&t->max_token_length, p_tokenizer_data, sizeof(int));
    p_tokenizer_data += sizeof(int);

    // 2. 读取 vocab_scores 和 vocab strings
    for (int i = 0; i < t->vocab_size; i++) {
        // 读取分数
        if (p_tokenizer_data + sizeof(float) > end_tokenizer_data) {
            fprintf(stderr, "Error reading vocab_score for token %d: not enough data\n", i);
            exit(EXIT_FAILURE);
        }
        memcpy(t->vocab_scores + i, p_tokenizer_data, sizeof(float));
        p_tokenizer_data += sizeof(float);

        // 读取字符串长度
        int len;
        if (p_tokenizer_data + sizeof(int) > end_tokenizer_data) {
            fprintf(stderr, "Error reading length for token %d: not enough data\n", i);
            exit(EXIT_FAILURE);
        }
        memcpy(&len, p_tokenizer_data, sizeof(int));
        p_tokenizer_data += sizeof(int);

        if (len < 0 || p_tokenizer_data + len > end_tokenizer_data) {
             fprintf(stderr, "Error reading vocab string for token %d: invalid length or not enough data (len: %d)\n", i, len);
             exit(EXIT_FAILURE);
        }
        t->vocab[i] = (char *)malloc(len + 1);
        if (!t->vocab[i]) { fprintf(stderr, "malloc failed: t->vocab[%d]\n", i); exit(EXIT_FAILURE); }
        memcpy(t->vocab[i], p_tokenizer_data, len);
        t->vocab[i][len] = '\0';
        p_tokenizer_data += len;
    }
}

// free_tokenizer 函数保持不变
void free_tokenizer(Tokenizer* t) {
    if (t->vocab) {
        for (int i = 0; i < t->vocab_size; i++) { free(t->vocab[i]); }
        free(t->vocab);
    }
    if (t->vocab_scores) free(t->vocab_scores);
    if (t->sorted_vocab) free(t->sorted_vocab);
}


// ... (decode, safe_printf, str_lookup, encode 函数保持不变) ...
char* decode(Tokenizer* t, int prev_token, int token) {
    if (token < 0 || token >= t->vocab_size) return "?";
    char *piece = t->vocab[token];
    if (prev_token == 1 && piece[0] == ' ') { piece++; }
    unsigned char byte_val;
    if (sscanf(piece, "<0x%02hhX>", &byte_val) == 1) {
        if (byte_val < 256) piece = (char*)t->byte_pieces + byte_val * 2;
        else return "?";
    }
    return piece;
}

void safe_printf(char *piece) {
    if (piece == NULL || piece[0] == '\0') return;
    if (piece[1] == '\0') {
        unsigned char byte_val = piece[0];
        if (!(isprint(byte_val) || isspace(byte_val))) return;
    }
    printf("%s", piece);
}

int str_lookup(char *str, TokenIndex *sorted_vocab, int vocab_size) {
    TokenIndex tok = { .str = str };
    TokenIndex *res = bsearch(&tok, sorted_vocab, vocab_size, sizeof(TokenIndex), compare_tokens);
    return res != NULL ? res->id : -1;
}

void encode(Tokenizer* t, char *text, int8_t bos, int8_t eos, int *tokens, int *n_tokens) {
    if (text == NULL) { fprintf(stderr, "cannot encode NULL text\n"); exit(EXIT_FAILURE); }
    if (t->sorted_vocab == NULL) {
        t->sorted_vocab = malloc(t->vocab_size * sizeof(TokenIndex));
        if(!t->sorted_vocab) {fprintf(stderr, "malloc failed for sorted_vocab\n"); exit(EXIT_FAILURE);}
        for (int i = 0; i < t->vocab_size; i++) {
            t->sorted_vocab[i].str = t->vocab[i];
            t->sorted_vocab[i].id = i;
        }
        qsort(t->sorted_vocab, t->vocab_size, sizeof(TokenIndex), compare_tokens);
    }
    char* str_buffer = malloc((t->max_token_length*2 +1 +2) * sizeof(char));
    if(!str_buffer) {fprintf(stderr, "malloc failed for str_buffer in encode\n"); exit(EXIT_FAILURE);}
    size_t str_len = 0;
    *n_tokens = 0;
    if (bos) tokens[(*n_tokens)++] = 1;
    if (text[0] != '\0') {
        int dummy_prefix = str_lookup(" ", t->sorted_vocab, t->vocab_size);
        if (dummy_prefix != -1) tokens[(*n_tokens)++] = dummy_prefix;
    }
    for (char *c = text; *c != '\0'; c++) {
        if ((*c & 0xC0) != 0x80) str_len = 0;
        str_buffer[str_len++] = *c; str_buffer[str_len] = '\0';
        if ((*(c+1) & 0xC0) == 0x80 && str_len < 4) continue;
        int id = str_lookup(str_buffer, t->sorted_vocab, t->vocab_size);
        if (id != -1) {
            tokens[(*n_tokens)++] = id;
        } else {
            for (int i=0; i < str_len; i++) tokens[(*n_tokens)++] = (unsigned char)str_buffer[i] + 3;
        }
        str_len = 0;
    }
    while (1) {
        float best_score = -1e10; int best_id = -1; int best_idx = -1;
        for (int i=0; i < (*n_tokens-1); i++) {
            if (tokens[i] < 0 || tokens[i] >= t->vocab_size || tokens[i+1] < 0 || tokens[i+1] >= t->vocab_size) continue;
            sprintf(str_buffer, "%s%s", t->vocab[tokens[i]], t->vocab[tokens[i+1]]);
            int id = str_lookup(str_buffer, t->sorted_vocab, t->vocab_size);
            if (id != -1 && t->vocab_scores[id] > best_score) {
                best_score = t->vocab_scores[id]; best_id = id; best_idx = i;
            }
        }
        if (best_idx == -1) break;
        tokens[best_idx] = best_id;
        for (int i = best_idx+1; i < (*n_tokens-1); i++) tokens[i] = tokens[i+1];
        (*n_tokens)--;
    }
    if (eos) tokens[(*n_tokens)++] = 2;
    free(str_buffer);
}

// ... (ProbIndex, Sampler 结构体定义, sample_argmax, sample_mult, compare_prob_index, sample_topp, build_sampler, free_sampler, random_u32, random_f32, sample 函数保持不变) ...
typedef struct { float prob; int index; } ProbIndex;
typedef struct { int vocab_size; ProbIndex* probindex; float temperature; float topp; unsigned long long rng_state; } Sampler;
int sample_argmax(float* probabilities, int n) { /* ... */ int max_i=0; float max_p=probabilities[0]; for(int i=1;i<n;i++){if(probabilities[i]>max_p){max_i=i;max_p=probabilities[i];}} return max_i; }
int sample_mult(float* probabilities, int n, float coin) { /* ... */ float cdf=0.0f; for(int i=0;i<n;i++){cdf+=probabilities[i]; if(coin<cdf){return i;}} return n-1; }
int compare_prob_index(const void* a, const void* b) { ProbIndex* pa=(ProbIndex*)a; ProbIndex* pb=(ProbIndex*)b; if(pa->prob > pb->prob) return -1; if(pa->prob < pb->prob) return 1; return 0; }
int sample_topp(float* probabilities, int n, float topp, ProbIndex* probindex, float coin) {
    int n0 = 0; const float cutoff = (1.0f - topp) / (n - 1);
    for (int i = 0; i < n; i++) if (probabilities[i] >= cutoff) { probindex[n0].index = i; probindex[n0].prob = probabilities[i]; n0++; }
    qsort(probindex, n0, sizeof(ProbIndex), compare_prob_index);
    float cumulative_prob = 0.0f; int last_idx = n0 - 1;
    for (int i = 0; i < n0; i++) { cumulative_prob += probindex[i].prob; if (cumulative_prob > topp) { last_idx = i; break; } }
    float r = coin * cumulative_prob; float cdf = 0.0f;
    for (int i = 0; i <= last_idx; i++) { cdf += probindex[i].prob; if (r < cdf) return probindex[i].index; }
    return probindex[last_idx].index;
}
void build_sampler(Sampler* sampler, int vocab_size, float temperature, float topp, unsigned long long rng_seed) {
    sampler->vocab_size = vocab_size; sampler->temperature = temperature; sampler->topp = topp; sampler->rng_state = rng_seed;
    sampler->probindex = malloc(sampler->vocab_size * sizeof(ProbIndex));
    if(!sampler->probindex) {fprintf(stderr, "malloc failed: sampler->probindex\n"); exit(EXIT_FAILURE);}
}
void free_sampler(Sampler* sampler) { free(sampler->probindex); }
unsigned int random_u32(unsigned long long *state) { *state ^= *state >> 12; *state ^= *state << 25; *state ^= *state >> 27; return (*state * 0x2545F4914F6CDD1Dull) >> 32; }
float random_f32(unsigned long long *state) { return (random_u32(state) >> 8) / 16777216.0f; }
int sample(Sampler* sampler, float* logits) {
    int next;
    if (sampler->temperature == 0.0f) { next = sample_argmax(logits, sampler->vocab_size); }
    else {
        for (int q=0; q<sampler->vocab_size; q++) logits[q] /= sampler->temperature;
        softmax(logits, sampler->vocab_size);
        float coin = random_f32(&sampler->rng_state);
        if (sampler->topp <= 0 || sampler->topp >= 1) next = sample_mult(logits, sampler->vocab_size, coin);
        else next = sample_topp(logits, sampler->vocab_size, sampler->topp, sampler->probindex, coin);
    }
    return next;
}

// // ... (time_in_ms, generate, read_stdin, chat 函数保持不变，除了generate/chat中对build_transformer/tokenizer的调用) ...
// long time_in_ms() {
// #if defined(_WIN32)
//     return (long)((double)clock() * 1000.0 / CLOCKS_PER_SEC);
// #elif defined(__linux__) || defined(__APPLE__)
//     struct timespec time; clock_gettime(CLOCK_REALTIME, &time); return time.tv_sec * 1000 + time.tv_nsec / 1000000;
// #else
//     return (long)((double)clock() * 1000.0 / CLOCKS_PER_SEC);
// #endif
// }

void generate(Transformer *transformer, Tokenizer *tokenizer, Sampler *sampler, char *prompt, int steps) {
    char *empty_prompt = ""; if (prompt == NULL) prompt = empty_prompt;
    int num_prompt_tokens = 0;
    size_t prompt_len = strlen(prompt);
    int* prompt_tokens = (int*)malloc((prompt_len + 3) * sizeof(int)); 
    if(!prompt_tokens) {fprintf(stderr, "malloc failed for prompt_tokens in generate\n"); exit(EXIT_FAILURE);}
    encode(tokenizer, prompt, 1, 0, prompt_tokens, &num_prompt_tokens);
    if (num_prompt_tokens < 1 && strlen(prompt) > 0) { fprintf(stderr, "generate: 0 prompt tokens from non-empty prompt\n"); free(prompt_tokens); exit(EXIT_FAILURE); }
    if (num_prompt_tokens == 0 && strlen(prompt) == 0) { // Handle empty prompt case gracefully
        printf("Empty prompt, nothing to generate.\n");
        free(prompt_tokens);
        return;
    }


    long start = 0; int next; int token = prompt_tokens[0]; int pos = 0;   
    while (pos < steps) {
        float* logits = forward(transformer, token, pos);
        if (pos < num_prompt_tokens - 1) next = prompt_tokens[pos + 1];
        else next = sample(sampler, logits);
        pos++;
        if (next == 1 || next == 2) break; 
        char* piece = decode(tokenizer, token, next);
        safe_printf(piece); fflush(stdout);
        token = next;
        // if (start == 0) start = time_in_ms();
    }
    printf("\n");
    // if (pos > 1) {
    //     long end = time_in_ms();
    //     if (end > start) fprintf(stderr, "achieved tok/s: %f\n", (pos-1) / (double)(end-start)*1000);
    //     else fprintf(stderr, "achieved tok/s: (timing error or too fast)\n");
    // }
    free(prompt_tokens);
}

void read_stdin(const char* guide, char* buffer, size_t bufsize) { /* ... */ printf("%s", guide); if(fgets(buffer, bufsize, stdin)!=NULL){size_t len=strlen(buffer); if(len>0 && buffer[len-1]=='\n')buffer[len-1]='\0';}}

void chat(Transformer *transformer, Tokenizer *tokenizer, Sampler *sampler,
          char *cli_user_prompt, char *cli_system_prompt, int steps) {
    char system_prompt[512]; char user_prompt[512]; char rendered_prompt[1152];
    int num_prompt_tokens = 0;
    int* prompt_tokens = (int*)malloc(1152 * sizeof(int));
    if(!prompt_tokens) {fprintf(stderr, "malloc failed for prompt_tokens in chat\n"); exit(EXIT_FAILURE);}
    int user_idx; int8_t user_turn = 1; int next = 0; int token = 0; int pos = 0;   
    while (pos < steps) {
        if (user_turn) {
            if (pos == 0) {
                if (cli_system_prompt == NULL) read_stdin("Enter system prompt (optional): ", system_prompt, sizeof(system_prompt));
                else { strncpy(system_prompt, cli_system_prompt, sizeof(system_prompt) - 1); system_prompt[sizeof(system_prompt) - 1] = '\0';}
            }
            if (pos == 0 && cli_user_prompt != NULL) { strncpy(user_prompt, cli_user_prompt, sizeof(user_prompt) - 1); user_prompt[sizeof(user_prompt)-1] = '\0';}
            else read_stdin("User: ", user_prompt, sizeof(user_prompt));
            if (pos == 0 && system_prompt[0] != '\0') snprintf(rendered_prompt, sizeof(rendered_prompt), "[INST] <<SYS>>\n%s\n<</SYS>>\n\n%s [/INST]", system_prompt, user_prompt);
            else snprintf(rendered_prompt, sizeof(rendered_prompt), "[INST] %s [/INST]", user_prompt);
            encode(tokenizer, rendered_prompt, 1, 0, prompt_tokens, &num_prompt_tokens);
            if (num_prompt_tokens < 1 && strlen(rendered_prompt) > 0) { fprintf(stderr, "chat: 0 prompt tokens from non-empty prompt\n");}
            user_idx = 0; user_turn = 0; printf("Assistant: "); fflush(stdout);
            if (num_prompt_tokens == 0) continue; 
            token = prompt_tokens[user_idx++]; 
        } else {
             if (user_idx < num_prompt_tokens) token = prompt_tokens[user_idx++];
             else token = next;
        }
        if (token == 2 && !user_turn) { user_turn = 1; printf("\n"); continue; }
        if (token == 1 && pos > 0 && !user_turn) { user_turn = 1; printf("\n"); continue; }
        float* logits = forward(transformer, token, pos);
        next = sample(sampler, logits);
        pos++;
        if (user_idx >= num_prompt_tokens && next != 2 && next != 1 && !user_turn) {
            char* piece = decode(tokenizer, token, next); safe_printf(piece); fflush(stdout);
        }
    }
    printf("\n"); free(prompt_tokens);
}


// ----------------------------------------------------------------------------
// CLI
#ifndef TESTING

void error_usage() {
    fprintf(stderr, "Usage:   run [options]\n"); // checkpoint_path 不再是必需参数
    fprintf(stderr, "Example: run -n 256 -i \"Once upon a time\"\n");
    fprintf(stderr, "Options:\n");
    fprintf(stderr, "  -t <float>  temperature in [0,inf], default 1.0\n");
    fprintf(stderr, "  -p <float>  p value in top-p (nucleus) sampling in [0,1] default 0.9\n");
    fprintf(stderr, "  -s <int>    random seed, default time(NULL)\n");
    fprintf(stderr, "  -n <int>    number of steps to run for, default 256. 0 = max_seq_len\n");
    fprintf(stderr, "  -i <string> input prompt\n");
    // tokenizer_path 不再需要从命令行指定
    // fprintf(stderr, "  -z <string> optional path to custom tokenizer\n");
    fprintf(stderr, "  -m <string> mode: generate|chat, default: generate\n");
    fprintf(stderr, "  -y <string> (optional) system prompt in chat mode\n");
    exit(EXIT_FAILURE);
}

int main(int argc, char *argv[]) {
    // char *checkpoint_path = NULL; // 不再需要
    // char *tokenizer_path = "tokenizer.bin"; // 不再需要
    float temperature = 1.0f;
    float topp = 0.9f;
    int steps = 256;
    char *prompt = NULL;
    unsigned long long rng_seed = 0;
    char *mode = "generate";
    char *system_prompt = NULL;

    // 解析命令行参数 (注意：argv[0] 是程序名，参数从 argv[1] 开始)
    // 由于 checkpoint_path 不再是第一个固定参数，需要调整解析逻辑
    for (int i = 1; i < argc; i+=2) { // 从 1 开始，因为 argv[0] 是程序名
        if (i + 1 >= argc) { error_usage(); }
        if (argv[i][0] != '-') { error_usage(); }
        if (strlen(argv[i]) != 2) { error_usage(); }
        if (argv[i][1] == 't') { temperature = atof(argv[i + 1]); }
        else if (argv[i][1] == 'p') { topp = atof(argv[i + 1]); }
        else if (argv[i][1] == 's') { rng_seed = strtoull(argv[i + 1], NULL, 10); }
        else if (argv[i][1] == 'n') { steps = atoi(argv[i + 1]); }
        else if (argv[i][1] == 'i') { prompt = argv[i + 1]; }
        // else if (argv[i][1] == 'z') { tokenizer_path = argv[i + 1]; } // 移除
        else if (argv[i][1] == 'm') { mode = argv[i + 1]; }
        else if (argv[i][1] == 'y') { system_prompt = argv[i + 1]; }
        else { error_usage(); }
    }

    if (rng_seed == 0) rng_seed = (unsigned long long)time(NULL);
    if (temperature < 0.0) temperature = 0.0;
    if (topp < 0.0 || 1.0 < topp) topp = 0.9;
    if (steps <= 0) steps = 0;

    Transformer transformer;
    build_transformer(&transformer); // 不再传递路径
    if (steps == 0 || steps > transformer.config.seq_len) steps = transformer.config.seq_len;

    Tokenizer tokenizer;
    build_tokenizer(&tokenizer, transformer.config.vocab_size); // 不再传递路径

    Sampler sampler;
    build_sampler(&sampler, transformer.config.vocab_size, temperature, topp, rng_seed);

    if (strcmp(mode, "generate") == 0) {
        generate(&transformer, &tokenizer, &sampler, prompt, steps);
    } else if (strcmp(mode, "chat") == 0) {
        chat(&transformer, &tokenizer, &sampler, prompt, system_prompt, steps);
    } else {
        fprintf(stderr, "unknown mode: %s\n", mode);
        error_usage();
    }

    free_sampler(&sampler);
    free_tokenizer(&tokenizer);
    free_transformer(&transformer);
    return 0;
}
#endif
