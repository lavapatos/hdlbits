module top_module ( input clk, input d, output q );
    wire d2;
    wire d3;
    
    my_dff ff1(.clk(clk), .d(d), .q(d2));
    my_dff ff2(.clk(clk), .d(d2), .q(d3));
    my_dff ff3(.clk(clk), .d(d3), .q(q));
endmodule
