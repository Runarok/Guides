module jkff(
    input  J,
    input  K,
    input  clk,
    output reg Q,
    output reg Qm
);

    always @(posedge clk) begin
        if (J == 1 && K == 0)
            Qm = 1;
        else if (J == 0 && K == 1)
            Qm = 0;
        else if (J == 1 && K == 1)
            Qm = ~Qm;
    end

endmodule
