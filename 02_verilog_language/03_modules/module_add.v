module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire l_to_h;
    wire [15:0] lowerB;
    wire [15:0] higherB;
    
    add16 low(.a(a[15:0]) ,.b(b[15:0]), .cin(1'b0), .sum(lowerB), .cout(l_to_h));
    add16 high(.a(a[31:16]) , .b(b[31:16]), .cin(l_to_h), .sum(higherB));
    
    assign sum = {higherB, lowerB};
    

endmodule
