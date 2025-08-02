`timescale 1ns/1ps

module tb_adder_4bit;
    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    adder_4bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("tb_adder_4bit.vcd");
        $dumpvars(0, tb_adder_4bit);

        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0001; b = 4'b0001; cin = 0; #10;
        a = 4'b0101; b = 4'b0011; cin = 0; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1111; b = 4'b1111; cin = 1; #10;

        $finish;
    end

//    initial begin
//        $monitor("Time=%0t | a=%b b=%b cin=%b -> sum=%b cout=%b", $time, a, b, cin, sum, cout);
//   end
endmodule
