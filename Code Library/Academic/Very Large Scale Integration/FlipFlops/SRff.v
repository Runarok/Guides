module SRFF (
    input wire S,
    input wire R,
    input wire clk,
    output reg Q,
    output wire Qbar
);

// Synchronous SR flip-flop behavior
always @(posedge clk) begin
    case ({S, R})
        2'b00: Q <= Q;        // No change
        2'b01: Q <= 1'b0;     // Reset
        2'b10: Q <= 1'b1;     // Set
        2'b11: Q <= 1'bx;     // Invalid condition (both set and reset)
    endcase
end

assign Qbar = ~Q;

endmodule
