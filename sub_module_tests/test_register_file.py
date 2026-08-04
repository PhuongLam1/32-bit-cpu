import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.clock import Clock 
@cocotb.test()
async def test_register_file(dut):
    cocotb.start_soon(Clock(dut.clk, 10, units='ns').start())
    
    #Reset the DUT 
    dut.rst.value = 1  
    await RisingEdge(dut.clk) 
    dut.rst.value = 0 #release reset 
    
    #writing operation
    dut.write_enable.value = 1 
    dut.write_addr.value = 5
    dut.write_data.value = 0xDEADBEEF
    await RisingEdge(dut.clk) #wait for the next clock edge to perform the write operation 
    dut.write_enable.value = 0 
    
    
    #read back 
    dut.read_addr1.value = 5
    dut.read_addr2.value = 0
    
    await Timer(1, units='ns')
    
    assert dut.read_data1.value == 0xDEADBEEF, f"Expected read data 1 to be 0xDEADBEEF, but got {dut.read_data1.value}"
    assert dut.read_data2.value == 0x00000000, f"Expected read data 2 to be 0x00000000, but got {dut.read_data2.value}"
    

    
    
