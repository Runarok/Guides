// 3-to-8 Line Decoder Module
// This module implements a 3-to-8 decoder that converts a 3-bit input (A) to an 8-bit
// output (Y). The output Y will have exactly one bit set to '1' based on the value
// of the 3-bit input A, while all other bits in Y will be '0'. If the input A 
// is within the range [000, 111], the corresponding bit in Y will be set. If A 
// is invalid (which isn't possible here due to the 3-bit limit), the output defaults to all zeros.

module Decoder (
    input [2:0] A,    // 3-bit input (A) representing the binary value to decode
    output [7:0] Y    // 8-bit output (Y) where only one bit will be '1' based on A
);

// A ternary operator is used to check each possible value of A (from 3'b000 to 3'b111).
// The corresponding output Y will have only one bit set to '1' based on A's value.
// For example, if A = 3'b000, then Y = 8'b00000001, if A = 3'b001, then Y = 8'b00000010, and so on.
assign Y = (A == 3'b000) ? 8'b00000001 :  // If A is 000, Y is 00000001
           (A == 3'b001) ? 8'b00000010 :  // If A is 001, Y is 00000010
           (A == 3'b010) ? 8'b00000100 :  // If A is 010, Y is 00000100
           (A == 3'b011) ? 8'b00001000 :  // If A is 011, Y is 00001000
           (A == 3'b100) ? 8'b00010000 :  // If A is 100, Y is 00010000
           (A == 3'b101) ? 8'b00100000 :  // If A is 101, Y is 00100000
           (A == 3'b110) ? 8'b01000000 :  // If A is 110, Y is 01000000
           (A == 3'b111) ? 8'b10000000 :  // If A is 111, Y is 10000000
                          8'b00000000;  // Default case: if A is invalid, Y is all zeros (not possible in this case)

endmodule
