`include "RegisterFile.v"
`include "ALU.v"
`include "Memory.v"

module Processor (clk, rst, instruction, R1, R2, R3, R4);

input clk, rst;
input [12:0] instruction;
output signed [511:0] R1, R2, R3, R4;

wire signed [511:0] data_in_1, data_in_2, data_out_1, data_out_2;

wire [1:0] opcode = instruction[12:11];
wire [1:0] reg_sel = instruction[10:9];
wire [8:0] mem_addr = instruction[8:0];

RegisterFile reg_file1 (clk, rst, opcode, reg_sel, data_in_1, data_in_2, data_out_1, data_out_2, R1, R2, R3, R4);

ALU ALU1 (clk, opcode, data_out_1, data_out_2, data_in_1, data_in_2);

Memory mem1 (clk, opcode, data_out_1, mem_addr, data_in_1);

endmodule