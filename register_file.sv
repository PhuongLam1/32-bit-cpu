// register file
module register_file (
    // basic signals
    input logic clk,
    input logic rst,

    //read register 
    input logic [4:0] read_addr1,
    input logic [4:0] read_addr2,
    output logic [31:0] read_data1,
    output logic [31:0] read_data2,

    // write register
    input logic [4:0] write_addr,
    input logic [31:0] write_data,
    input logic write_enable
);

    // Define the register file with 32 registers, each 32 bits wide
    reg [31:0] registers [31:0];

    // Read operation
    always @(*) begin
        read_data1 = registers[read_addr1];
        read_data2 = registers[read_addr2];
    end

    // Write operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers to zero on reset
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (write_enable) begin
            // Write data to the specified register if write_enable is high
            registers[write_addr] <= write_data;
        end
    end
endmodule  
