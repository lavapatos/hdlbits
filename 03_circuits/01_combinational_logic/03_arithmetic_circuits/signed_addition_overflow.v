module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    genvar i;
    wire [8:0] cout_aux;
    assign cout_aux[0] = 1'b0;
    generate
        for (i = 0; i < 8; i++) begin: generated
            fadd adder (.a(a[i]), .b(b[i]), .cin(cout_aux[i]), .cout(cout_aux[i+1]), .sum(s[i]));
        end
    endgenerate
    assign overflow = cout_aux[8] ^ cout_aux[7];
endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = a&b | (cin&(a^b));

endmodule
