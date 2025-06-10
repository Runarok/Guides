module alu_32_case(
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alu_ctrl,
    output reg  [31:0] result,
    output reg         zero
);

    always @(*) begin
        case (alu_ctrl)
            4'b0000: result = a & b;           // AND
            4'b0001: result = a | b;           // OR
            4'b0010: result = a ^ b;           // XOR
            4'b0011: result = ~(a | b);        // NOR

            4'b0100: result = a + b;           // ADD
            4'b0101: result = a - b;           // SUB
            4'b0110: result = a + 1;           // INC a
            4'b0111: result = a - 1;           // DEC a

            default: result = 32'b0;
        endcase

        zero = (result == 32'b0);
    end
endmodule
