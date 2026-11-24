module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] QtoP;
    ffd ff (.clk(clk), .D(in), .Q(QtoP));
    always @(posedge clk) begin
        anyedge <= in & ~QtoP | ~in & QtoP;
    end
    
endmodule

module ffd (
    input clk,
    input [7:0] D,
    output [7:0] Q
);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule