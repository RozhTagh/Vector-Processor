This project implements a vector processor in Verilog, composed of three main modules: `Memory`, `ALU`, and `RegisterFile`. These modules are combined in the `processor` module to create a functional vector processor capable of performing various arithmetic operations and memory transactions.

## Project Structure

The project consists of the following Verilog files:

- `Memory.v`
- `ALU.v`
- `RegisterFile.v`
- `Processor.v`

### Module Descriptions

#### Memory Module

The `Memory` module handles memory read and write operations. It uses a memory array initialized from an external file. The operations are controlled by the `opcode` input.

**Ports:**
- `clk`: Clock signal
- `opcode`: Operation code (3-bit)
- `in`: Input data (512-bit)
- `mem_addr`: Memory address (9-bit)
- `out`: Output data (512-bit)

#### ALU Module

The `alu` module performs arithmetic operations on vector data. It supports addition and multiplication based on the `opcode` input.

**Ports:**
- `clk`: Clock signal
- `opcode`: Operation code (3-bit)
- `R1`: First input operand (512-bit)
- `R2`: Second input operand (512-bit)
- `R3`: Lower 32 bits of the result (512-bit)
- `R4`: Upper 32 bits of the result (512-bit)

#### RegisterFile Module

The `RegisterFile` module manages a set of registers and allows reading from and writing to them based on the `opcode` and `reg_sel` inputs.

**Ports:**
- `clk`: Clock signal
- `rst`: Reset signal
- `opcode`: Operation code (3-bit)
- `reg_sel`: Register selector (2-bit)
- `data_in_1`: First input data (512-bit)
- `data_in_2`: Second input data (512-bit)
- `data_out_1`: First output data (512-bit)
- `data_out_2`: Second output data (512-bit)
- `R1`, `R2`, `R3`, `R4`: Register outputs (512-bit each)

#### Processor Module

The `processor` module integrates the `Memory`, `alu`, and `RegisterFile` modules to form a complete vector processor.

**Ports:**
- `clk`: Clock signal
- `rst`: Reset signal
- `opcode`: Operation code (3-bit)
- `reg_sel`: Register selector (2-bit)
- `mem_addr`: Memory address (9-bit)
- `R1`, `R2`, `R3`, `R4`: Register outputs (512-bit each)

## Usage

To use this vector processor, follow these steps:

1. Ensure you have a Verilog simulation environment set up.
2. Place all Verilog files (`Memory.v`, `alu.v`, `RegisterFile.v`, `processor.v`) in the same directory.
3. Include the modules in your testbench as needed.
4. Compile and simulate the processor module using your preferred Verilog simulator.
