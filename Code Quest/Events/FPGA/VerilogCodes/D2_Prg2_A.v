// Quartus Prime Verilog Template
// Unsigned Multiplier Module
// This module multiplies two unsigned numbers and outputs the result.

module MultiplyTemplate
#(parameter WIDTH=8)  // Parameterized WIDTH for the data width of the inputs and output
(
    input [WIDTH-1:0] dataa,       // Input operand A (WIDTH bits wide)
    input [WIDTH-1:0] datab,       // Input operand B (WIDTH bits wide)
    output [2*WIDTH-1:0] dataout   // Output product (2*WIDTH bits wide)
);

    // Assign the result of the unsigned multiplication of dataa and datab to dataout
    assign dataout = dataa * datab;

endmodule
