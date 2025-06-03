`ifndef IOPAD_H
`define IOPAD_H

`define IOPAD_GEN(IN,OUT) wire OUT``_i, OUT``_o, OUT``_oe; \
    PB8W IN``_iopad( \
        .PAD(IN), \
        .C(OUT``_i), \
        .I(OUT``_o), \
        .OEN(OUT``_oe) \
    );

`define IOPAD_GEN_VEC(IN,OUT) wire [$bits(IN)-1:0] OUT``_i, OUT``_o,OUT``_oe; \
    genvar IN``_gen_var; \
    generate \
        for(IN``_gen_var = 0; IN``_gen_var<$bits(IN); IN``_gen_var = IN``_gen_var + 1) begin:IN``_buf_gen \
            PB8W IN``_iopad( \
                .PAD(IN[IN``_gen_var]), \
                .C(OUT``_i[IN``_gen_var]), \
                .I(OUT``_o[IN``_gen_var]), \
                .OEN(OUT``_oe[IN``_gen_var]) \
            ); \
        end \
    endgenerate

`define OPAD_GEN(IN,OUT) wire OUT``_o; \
    PO8W IN``_opad( \
        .PAD(IN), \
        .I(OUT``_o) \
    );

`define OPAD_GEN_VEC(IN,OUT) wire [$bits(IN)-1:0] OUT``_o; \
    genvar IN``_gen_var; \
    generate \
        for(IN``_gen_var = 0; IN``_gen_var<$bits(IN); IN``_gen_var = IN``_gen_var + 1) begin:IN``_buf_gen \
            PO8W IN``_opad( \
                .PAD(IN[IN``_gen_var]), \
                .I(OUT``_o[IN``_gen_var]) \
            ); \
        end \
    endgenerate

`define IPAD_GEN(IN,OUT) wire OUT``_i; \
    PIW IN``_ipad( \
        .PAD(IN), \
        .C(OUT``_i) \
    );

`define IPAD_GEN_VEC(IN,OUT) wire [$bits(IN)-1:0] OUT``_i; \
    genvar IN``_gen_var; \
    generate \
        for(IN``_gen_var = 0; IN``_gen_var<$bits(IN); IN``_gen_var = IN``_gen_var + 1) begin:IN``_buf_gen \
            PIW IN``_ipad( \
                .PAD(IN[IN``_gen_var]), \
                .C(OUT``_i[IN``_gen_var]) \
            ); \
        end \
    endgenerate

`define IPADU_GEN(IN,OUT) wire OUT``_i; \
    PIUW IN``_ipad( \
        .PAD(IN), \
        .C(OUT``_i) \
    );

`define IOPAD_GEN_SIMPLE(IN) `IOPAD_GEN(IN,IN)
`define IOPAD_GEN_VEC_SIMPLE(IN) `IOPAD_GEN_VEC(IN,IN)
`define OPAD_GEN_SIMPLE(IN) `OPAD_GEN(IN,IN)
`define OPAD_GEN_VEC_SIMPLE(IN) `OPAD_GEN_VEC(IN,IN)
`define IPAD_GEN_SIMPLE(IN) `IPAD_GEN(IN,IN)
`define IPAD_GEN_VEC_SIMPLE(IN) `IPAD_GEN_VEC(IN,IN)
`define IPADU_GEN_SIMPLE(IN) `IPADU_GEN(IN,IN)

`endif