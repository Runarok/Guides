# WORKSHEET

### 1. Write an ALP to generate eight Fibonacci numbers using 8051
- The first term must be zero and second term must be one.
- Add the current term and previous term, store in the next term.
- Repeat the same process until count becomes zero.

<pre>
ORG 0H
START:
    MOV R0, #0      ; First term = 0
    MOV R1, #1      ; Second term = 1
    MOV R2, #8      ; Set count to 8 (number of Fibonacci numbers to generate)

FIB_LOOP:
    MOV A, R0       ; A = current term
    ADD A, R1       ; A = A + R1 (previous term)
    MOV R0, R1      ; Move current term to previous term
    MOV R1, A       ; Move new term to current term
    MOV 30H, A      ; Store the result in RAM location 30H (for display)
    DEC R2          ; Decrease count
    JNZ FIB_LOOP    ; If count is not zero, repeat the loop

    NOP             ; End of program, no operation (halt)
END
</pre>

### 2. Write an ALP to check if the given string of data is palindrome or not
- The output will be `01` if it is palindrome.
- The output will be `FF` if it is not palindrome.

<pre>
ORG 0H
START:
    MOV DPTR, #STRING  ; Point to the string
    MOV R0, #00        ; Start from the first character
    MOV R1, #07        ; End of string (assuming 8 characters)

CHECK_LOOP:
    MOV A, @DPTR       ; Load character from string
    MOV B, @DPTR+R1    ; Load the character from the end
    INC DPTR           ; Move pointer to next character
    DEC R1             ; Move R1 to the previous character
    INC R0             ; Increase the start pointer

    ; Compare characters
    INC DPTR
    JZ NOT_PALINDROME  ; If characters don't match, it's not palindrome

    JNZ CHECK_LOOP     ; If string is not finished, continue

    MOV A, #01         ; If palindrome, output 01
    MOV 30H, A
    NOP
    END

NOT_PALINDROME:
    MOV A, #0FF        ; If not palindrome, output FF
    MOV 30H, A
    NOP
    END
</pre>

### 3. Explain the difference between the following two instructions:
#### a. MOVC A,@R0
- **MOVC** (Move Code byte) transfers the data from a memory location addressed by the code memory pointer (DPTR) and pointed by R0 to register A. The data is accessed in the program memory.

#### b. MOV A,@R0
- **MOV** (Move) transfers the data from the internal RAM (pointed by R0) to register A. The data is accessed in the data memory.

### 4. Circle the invalid instructions.
- a. MOV A,@R1 → **Valid**
- b. MOV A,@R2 → **Valid**
- c. MOVC A,@R0+DPTR → **Valid**
- d. MOV @R3,A → **Invalid**, as R3 is not a valid address register for direct addressing.

### 5. Explain the difference between the following two instructions:
#### a. MOV A,40H
- The instruction **MOV A, 40H** moves the contents of the memory location `40H` (internal RAM) into register A.

#### b. MOV A,#40H
- The instruction **MOV A, #40H** moves the immediate value `40H` into register A.

### 6. Explain the difference between the following two instructions:
#### a. MOV 40H,A
- The instruction **MOV 40H, A** moves the value in register A into the memory location `40H` (internal RAM).

#### b. MOV 40H, #0A
- The instruction **MOV 40H, #0A** moves the immediate value `0A` into the memory location `40H` (internal RAM).

### 7. Give the RAM address for the following registers:
#### a. A = B = R0 = R2
- **A**: Accumulator (Register in the CPU, not in RAM)
- **B**: B Register (Register in the CPU, not in RAM)
- **R0**: 30H (General-purpose register)
- **R2**: 32H (General-purpose register)

#### b. PSW = SP = DPL = DPH
- **PSW (Program Status Word)**: 0D0H
- **SP (Stack Pointer)**: 07H (initial value is 07H, but it changes during the execution)
- **DPL (Data Pointer Low)**: 82H
- **DPH (Data Pointer High)**: 83H
</pre>

---

