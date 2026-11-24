module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    always @(posedge clk) begin
        Q <= L&r_in | ~L&q_in;
    end
    

endmodule
/*
module ffd_mux (input clk, input S, input I0, input I1, output Q);
    always @(posedge clk) begin
        Q <= S&I1 | ~SI0;
    end
endmodule
*/