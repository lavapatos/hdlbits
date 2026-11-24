module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [4:0] aux;
    genvar i;
    assign aux[0] = cin;
    generate
        for (i = 0; i < 4; i++) begin : generated
            bcd_fadd adder (.a(a[4*i+:4]), 
                            .b(b[4*i+:4]), 
                            .cin(aux[i]), 
                            .cout(aux[i+1]), 
                            .sum(sum[4*i+:4])
                                     );
        end
    endgenerate
    assign cout = aux[4];
endmodule
