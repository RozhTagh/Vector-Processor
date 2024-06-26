module ALU (clk, opcode, R1, R2, R3, R4);

input clk;
input [1:0] opcode;
input [511:0] R1, R2;
output reg [511:0] R3, R4;

reg signed [31:0] A [15:0];
reg signed [31:0] B [15:0];
reg signed [63:0] C [15:0];

always @(posedge clk) begin
    R3 = 512'bZ;
    R4 = 512'bZ;
    #1;

    case (opcode)
        2'b10: begin
            for (integer i = 0; i < 16; i = i + 1) begin
                A[i] = $signed(R1[i*32 +: 32]);
                B[i] = $signed(R2[i*32 +: 32]);
                C[i] = $signed(A[i] + B[i]);
                R3[i*32 +: 32] = C[i][31:0];
                R4[i*32 +: 32] = C[i][63:32];
            end
        end 
        
        2'b11: begin
            for (integer i = 0; i < 16; i = i + 1) begin
                A[i] = $signed(R1[i*32 +: 32]);
                B[i] = $signed(R2[i*32 +: 32]);
                C[i] = $signed(A[i] * B[i]);
                R3[i*32 +: 32] = C[i][31:0];
                R4[i*32 +: 32] = C[i][63:32];
            end
        end
    endcase
end

endmodule