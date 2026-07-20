# simulator to use (Icarus, Verilator, Questa, Xcelium, Riviera, VCS)
SIM ?= icarus
# what language to use (verilog, systemverilog, vhdl) 
TOPLEVEL_LANG ?= verilog
# where the mut are located
VERILOG_SOURCES = $(shell pwd)/rtl/instruction_memory.sv
# my top module 
COCOTB_TOPLEVEL = instruction_memory
# location of python tests
export PYTHONPATH := $(shell pwd)/tests
# my test module 
COCOTB_TEST_MODULES = test_instruction_memory

# initialize memory
COMPILE_ARGS += -g2012
COMPILE_ARGS += -P instruction_memory.mem_init=\"program.hex\"
# cocotb rules
include $(shell cocotb-config --makefiles)/Makefile.sim