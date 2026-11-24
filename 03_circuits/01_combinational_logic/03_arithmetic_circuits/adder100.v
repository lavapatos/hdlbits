module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [100:0] aux;
    assign aux[0] = cin;
    genvar i;
    generate
        for (i = 0; i < 100; i++) begin : generated
        	assign sum[i] = a[i]^b[i]^aux[i];
        	assign aux[i+1] = a[i]&b[i] | (aux[i] & (a[i]^b[i]));
    	end
    endgenerate
    assign cout = aux[100];

endmodule
