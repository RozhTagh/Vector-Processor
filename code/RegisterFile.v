module RegisterFile (clk, rst, opcode, reg_sel, data_in_1, data_in_2, 
                                             data_out_1, data_out_2, R1, R2, R3, R4);

input clk, rst;
input [1:0] opcode;
input [1:0] reg_sel;
input [511:0] data_in_1, data_in_2;
output reg [511:0] data_out_1, data_out_2, R1, R2, R3, R4;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        R1 <= 0;
        R2 <= 0;
        R3 <= 0;
        R4 <= 0;
        data_out_1 <= 0;
        data_out_2 <= 0;
    end

    else begin
        case (opcode)
            2'b00:
                case (reg_sel)
                    2'b00: #5 R1 = data_in_1;
                    2'b01: #5 R2 = data_in_1;
                    2'b10: #5 R3 = data_in_1;
                    2'b11: #5 R4 = data_in_1;
                endcase 

            2'b01:
                case (reg_sel)
                    2'b00: data_out_1 = R1;
                    2'b01: data_out_1 = R2;
                    2'b10: data_out_1 = R3;
                    2'b11: data_out_1 = R4;
                endcase

            2'b10: begin
                data_out_1 = R1;
                data_out_2 = R2;
                #20;
                R3 = data_in_1;
                R4 = data_in_2;
            end

            2'b11: begin
                data_out_1 = R1;
                data_out_2 = R2;
                #20;
                R3 = data_in_1;
                R4 = data_in_2;
            end
        endcase
    end
end

endmodule