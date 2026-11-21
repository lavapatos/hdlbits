module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] q1;
    wire [7:0] q2;
    wire [7:0] q3;
    
    my_dff8 ff1(.clk(clk), .d(d), .q(q1));    
    my_dff8 ff2(.clk(clk), .d(q1), .q(q2));
    my_dff8 ff3(.clk(clk), .d(q2), .q(q3));
	
    mux_4_to_1 y(.A0(d), .B1(q1), .C2(q2), .D3(q3), .sel(sel), .q(q));
endmodule

module mux_4_to_1 ( 
    input [7:0] A0, 
    input [7:0] B1, 
    input [7:0] C2, 
    input [7:0] D3, 
    input [1:0] sel, 
    output [7:0] q 
);
    always @(*) begin
        case(sel)
            2'b00: begin
                q = A0;
            end
            2'b01: begin
                q = B1;
            end
            2'b10: begin
                q = C2;
            end
            default: begin
                q = D3;
            end
        endcase
    end
endmodule