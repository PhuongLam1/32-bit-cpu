module alu (
    input logic [31:0] operand_a,
    input logic [31:0] operand_b,
    input logic [3:0] alu_control,
    output logic [31:0] alu_result,
    output logic zero_flag, 
    output logic negative_flag, 
    output logic overflow_flag

); 

    always_comb begin
        case (alu_control)
            4'b0000: alu_result = operand_a & operand_b; // AND
            4'b0001: alu_result = operand_a | operand_b; // OR
            4'b0010: alu_result = operand_a + operand_b; // ADD
            4'b0110: alu_result = operand_a - operand_b; // SUBTRACT
            4'b0111: alu_result = (operand_a < operand_b) ? 32'b1 : 32'b0; // SLT
            4'b1100: alu_result = ~(operand_a | operand_b); // NOR
            4'b1101: alu_result = operand_a ^ operand_b; // XOR
            4'b1110: alu_result = operand_a << operand_b[4:0]; // SLL
            4'b1111: alu_result = operand_a >> operand_b[4:0]; // SRL

            default: alu_result = 32'b0; // Default case
        endcase

        zero_flag = (alu_result == 32'b0); // Set zero flag if result is zero
        negative_flag = alu_result[31]; // Set negative flag if result is negative (MSB is 1) 
    end

endmodule
