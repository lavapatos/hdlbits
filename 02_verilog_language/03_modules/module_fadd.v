module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] l_b;
    wire [15:0] h_b;
    wire co_to_ci;
    
    add16 lower(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(l_b), .cout(co_to_ci));
    add16 ligher(.a(a[31:16]), .b(b[31:16]), .cin(co_to_ci), .sum(h_b));
    
    assign sum = {h_b, l_b};

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign sum = (a^b)^cin;
    assign cout = (a&b)^((a^b)&cin);

endmodule
