module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] QtoP;
    ffd ff (.clk(clk), .D(in), .Q(QtoP));
    always @(posedge clk) begin
        out <= reset ? 32'b0 : ((~in & QtoP) | out);
    end

endmodule

module ffd (
    input clk,
    input [31:0] D,
    output [31:0] Q
);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule
