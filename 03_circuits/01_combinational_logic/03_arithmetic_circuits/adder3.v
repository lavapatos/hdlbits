module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    genvar i;
    wire [3:0] cout_aux;
    assign cout_aux[0] = cin;
    generate
        for (i = 0; i < 3; i++) begin: generated
            fadd adder (.a(a[i]), .b(b[i]), .cin(cout_aux[i]), .cout(cout_aux[i+1]), .sum(sum[i]));
        end
    endgenerate
    assign cout = cout_aux[3:1];
endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = a&b | (cin&(a^b));

endmodule