### 1. Explain the difference between the ADD and ADDC instructions.
The main difference between the **ADD** and **ADDC** (Add with Carry) instructions lies in the carry bit:

- **ADD A, source**: This instruction adds the contents of the source register or memory location to the accumulator (A) and stores the result in A. It does not consider the carry bit (C) from the previous operation.

- **ADDC A, source**: This instruction adds the contents of the source register or memory location to the accumulator (A) and also adds the carry bit (C) from the previous operation. It is typically used when performing multi-byte addition where carry is involved.

### 2. Show how to perform the subtraction: 29H - 21H.
The subtraction operation can be performed using the **SUBB** (Subtract with Borrow) instruction. 

Here's how to perform the subtraction of 29H - 21H:

- First, load 29H into the accumulator (A).
- Then, subtract 21H from A, considering the borrow.

Example program:

<pre>
MOV A, #29H   ; Load A with 29H
MOV B, #21H   ; Load B with 21H
SUBB A, B     ; Perform A - B (29H - 21H)
</pre>

After execution, A will contain 08H (29H - 21H = 08H).

### 4. True or False. "DA A" must be used for adding BCD data only.
**True.** The **DA A** (Decimal Adjust Accumulator) instruction is specifically used to adjust the result in the accumulator (A) to a valid BCD (Binary Coded Decimal) format after performing an addition or subtraction operation on BCD data. It ensures that the result is a valid BCD value, correcting it if necessary.

### 5. Can we use the "DA A" instruction to convert data such as 9CH into BCD without first performing an ADD instruction? Explain your answer.
**No.** The **DA A** instruction is used to adjust the accumulator (A) to BCD format after an arithmetic operation, such as addition or subtraction. It is not used to directly convert a value like 9CH into BCD.

For example, if 9CH is loaded directly into the accumulator without any prior addition operation, the **DA A** instruction will not modify it, since it does not correct the accumulator unless there is a need for correction (e.g., after an addition or subtraction of BCD values). 

### 6. Show a simple program to add 2345H and 56F8H.
<pre>
; Program to add 2345H and 56F8H
MOV A, #45H   ; Load A with the least significant byte (45H) of 2345H
MOV R0, #23H  ; Load R0 with the most significant byte (23H) of 2345H

ADD A, #F8H   ; Add the least significant byte (F8H) of 56F8H
MOV R1, A     ; Store result (least significant byte) in R1
MOV A, R0     ; Load most significant byte (23H) into A
ADD A, #56H   ; Add the most significant byte (56H) of 56F8H
MOV R0, A     ; Store result (most significant byte) in R0

; After execution, R1 contains the least significant byte (A3H), and R0 contains the most significant byte (79H).
</pre>

### 7. Show a simple program to subtract 2345H from 56F8H.
<pre>
; Program to subtract 2345H from 56F8H
MOV A, #F8H   ; Load A with the least significant byte (F8H) of 56F8H
MOV R0, #56H  ; Load R0 with the most significant byte (56H) of 56F8H

SUBB A, #45H  ; Subtract the least significant byte (45H) of 2345H
MOV R1, A     ; Store result (least significant byte) in R1
MOV A, R0     ; Load most significant byte (56H) into A
SUBB A, #23H  ; Subtract the most significant byte (23H) of 2345H
MOV R0, A     ; Store result (most significant byte) in R0

; After execution, R1 contains the least significant byte (B3H), and R0 contains the most significant byte (33H).
</pre>



---


# Assignment: Delay Subroutine Analysis

## Problem Statement:
Following is a delay subroutine. Find how much delay this subroutine provides. Insert the delay appropriately inside the BCD COUNTER program so that each count should happen after **twice the delay**.

### Delay Subroutine:

<pre>
DELAY: 
    NOP
    MOV R2, #25          ; Load 25 into R2
H0:
    MOV R3, #255         ; Load 255 into R3
HI:
    MOV R4, #255         ; Load 255 into R4
    DJNZ R4, $           ; Decrement R4 and jump if not zero
    DJNZ R3, HI          ; Decrement R3 and jump if not zero
    DJNZ R2, H0          ; Decrement R2 and jump if not zero
    RET                  ; Return from subroutine
