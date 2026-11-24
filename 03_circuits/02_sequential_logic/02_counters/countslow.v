module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        q <= reset || (q == 4'b1001 && slowena == 1) ? 4'b0000 : slowena ? q + 1 : q;
    end

endmodule
