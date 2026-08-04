# simulator to use (Icarus, Verilator, Questa, Xcelium, Riviera, VCS)
SIM ?= icarus
# what language to use (verilog, systemverilog, vhdl) 
TOPLEVEL_LANG ?= verilog

TARGET_MODULE ?= instruction_memory
# where the mut are located
VERILOG_SOURCES = $(shell pwd)/rtl/alu.sv \
$(shell pwd)/rtl/instruction_memory.sv \
$(shell pwd)/rtl/register_file.sv \
$(shell pwd)/rtl/sign_extender.sv
# my top module 
COCOTB_TOPLEVEL = $(TARGET_MODULE)
# location of python tests
export PYTHONPATH := $(shell pwd)/sub_module_tests
# my test module 
COCOTB_TEST_MODULES = test_$(TARGET_MODULE)

# initialize memory
ifeq ($(TARGET_MODULE),instruction_memory)
	COMPILE_ARGS += -g2012
	COMPILE_ARGS += -P instruction_memory.mem_init=\"program.hex\"
endif

include $(shell cocotb-config --makefiles)/Makefile.sim

# run every module's tests in sequence
MODULES = alu instruction_memory register_file sign_extender

.PHONY: test-all
test-all:
	@for m in $(MODULES); do \
		echo "=== Testing $$m ==="; \
		$(MAKE) TARGET_MODULE=$$m clean; \
		$(MAKE) TARGET_MODULE=$$m all; \
	done
