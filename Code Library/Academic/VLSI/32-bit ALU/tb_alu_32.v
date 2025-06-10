`timescale 1ns/1ps

module tb_alu_32;
    reg  [31:0] a, b;
    reg  [3:0]  alu_ctrl;
    wire [31:0] result_if, result_case;
    wire        zero_if, zero_case;

    alu_32_if  alu_if_inst (.a(a), .b(b), .alu_ctrl(alu_ctrl), .result(result_if), .zero(zero_if));
    alu_32_case alu_case_inst (.a(a), .b(b), .alu_ctrl(alu_ctrl), .result(result_case), .zero(zero_case));

    initial begin
        $monitor("time=%0t | ctrl=%b | a=%h b=%h | res_if=%h zero_if=%b | res_case=%h zero_case=%b",
                  $time, alu_ctrl, a, b, result_if, zero_if, result_case, zero_case);

        // Test logical ops
        a = 32'hF0F0_F0F0; b = 32'h0F0F_0F0F;
        alu_ctrl = 4'b0000; #10;  // AND
        alu_ctrl = 4'b0001; #10;  // OR
        alu_ctrl = 4'b0010; #10;  // XOR
        alu_ctrl = 4'b0011; #10;  // NOR

        // Test arithmetic ops
        a = 32'h0000_000A; b = 32'h0000_0005;
        alu_ctrl = 4'b0100; #10;  // ADD
        alu_ctrl = 4'b0101; #10;  // SUB
        alu_ctrl = 4'b0110; #10;  // INC a
        alu_ctrl = 4'b0111; #10;  // DEC a

        // Test zero flag
        a = 32'h0000_0001; b = 32'h0000_0001;
        alu_ctrl = 4'b0101; #10;  // SUB (1 - 1 = 0)

        $finish;
    end
endmodule
