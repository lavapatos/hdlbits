module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always @(posedge clk) begin
        Q <= L&R | ~L&(~E&Q | E&w);
    end

endmodule
