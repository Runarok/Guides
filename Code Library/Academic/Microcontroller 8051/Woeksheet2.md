# WORKSHEET

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
