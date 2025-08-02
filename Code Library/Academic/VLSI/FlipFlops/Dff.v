module DFF (
    output reg Q,
    output     Qbar,
    input      D,
    input      Clk,
    input      Reset
);

    always @(posedge Clk) begin
        if (Reset == 1'b1)  // If Reset is asserted
            Q <= 1'b0;
        else
            Q <= D;
    end

    assign Qbar = ~Q;

endmodule
