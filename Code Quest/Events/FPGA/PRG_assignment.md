

### 1. **N-bit Decoder (2ⁿ to 2ⁿ outputs)**

```verilog
module decoder #(parameter N = 3) (
    input  wire [N-1:0] in,
    output wire [(1<<N)-1:0] out
);
    assign out = 1 << in;
endmodule
```

---

### 2. **N-bit Multiplexer (2ⁿ inputs to 1 output)**

```verilog
module multiplexer #(parameter N = 3, WIDTH = 1) (
    input  wire [((1<<N)*WIDTH)-1:0] in, // Concatenated input
    input  wire [N-1:0] sel,
    output wire [WIDTH-1:0] out
);
    assign out = in[sel*WIDTH +: WIDTH];
endmodule
```

---

### 3. **N-bit Binary to Gray Code Converter**

```verilog
module binary_to_gray #(parameter N = 4) (
    input  wire [N-1:0] bin,
    output wire [N-1:0] gray
);
    assign gray = bin ^ (bin >> 1);
endmodule
```

---

### 4. **N-bit Gray Code to Binary Converter**

```verilog
module gray_to_binary #(parameter N = 4) (
    input  wire [N-1:0] gray,
    output reg  [N-1:0] bin
);
    integer i;
    always @(*) begin
        bin[N-1] = gray[N-1];
        for (i = N-2; i >= 0; i = i - 1)
            bin[i] = bin[i+1] ^ gray[i];
    end
endmodule
```

---

### 5. **N-bit Binary Up-Down Counter**

```verilog
module up_down_counter #(parameter N = 4) (
    input  wire clk,
    input  wire rst,
    input  wire up_down,  // 1 for up, 0 for down
    output reg  [N-1:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;
        else if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end
endmodule
```
