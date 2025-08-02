// ============================================================
// File Name: MemoryIP.v
// Megafunction Name: altsyncram
//
// Simulation Library Files(s): altera_mf
// ============================================================

// Copyright (C) 2025 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and any partner logic functions, 
// and any output files from any of the foregoing (including device 
// programming or simulation files), and any associated documentation 
// or information are expressly subject to the terms and conditions 
// of the Altera Program License Subscription Agreement, the Altera 
// Quartus Prime License Agreement, the Altera IP License Agreement, 
// or other applicable license agreement.

// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

// Single-Port RAM Module using altsyncram Megafunction
module MemoryIP (
    input [5:0] address,  // 6-bit address input (specifies the location in memory)
    input clock,          // Clock signal for synchronous operations
    input [7:0] data,     // 8-bit data input (data to write to memory)
    input wren,           // Write enable signal (if '1', data is written to memory)
    output [7:0] q       // 8-bit output (data read from memory)
);

// Internal wire for the output data from the RAM block
wire [7:0] sub_wire0;
assign q = sub_wire0;  // Output the data read from the RAM

// Instantiate the altsyncram megafunction
altsyncram altsyncram_component (
    .address_a (address),       // Address for RAM access
    .clock0 (clock),            // Clock signal for RAM
    .data_a (data),             // Data input to write to RAM
    .wren_a (wren),             // Write enable for RAM
    .q_a (sub_wire0),           // Data output from RAM
    .aclr0 (1'b0),              // No asynchronous reset for port A
    .aclr1 (1'b0),              // No asynchronous reset for port B (not used)
    .address_b (1'b1),          // Address for port B (not used)
    .addressstall_a (1'b0),     // No address stalling
    .addressstall_b (1'b0),     // No address stalling for port B (not used)
    .byteena_a (1'b1),          // Byte enable (always enabled)
    .byteena_b (1'b1),          // Byte enable for port B (not used)
    .clock1 (1'b1),             // Clock for port B (not used)
    .clocken0 (1'b1),           // Clock enable for port A
    .clocken1 (1'b1),           // Clock enable for port B (not used)
    .clocken2 (1'b1),           // Clock enable for port C (not used)
    .clocken3 (1'b1),           // Clock enable for port D (not used)
    .data_b (1'b1),             // Data input for port B (not used)
    .eccstatus (),              // Error checking (not used)
    .q_b (),                    // Output for port B (not used)
    .rden_a (1'b1),             // Read enable for port A
    .rden_b (1'b1),             // Read enable for port B (not used)
    .wren_b (1'b0)              // Write enable for port B (not used)
);

// Set parameters for the altsyncram component

defparam
    altsyncram_component.clock_enable_input_a            = "BYPASS",  // Bypass clock enable for input port A
    altsyncram_component.clock_enable_output_a           = "BYPASS",  // Bypass clock enable for output port A
    altsyncram_component.intended_device_family          = "MAX 10",  // Target device family
    altsyncram_component.lpm_hint                        = "ENABLE_RUNTIME_MOD=NO",  // Disable runtime modification
    altsyncram_component.lpm_type                        = "altsyncram",  // Use altsyncram type for RAM
    altsyncram_component.numwords_a                      = 64,  // Number of words in RAM (64 locations)
    altsyncram_component.operation_mode                  = "SINGLE_PORT",  // Single-port operation mode
    altsyncram_component.outdata_aclr_a                  = "NONE",  // No output data clear for port A
    altsyncram_component.outdata_reg_a                   = "CLOCK0",  // Register output data on clock0
    altsyncram_component.power_up_uninitialized         = "FALSE",  // Initialize RAM content to 0
    altsyncram_component.read_during_write_mode_port_a   = "NEW_DATA_NO_NBE_READ",  // New data read on write
    altsyncram_component.widthad_a                       = 6,  // Address width for port A (6 bits)
    altsyncram_component.width_a                         = 8,  // Data width for port A (8 bits)
    altsyncram_component.width_byteena_a                 = 1;  // Byte enable width for port A

endmodule
