module Memory (clk, opcode, in, mem_addr, out);

input clk;
input [1:0] opcode;
input [511:0] in;
input [8:0] mem_addr;
output reg [511:0] out;

reg [31:0] memory [0:511];
wire [8:0] aligned_addr;
assign aligned_addr = mem_addr - (mem_addr % 16);

initial begin
    $readmemh("hex_file.txt", memory);
end

integer i;
always @(posedge clk) begin
    out = 512'bZ;

    case (opcode)
        2'b00: begin
            for (i = 0; i < 16; i = i + 1) 
                out[i*32 +: 32] <= memory[aligned_addr + i];
        end 
        
        2'b01: begin
            #5;
            for (i = 0; i < 16; i = i + 1) 
                memory[aligned_addr + i] <= in[i*32 +: 32];
        end
    endcase
end

endmodule
