module instruction_memory #(
    parameter int MEM_SIZE = 64,
    // optional memory initialization file (hex). Leave empty for no init
    parameter string mem_init = ""
)(
    input  logic clk,
    input  logic rst,
    input  logic [31:0] addr,

    output logic [31:0] instruction
);

// 32-bits memory array to hold instructions 
logic [31:0] mem [0:MEM_SIZE-1]; 

// Memory initialization 
initial begin 
    if (mem_init != "") begin
        $readmemh(mem_init, mem); 
    end
end 

// Read instruction from memory 
always_comb begin
    if (rst) begin
        instruction = 32'h00000000; // Return NOP on reset
    end else begin
        instruction = mem[addr[31:2]]; // Word-aligned address
    end 
end 


endmodule
