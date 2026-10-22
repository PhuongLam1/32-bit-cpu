# 32-bit-cpu

A 32-bit single-cycle RISC-V-style CPU written in SystemVerilog, built block by block and verified with cocotb + Icarus Verilog.

**Status:** work in progress. The datapath building blocks are done and unit-tested. Control unit, data memory, and the top-level core are next.

## Modules (`rtl/`)

| Module | What it does |
| --- | --- |
| `alu.sv` | 32-bit ALU: AND, OR, ADD, SUB, SLT, NOR, XOR, SLL, SRL, with zero and negative flags |
| `register_file.sv` | 32 x 32-bit registers, two combinational read ports, one synchronous write port, async reset |
| `instruction_memory.sv` | Word-aligned instruction ROM, initialized from `program.hex` through `$readmemh` |
| `sign_extender.sv` | Parameterized sign extension (default 16 to 32 bits) |

## Testing

Each module has a cocotb testbench in `sub_module_tests/`. Requires Icarus Verilog and cocotb (`pip install cocotb`).

```bash
make test-all                    # run every module's tests
make TARGET_MODULE=alu           # run one module (alu, register_file, instruction_memory, sign_extender)
```

## Roadmap

- [ ] Control unit and ALU decoder
- [ ] Data memory
- [ ] Top-level single-cycle datapath
- [ ] Overflow flag in the ALU (declared, not yet driven)
- [ ] Run a test program end to end, add a block diagram and waveform
- [ ] Synthesize and run on an FPGA board

## AI disclosure

Claude was used in this project to help fix bugs and syntax. Any AI-generated lines were manually reviewed and understood before being added to the repo.
