module top_module (
    input clk,
    input x,
    output z
);
    wire z1;
    wire z2;
    wire z3;
    wire retro2;
    wire retro3;
    
    ffd ff1(.clk(clk), .D(x ^ z1), .Q(z1));
    ffd ff2(.clk(clk), .D(x & retro2), .Q(z2), .nQ(retro2));
    ffd ff3(.clk(clk), .D(x | retro3), .Q(z3), .nQ(retro3));
    assign z = ~(z1 | z2 | z3);
    
endmodule

module ffd (
    input clk,
    input D,
    output Q,
    output nQ
);
    always @(posedge clk) begin
        Q <= D;
    end
    assign nQ = ~Q;
    
endmodule

