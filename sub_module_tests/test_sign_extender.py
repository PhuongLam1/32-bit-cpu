import cocotb 
from cocotb.triggers import Timer 
@cocotb.test()
async def test_sign_extender(dut): 

    dut.in_data.value = 0x8000 #16-bit value msb=1 
    await Timer(1, units='ns')
    assert dut.out_data.value == 0xFFFF8000, f"Expected sign extended output to be 0xFFFF8000, but got {dut.out_data.value}"
    