</pre>

### Analysis:

- **NOP**: No operation, just a placeholder.
- **MOV R2, #25**: Initializes R2 to 25. This creates the outer loop that iterates 25 times.
- **MOV R3, #255**: Initializes R3 to 255. This is the middle loop that iterates 255 times for each iteration of the outer loop.
- **MOV R4, #255**: Initializes R4 to 255. This is the innermost loop that iterates 255 times for each iteration of the middle loop.

The delay occurs by using `DJNZ` (Decrement and Jump if Not Zero), which decreases the value in the register and jumps back to the labeled instruction if the value is not zero. Each `DJNZ` operation is responsible for a small delay in the program.

To calculate the delay:

1. The innermost loop (`R4`) will execute 255 times.
2. The middle loop (`R3`) will execute 255 times for each iteration of the outer loop (`R2`), so it will run a total of 255 * 255 = 65025 times.
3. The outer loop (`R2`) runs 25 times.

Thus, the total number of iterations for the delay subroutine is:

---

# Realizing the Function WX + WYX + YZ

### 1. Expression Simplification:
The given Boolean function is **WX + WYX + YZ**.

- **WX + WYX** can be simplified because **WYX** is just **WX** with an extra factor of **Y**, and **WX + WX = WX**.
- Therefore, the simplified expression is **WX + YZ**.

### 2. Logic Gate Implementation:
To implement **WX + YZ**, we use AND and OR gates:
- **WX** requires an AND gate to combine **W** and **X**.
- **YZ** requires an AND gate to combine **Y** and **Z**.
- Finally, an OR gate combines the outputs of the two AND gates.

### 3. Boolean Equation:
The simplified function can be expressed as:  
**F = (W AND X) OR (Y AND Z)**

### 4. Circuit Diagram:

<pre>
W ──┬── AND ──┐
         |     │
X ──────┘     │
               OR ── F
Y ──┬── AND ──┘
         |     
Z ──────┘     
</pre>

This diagram represents:
- Two AND gates: one for **WX** and one for **YZ**.
- One OR gate to combine the outputs of the two AND gates to get the final output **F**.

### 5. Code Implementation (in 8051 Assembly):
Here's a simple 8051 assembly code to realize the Boolean function **WX + YZ**:

<pre>
ORG 0H            ; Start of program
MOV A, P1         ; Load Port 1 into accumulator (W and X)
ANL A, #0x03      ; AND with 00000011 to extract W and X (bit 0 and 1)
MOV B, A          ; Store result of WX in register B

MOV A, P2         ; Load Port 2 into accumulator (Y and Z)
ANL A, #0x03      ; AND with 00000011 to extract Y and Z (bit 0 and 1)
MOV R0, A         ; Store result of YZ in register R0

MOV A, B          ; Load WX result
ORL A, R0         ; OR with YZ result to get final result
MOV P3, A         ; Output result to Port 3
END
</pre>

### 6. Explanation of the Code:
1. **MOV A, P1**: Loads the data from Port 1 (assumed to be inputs for **W** and **X**) into the accumulator.
2. **ANL A, #0x03**: Performs a bitwise AND with `0x03` to isolate **W** and **X**.
3. **MOV B, A**: Stores the result of **WX** in register B.
4. **MOV A, P2**: Loads the data from Port 2 (assumed to be inputs for **Y** and **Z**) into the accumulator.
5. **ANL A, #0x03**: Performs a bitwise AND with `0x03` to isolate **Y** and **Z**.
6. **MOV R0, A**: Stores the result of **YZ** in register R0.
7. **MOV A, B**: Loads the **WX** result from register B.
8. **ORL A, R0**: Performs a bitwise OR with the **YZ** result.
9. **MOV P3, A**: Outputs the final result to Port 3.

This code implements the Boolean function **WX + YZ** on the 8051 microcontroller using Port 1 and Port 2 for inputs and Port 3 for the output.

---
