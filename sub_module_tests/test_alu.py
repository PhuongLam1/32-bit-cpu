import cocotb 
from cocotb.triggers import Timer 
@cocotb.test() 
async def test_alu(dut):
    
    # AND operation
    dut.alu_control.value = 0b0000 
    dut.operand_a.value = 0b1100
    dut.operand_b.value = 0b1010
    await Timer(1, units='ns')
    assert dut.alu_result.value == 0b1000, f"Expected result to be 0b1000, but got {dut.alu_result.value}"
 
    
    # OR operation
    dut.alu_control.value = 0b0001 
    dut.operand_a.value = 0b1100
    dut.operand_b.value = 0b1010
    await Timer(1, units='ns')
    assert dut.alu_result.value == 0b1110, f"Expected result to be 0b1110, but got {dut.alu_result.value}"
    
    # ADD operation
    dut.alu_control.value = 0b0010
    dut.operand_a.value = 5
    dut.operand_b.value = 3
    await Timer(1, units='ns')
    assert dut.alu_result.value == 8, f"Expected result to be 8, but got {dut.alu_result.value}"
    
    # SUB operation
    dut.alu_control.value = 0b0110
    dut.operand_a.value = 5
    dut.operand_b.value = 3
    await Timer(1, units='ns')
    assert dut.alu_result.value == 2, f"Expected result to be 2, but got {dut.result.value}"
    
    # SLT - true case
    dut.operand_a.value = 3
    dut.operand_b.value = 10
    dut.alu_control.value = 0b0111
    await Timer(1, units='ns')
    assert dut.alu_result.value == 1, f"SLT true: expected 1, got {dut.alu_result.value}"

    # SLT - false case
    dut.operand_a.value = 10
    dut.operand_b.value = 3
    dut.alu_control.value = 0b0111
    await Timer(1, units='ns')
    assert dut.alu_result.value == 0, f"SLT false: expected 0, got {dut.alu_result.value}"
    
    # SLL
    dut.operand_a.value = 1
    dut.operand_b.value = 4
    dut.alu_control.value = 0b1110
    await Timer(1, units='ns')
    assert dut.alu_result.value == 16, f"SLL: expected 16, got {dut.alu_result.value}"

    # SRL
    dut.operand_a.value = 16
    dut.operand_b.value = 4
    dut.alu_control.value = 0b1111
    await Timer(1, units='ns')
    assert dut.alu_result.value == 1, f"SRL: expected 1, got {dut.alu_result.value}"   
    
    
    
    