// Multiplexer (MUX) Module
// This module implements a 2-to-1 multiplexer, which selects between two inputs (A and B)
// based on the value of the selector signal (S). If S is 1, the output Y is B; 
// if S is 0, the output Y is A.

module MUX (
    input A,      // Input A (1-bit)
    input B,      // Input B (1-bit)
    input S,      // Selector signal (1-bit)
    output Y      // Output Y (1-bit)
);

// The output Y is determined based on the selector signal S.
// If S is 1, Y = B; if S is 0, Y = A.
assign Y = S ? B : A;

endmodule
