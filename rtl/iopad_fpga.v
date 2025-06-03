module PB8W(
    inout PAD,
    output C,
    input I,
    input OEN
);

assign PAD = OEN ? 1'bz : I;
assign C = PAD;

endmodule

module PO8W(
    output PAD,
    input I
);

assign PAD = I;

endmodule

module PIW(
    input PAD,
    output C
);

assign C = PAD;

endmodule

module PIUW(
    input PAD,
    output C
);

assign C = PAD;

endmodule

module PX3W(
    input XIN,
    output XOUT,
    output XC
);

assign XOUT = 1'b0;
assign XC = XIN;

endmodule