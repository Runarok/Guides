// Quartus Prime Verilog Template
// Single-Port RAM with single read/write address
// This module implements a simple RAM with read/write capability on a single address line.
// It uses a clocked process for write operations and registers the address for reading.

module MemoryTemplateSASS 
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=6)
(
    input [(DATA_WIDTH-1):0] data,           // Data input (to be written to RAM)
    input [(ADDR_WIDTH-1):0] addr,           // Address input (location in RAM)
    input we,                                // Write enable signal (when '1', data is written)
    input clk,                               // Clock signal for synchronization
    output [(DATA_WIDTH-1):0] q             // Data output (read from RAM)
);

    // Declare a memory array (RAM) of size 2^ADDR_WIDTH, each element is DATA_WIDTH bits wide
    reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

    // Register for the address to synchronize with the read process
    reg [ADDR_WIDTH-1:0] addr_reg;

    // Always block to handle write operations and address registration
    always @ (posedge clk)
    begin
        // Perform write operation when write enable (we) is active
        if (we)
            ram[addr] <= data;  // Write the data to the RAM at the specified address

        // Register the current address to ensure stable read operations
        addr_reg <= addr;
    end

    // Continuous assignment to read data from RAM
    // The registered address (addr_reg) is used to access the RAM contents
    // so the read operation is synchronized with the clock.
    assign q = ram[addr_reg];  // Output the data stored at the registered address

endmodule
