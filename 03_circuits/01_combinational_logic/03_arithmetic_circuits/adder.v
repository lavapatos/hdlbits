module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    genvar i;
    wire [4:0] cout_aux;
    assign cout_aux[0] = 1'b0;
    generate
        for (i = 0; i < 4; i++) begin: generated
            fadd adder (.a(x[i]), .b(y[i]), .cin(cout_aux[i]), .cout(cout_aux[i+1]), .sum(sum[i]));
        end
    endgenerate
    assign sum[4] = cout_aux[4];
endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = a&b | (cin&(a^b));

endmodule
