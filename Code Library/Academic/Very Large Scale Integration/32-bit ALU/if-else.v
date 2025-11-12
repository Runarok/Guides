module alu_32_if(
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alu_ctrl,  // select operation
    output reg  [31:0] result,
    output reg         zero       // flag if result == 0
);

    always @(*) begin
        if (alu_ctrl == 4'b0000)      // AND
            result = a & b;
        else if (alu_ctrl == 4'b0001) // OR
            result = a | b;
        else if (alu_ctrl == 4'b0010) // XOR
            result = a ^ b;
        else if (alu_ctrl == 4'b0011) // NOR
            result = ~(a | b);

        else if (alu_ctrl == 4'b0100) // ADD
            result = a + b;
        else if (alu_ctrl == 4'b0101) // SUBTRACT
            result = a - b;
        else if (alu_ctrl == 4'b0110) // INCREMENT a
            result = a + 1;
        else if (alu_ctrl == 4'b0111) // DECREMENT a
            result = a - 1;

        else
            result = 32'b0;
        
        zero = (result == 32'b0);
    end
endmodule
