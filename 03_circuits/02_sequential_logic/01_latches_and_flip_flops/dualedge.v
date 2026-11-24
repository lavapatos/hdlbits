module top_module (
    input clk,
    input d,
    output q
);
    reg pos2I1;
    reg neg2I2;
    wire Y2q;
    
    always @(posedge clk) begin
        pos2I1 <= d;
    end
    
    always @(negedge clk) begin
        neg2I2 <= d;
    end
    
    mux2to1 mux (.I1(pos2I1), .I2(neg2I2), .S(clk), .Y(Y2q));
    assign q = Y2q;
    

endmodule

module mux2to1 (
    input I1,
    input I2,
    input S,
    output Y
);
    assign Y = I1&S | I2&~S;
endmodule
