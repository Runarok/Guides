module counter(clk, rst, m, count);
    input clk, rst, m;
    output reg [3:0] count;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            count <= 4'b0000;
        else if (m)
            count <= count + 1;
        else
            count <= count - 1;
    end
endmodule