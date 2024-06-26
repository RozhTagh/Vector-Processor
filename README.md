# Vector Processor Project

This project implements a vector processor in Verilog, composed of three main modules: `Memory`, `ALU`, and `RegisterFile`. These modules are combined in the `Processor` module to create a functional vector processor capable of performing various arithmetic operations and memory transactions.

!(https://www.google.com/search?sca_esv=bc51fb84cfcf9cf4&sxsrf=ADLYWIJcLEsi3NJJAWsDY9GNgHWzHxm0mQ:1719431452159&q=logo+processor&uds=ADvngMgawzqrJVNauqg4Zv1Lc70lvpQaePwLmu7Lcb5qS7SAJZyROsFy6HxqQ6_22orDKUCMG5Gu_7K5vmUUv-pXRY_9UFLEjpnVIZdGNmnErS55I-zqOvSc11AmS86flq8bTFgM3h7e&udm=2&sa=X&ved=2ahUKEwiFna-nhfqGAxUOTKQEHchwDuIQxKsJegQICxAB&ictx=0&biw=1440&bih=813&dpr=2#vhid=hF27RS8X103GQM&vssid=mosaic)

## Project Structure

The project consists of the following Verilog files:

- `Memory.v`
- `ALU.v`
- `RegisterFile.v`
- `Processor.v`
- `Processor_TB.v`

### Module Descriptions

#### Memory Module

The `Memory` module handles memory read and write operations. It uses a memory array initialized from an external file. The operations are controlled by the `opcode` input.

**Ports:**
- `clk`: Clock signal
- `opcode`: Operation code (2-bit)
- `in`: Input data (512-bit)
- `mem_addr`: Memory address (9-bit)
- `out`: Output data (512-bit)

#### ALU Module

The `ALU` module performs arithmetic operations on vector data. It supports addition and multiplication based on the `opcode` input.

**Ports:**
- `clk`: Clock signal
- `opcode`: Operation code (2-bit)
- `R1`: First input operand (512-bit)
- `R2`: Second input operand (512-bit)
- `R3`: Lower 32 bits of the result (512-bit)
- `R4`: Upper 32 bits of the result (512-bit)

#### RegisterFile Module

The `RegisterFile` module manages a set of registers and allows reading from and writing to them based on the `opcode` and `reg_sel` inputs.

**Ports:**
- `clk`: Clock signal
- `rst`: Reset signal
- `opcode`: Operation code (2-bit)
- `reg_sel`: Register selector (2-bit)
- `data_in_1`: First input data (512-bit)
- `data_in_2`: Second input data (512-bit)
- `data_out_1`: First output data (512-bit)
- `data_out_2`: Second output data (512-bit)
- `R1`, `R2`, `R3`, `R4`: Register outputs (512-bit each)

#### Processor Module

The `Processor` module integrates the `Memory`, `ALU`, and `RegisterFile` modules to form a complete vector processor.

**Ports:**
- `clk`: Clock signal
- `rst`: Reset signal
- `instruction`: Instruction (13-bit)
- `R1`, `R2`, `R3`, `R4`: Register outputs (512-bit each)

### Example Testbench

The `Processor_TB` module provides an example testbench to verify the functionality of the `Processor` module.


## Usage

To run the testbench, you'll need to have either ModelSim or `iverilog` installed on your computer. You can run the testbench with `iverilog` on macOS using the following command:
```cd code
iverilog -o test processor_tb2.v processor.v
vvp test```

## Authors
- [Rozhin Taghizadegan](https://github.com/RozhTagh)
