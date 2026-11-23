module top_module( 
    input [254:0] in,
    output [7:0] out );
    int count;
    always @(*) begin
        count = 0;
        for (int i = 0; i < 255; i++)
            if (in[i] == 1) begin
                count++;
            end
    end
    assign out = count;

endmodule
