;***********************************************************************
; Program to Perform Arithmetic and Bitwise Operations on 8051
; This program demonstrates addition, subtraction, multiplication, division,
; square, cube, and bitwise operations using 8051 instructions.
;***********************************************************************

ORG 0H            ; Origin, start of program memory

;----------------------- Addition/Subtraction -----------------------------
; This section demonstrates addition and subtraction operations.
;***********************************************************************
START: 
    ; Addition Example
    MOV A, #10      ; Load 10 into A
    ADD A, #5       ; Add 5 to A (A = 15)
    MOV B, A        ; Copy result to B
    
    ; Subtraction Example
    MOV A, #8       ; Load 8 into A
    SUBB A, #3      ; Subtract 3 from A with borrow (A = 5)
    
;----------------------- Multiplication and Division ----------------------
; This section demonstrates multiplication and division operations.
;***********************************************************************
    MOV A, #4       ; Load 4 into A
    MOV B, #3       ; Load 3 into B
    MUL AB          ; Multiply A by B, result = 12 (A = 12, B = 0)
    MOV R0, A       ; Store result in R0 (low byte)
    MOV R1, B       ; Store result in R1 (high byte)
    
    ; Division Example
    MOV A, #20      ; Load 20 into A
    MOV B, #4       ; Load 4 into B
    DIV AB          ; Divide A by B (A = 5, B = 0, Quotient = 5, Remainder = 0)
    MOV R2, A       ; Store quotient in R2
    
;----------------------- Square of a Number -------------------------------
; This section calculates the square of a number.
;***********************************************************************
    MOV A, #5       ; Load 5 into A
    MOV B, A        ; Copy A to B
    MUL AB          ; Multiply A by B (A = 25, B = 0, Square of 5)
    MOV R3, A       ; Store result (A = 25) in R3
    
;----------------------- Cube of a Number -------------------------------
; This section calculates the cube of a number.
;***********************************************************************
    MOV A, #3       ; Load 3 into A
    MOV B, A        ; Copy A to B
    MUL AB          ; Multiply A by B (A = 9, B = 0)
    MOV R0, A       ; Store result in R0 (A = 9)
    
    MOV A, R0       ; Load result of A = 9 into A
    MOV B, #3       ; Load 3 into B for second multiplication
    MUL AB          ; Multiply A by B again (A = 27, B = 0)
    MOV R4, A       ; Store final result (Cube = 27) in R4
    
;----------------------- Bitwise Operations ------------------------------
; This section demonstrates bitwise operations on Port registers.
;***********************************************************************
    MOV A, P1       ; Load Port 1 contents into accumulator A
    ANL A, #0xF0    ; AND with 0xF0 (Mask lower nibble)
    MOV P1, A       ; Store result back to Port 1
    
    MOV A, #0x01    ; Load 0x01 into A
    SETB P2.0       ; Set bit 0 of Port 2 to 1
    
    MOV A, P2       ; Load contents of Port 2 into A
    CPL P2.0        ; Complement bit 0 of Port 2
    
    MOV A, P0       ; Load contents of Port 0 into A
    CLR P0.3        ; Clear bit 3 of Port 0
    
;----------------------- End of Program -------------------------------
; This section marks the end of the program.
;***********************************************************************
    NOP             ; No operation (end of program)
    END             ; End of assembly code
