module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [100:0] carry;
    assign carry[0] = cin;
    genvar i;
    generate
        for (i = 3; i < 400; i = i+4) begin: generated
            bcd_fadd adder (.a(a[i:i-3]), 
                            .b(b[i:i-3]), 
                            .cin(carry[i-(3*((i+1)/4))]), 
                            .cout(carry[i-(3*((i+1)/4))+1]), 
                            .sum(sum[i:i-3]));
        end
    endgenerate
    assign cout = carry[100];
            

endmodule
