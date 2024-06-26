module Processor_TB();

reg clk = 0, rst = 0;
reg [12:0] instruction;
wire signed [511:0] R1;
wire signed [511:0] R2;
wire signed [511:0] R3;
wire signed [511:0] R4;

Processor Processor1 (clk, rst, instruction, R1, R2, R3, R4);

always
    #5 clk <= ~clk;

initial begin
    // write instructions here
end

task reset_processor;
    begin
        rst = 1;
        #10; // Wait for reset to complete
        rst = 0;
        $display("After reset: \nR1 = %h, \nR2 = %h, \nR3 = %h, \nR4 = %h\n", R1, R2, R3, R4);
    end
endtask

task load_memory_to_register (input [8:0] addr, input [1:0] reg_num);
    begin
        instruction[12:11] = 2'b00;
        instruction[10:9] = reg_num;
        instruction[8:0] = addr;
        #100;  // Wait for read to complete
        $display("After load: \nR1 = %h, \nR2 = %h, \nR3 = %h, \nR4 = %h\n", R1, R2, R3, R4);
    end
endtask

task store_register_in_memory (input [8:0] addr, input [1:0] reg_num);
    begin
        instruction[12:11] = 2'b01;
        instruction[10:9] = reg_num;
        instruction[8:0] = addr;
        #100; // Wait for write to complete
        $display("Store R%0h in memory\n", reg_num+1);
    end
endtask

task alu_add();
    begin
        instruction[12:11] = 2'b10;
        instruction[10:0] = 11'bZ;
        #100;  // Wait for ALU addition to complete
        $display("ALU add result: \nR1 = %h, \nR2 = %h, \nR3 = %h, \nR4 = %h\n", R1, R2, R3, R4);
    end
endtask

task alu_multiply();
    begin
        instruction[12:11] = 2'b11;
        instruction[10:0] = 11'bZ;
        #100;  // Wait for ALU multiplication to complete
        $display("ALU multiplication result: \nR1 = %h, \nR2 = %h, \nR3 = %h, \nR4 = %h\n", R1, R2, R3, R4);
    end
endtask

endmodule