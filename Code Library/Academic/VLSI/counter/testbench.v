`timescale 1ns / 1ps

module counter_test;
    reg clk, rst, m;
    wire [3:0] count;

    initial begin
        clk = 0;
        rst = 0; #25 rst = 1;
    end

    initial begin
        m = 1;
        #600 m = 0;
        rst = 0; #25;
        rst = 1; #500 m = 1;
    end

    counter c1(clk, rst, m, count);

    always #5 clk = ~clk;

    initial #1400 $finish;
endmodule