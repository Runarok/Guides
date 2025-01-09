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
