import cocotb
from cocotb.triggers import Timer 
@cocotb.test()
async def test_instruction_memory(dut):

    # Reset the DUT 
    dut.rst.value = 1 # if rst is on, the instruction memory will be reset to 0
    dut.addr.value = 0 # otherwise, the instruction memory will output the instruction at the given address or "run"
    await Timer(10, units='ns')
    assert dut.instruction.value == 0, f"Expected instruction to be 0, but got {dut.instruction.value}"
    
    # Release reset 
    dut.rst.value = 0 
    
    # First instruction 
    dut.addr.value = 0 
    await Timer(1, units='ns') 
    assert dut.instruction.value == 0x00000000, f"Expected instruction to be 0x00000000, but got {dut.instruction.value}"
    
    # Second instruction 
    dut.addr.value = 4 
    await Timer(1, units='ns')
    assert dut.instruction.value == 0x00000001, f"Expected instruction to be 0x00000001, but got {dut.instruction.value}"
    
    # Third instruction
    dut.addr.value = 8
    await Timer(1, units='ns')
    assert dut.instruction.value == 0x00000002, f"Expected instruction to be 0x00000002, but got {dut.instruction.value}"
    
    
    
    
    
