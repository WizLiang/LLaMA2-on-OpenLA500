#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void binary_out(FILE* out,unsigned char* mem)
{
    char tmp;
    unsigned char num[8];
    num[0] = 1;
    num[1] = 2;
    num[2] = 4;
    num[3] = 8;
    num[4] = 16;
    num[5] = 32;
    num[6] = 64;
    num[7] = 128;
    for(int i=3;i>=0;i--)
    {
        for(int j=7;j>=0;j--)
        {
            if( (mem[i] & num[j] ) != 0)
                tmp = '1';
            else
                tmp = '0';
            fprintf(out,"%c",tmp);
        }
    }
    fprintf(out,"\n");
    return;
}

int main(int argc, char** argv)
{
	FILE *in;
	FILE *out;

	if(argc < 3){
		fprintf(stderr, "Usage: convert main.bin directory\n");
		return 1;
	}

	char str_bin[256];
	// char str_coe[256], str_mif[256], str_vlog[256];
    char str_coe[256], str_base_mif[256], str_ext_mif[256], str_vlog[256];
	strncpy(str_bin, argv[2], 256);
	strncpy(str_coe, argv[2], 256);
	// strncpy(str_mif, argv[2], 256);
    strncpy(str_base_mif, argv[2], 256);
	strncpy(str_ext_mif, argv[2], 256);
	strncpy(str_vlog,argv[2], 256);
	strncat(str_bin, argv[1], 255);
	strncat(str_coe, "axi_ram.coe", 255);
    //strncat(str_mif, "axi_ram.mif", 255);
	strncat(str_base_mif, "base_ram.mif", 255);
	strncat(str_ext_mif, "ext_ram.mif", 255);
	strncat(str_vlog,"rom.vlog"   , 255);
	//printf("%s\n%s\n%s\n%s\n%s\n%s\n", str_bin, str_data, str_inst_coe, str_inst_mif, str_data_coe, str_data_mif);

	int i,j,k;
	unsigned char mem[32];

    in = fopen(str_bin, "rb");
    out = fopen(str_coe,"w");

	fprintf(out, "memory_initialization_radix = 16;\n");
	fprintf(out, "memory_initialization_vector =\n");
	while(!feof(in)) {
	    if(fread(mem,1,4,in)!=4) {
	        fprintf(out, "%02x%02x%02x%02x\n", mem[3], mem[2],	mem[1], mem[0]);
		break;
	     }
	    fprintf(out, "%02x%02x%02x%02x\n", mem[3], mem[2], mem[1],mem[0]);
        }
	fclose(in);
	fclose(out);

    in = fopen(str_bin, "rb");
    //out = fopen(str_mif,"w");
    FILE *out_base = fopen(str_base_mif,"w");
    FILE *out_ext  = fopen(str_ext_mif,"w");

	// while(!feof(in)) {
	//     if(fread(mem,1,4,in)!=4) {
    //         binary_out(out,mem);
	// 	break;
	//      }
    //         binary_out(out,mem);
    //     }
	// fclose(in);
	// fclose(out);

    unsigned char mem8[8];
    while (1) {
        size_t n = fread(mem8, 1, 8, in);
        if (n == 0) break;

        // 尾部不足 8 字节时用 0 补齐，保持两份 RAM 对齐
        if (n < 8) memset(mem8 + n, 0, 8 - n);

        // 低 32 位（mem8[0..3]）到 base
        binary_out(out_base, mem8);
        // 高 32 位（mem8[4..7]）到 ext
        binary_out(out_ext , mem8 + 4);

        if (n < 8) break; // 处理完最后一块就退出
    }

    fclose(in);
    fclose(out_base);
    fclose(out_ext);

    in = fopen(str_bin, "rb");
    out = fopen(str_vlog,"w");

    fprintf(out,"@1c000000\n");
    while(!feof(in)) {
        if (fread(mem,1,1,in) != 1) {
            fprintf(out,"%02x\n", mem[0]);
            break;
        }
        fprintf(out,"%02x\n", mem[0]);
    }
    fclose(in);
    fclose(out);

    return 0;
}
