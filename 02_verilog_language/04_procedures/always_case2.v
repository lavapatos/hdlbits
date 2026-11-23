// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
        case (in[0])
            0:
                case(in[1])
                    0:
                        case(in[2])
                            0:
                                case(in[3])
                                    0: pos = {2'd0};
                                    default: pos = {2'd3};
                                endcase
                            default: pos = {2'd2};
                        endcase
                    default: pos = {2'd1};
                endcase
            default: pos = {2'd0};
        endcase
    end
        

endmodule
