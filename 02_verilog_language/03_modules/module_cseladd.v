module mux2to1 (
    input [15:0] I0,
    input [15:0] I1,
    input S,
    output [15:0] Y
);
    wire [15:0] S16 = {16{S}};
    assign Y = (I0 & (~S16)) | (I1 & S16);
        
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] addtoI0;
    wire [15:0] addtoI1;
    wire [15:0] lB;
    wire [15:0] hB;
    wire addtoS;
    
    add16 toI0 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(addtoI0));
    add16 toI1 (.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(addtoI1));
    add16 toIS (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(addtoS), .sum(lB));
    
    mux2to1 mux (.I0(addtoI0), .I1(addtoI1), .S(addtoS), .Y(hB));
    assign sum = {hB, lB};

endmodule
