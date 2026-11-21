module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire sub_to_nosub;
    wire [31:0] xorgate;
    wire [31:0] sub32;
    assign sub32 = {32{sub}};
    assign xorgate = b^sub32;
    wire [15:0] lB;
    wire [15:0] hB;
    
    add16 yessub (.a(a[15:0]), .b(xorgate[15:0]), .cin(sub), .sum(lB), .cout(sub_to_nosub));
    add16 notsub (.a(a[31:16]), .b(xorgate[31:16]), .cin(sub_to_nosub), .sum(hB));
    
    assign sum = {hB, lB};

endmodule
