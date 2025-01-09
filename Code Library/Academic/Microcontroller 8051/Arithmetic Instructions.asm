; Program to perform 16-bit addition using 8051
ORG 0H          ; Origin for the program start

; ----- MEMORY WINDOW BEFORE EXECUTION -----
; Before execution:
; D:0x50H:  FD  07  00  00  00  00
; D:0x60H:  FF  5F  00  00  00  00

START:
    MOV R0, #51H    ; Initialize input1 memory pointer (R0 points to 0x51)
    MOV R1, #61H    ; Initialize input2 memory pointer (R1 points to 0x61)
    MOV R2, #02H    ; Initialize iteration count (2 bytes to add: lower and upper bytes)
    CLR C           ; Clear carry flag (initially no carry)

BACK:
    MOV A, @R0     ; Get lower byte data from memory pointed by R0 (first iteration)
    ADDC A, @R1    ; Add the byte from memory pointed by R1 with carry (ADDC)
    MOV @R1, A     ; Store the result in memory pointed by R1
    DEC R0         ; Decrement R0 to point to the next byte in memory (upper byte in second iteration)
    DEC R1         ; Decrement R1 to point to the next byte in memory
    DJNZ R2, BACK  ; Decrement iteration count and repeat if not zero

    ; Check if carry is generated
    JNC FINISH      ; If carry is not generated, jump to FINISH
    MOV @R1, #01H   ; If carry generated, store 1 in the higher byte of the result (0x5F)

FINISH:
    SJMP $          ; Infinite loop to stop execution

; ----- MEMORY WINDOW AFTER EXECUTION -----
; After execution:
; D:0x50H:  FD  07  00  00  00  00
; D:0x5FH:  01  FC  66  00  00  00

END

; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

; Program to perform 16-bit subtraction using 8051
ORG 0H          ; Origin for the program start

; ----- MEMORY WINDOW BEFORE EXECUTION -----
; Example 1:
; Before execution:
; D:0x50H:  FA  F4  00  00  00  00
; D:0x60H:  02  F5  00  00  00  00
;
; Example 2:
; Before execution:
; D:0x50H:  00  25  00  00  00  00
; D:0x60H:  0A  F6  00  00  00  00

START:
    MOV R0, #51H    ; Initialize input1 memory pointer (R0 points to 0x51)
    MOV R1, #61H    ; Initialize input2 memory pointer (R1 points to 0x61, stores result)
    MOV R2, #02H    ; Initialize iteration count (2 bytes to subtract: low and high)
    CLR C           ; Clear carry flag (no borrow at the start)

BACK:
    MOV A, @R0     ; Get lower byte data from memory pointed by R0 (first iteration)
    SUBB A, @R1    ; Subtract the byte from memory pointed by R1 with borrow (SUBB)
    MOV @R1, A     ; Store the result in memory pointed by R1
    DEC R0         ; Decrement R0 to point to the next byte in memory (upper byte in second iteration)
    DEC R1         ; Decrement R1 to point to the next byte in memory
    DJNZ R2, BACK  ; Decrement iteration count and repeat if not zero

    ; Check if the result is negative (borrow occurred)
    JNC POSITIVE    ; If no borrow occurred, jump to POSITIVE
    MOV @R1, #0FFH  ; If borrow occurred, store 0xFF in the higher byte of the result (indicating negative)
    JMP FINISH      ; Jump to FINISH to end the program

POSITIVE:
    MOV @R1, #00H   ; If no borrow occurred, store 0x00 in the higher byte (indicating positive)

FINISH:
    SJMP $          ; Infinite loop to stop execution (end of program)

; ----- MEMORY WINDOW AFTER EXECUTION -----
; Example 1:
; After execution:
; D:0x50H:  FA  F4  00  00  00  00
; D:0x5FH:  F7  FF  00  00  00  00
;
; Example 2:
; After execution:
; D:0x50H:  00  25  00  00  00  00
; D:0x5FH:  FF  F5  2F  00  00  00

END


; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

; Program to perform 16-bit by 16-bit multiplication using 8051
ORG 0H            ; Origin for the program start

START:
    ; ----- Input values -----
    MOV R6, #0FFH  ; First number high byte in R6 (FFFF) 
    MOV R7, #0FFH  ; First number low byte in R7 (FFFF)
    MOV R4, #0FFH  ; Second number high byte in R4 (FFFF)
    MOV R5, #0FFH  ; Second number low byte in R5 (FFFF)

    ; Multiply R5 by R7 (Low byte multiplication)
    MOV A, R5      ; Move the lower byte of second number (R5) into Accumulator
    MOV B, R7      ; Move the lower byte of first number (R7) into B
    MUL AB         ; Multiply A and B (R5 * R7), result is in A (low byte) and B (high byte)
    MOV R2, B      ; Move the high byte of the result into R2
    MOV R3, A      ; Move the low byte of the result into R3

    ; Multiply R5 by R6 (Second multiplication with first number high byte)
    MOV A, R5      ; Move R5 back into the Accumulator
    MOV B, R6      ; Move R6 into B
    MUL AB         ; Multiply A and B (R5 * R6), result is in A (low byte) and B (high byte)
    ADD A, R2      ; Add the low byte of the result to the value in R2 (previous multiplication result)
    MOV R2, A      ; Store the result back in R2
    MOV A, B       ; Move the high byte of the result into Accumulator
    ADDC A, #00h   ; Add zero (with carry if any) to the accumulator
    MOV R1, A      ; Store the result in R1
    MOV A, #00h    ; Load the accumulator with zero
    ADDC A, #00h   ; Add zero (with carry if any)
    MOV R0, A      ; Store the result in R0

    ; Multiply R4 by R7 (Low byte multiplication)
    MOV A, R4      ; Move R4 into the Accumulator
    MOV B, R7      ; Move R7 into B
    MUL AB         ; Multiply A and B (R4 * R7), result is in A (low byte) and B (high byte)
    ADD A, R2      ; Add the low byte of the result to the value in R2
    MOV R2, A      ; Store the result back in R2
    MOV A, B       ; Move the high byte of the result into Accumulator
    ADDC A, R1     ; Add the value in R1 (with carry if any)
    MOV R1, A      ; Store the result in R1
    MOV A, #00h    ; Load the accumulator with zero
    ADDC A, R0     ; Add the value in R0 (with carry if any)
    MOV R0, A      ; Store the result in R0

    ; Multiply R4 by R6 (Second multiplication with first number high byte)
    MOV A, R4      ; Move R4 back into the Accumulator
    MOV B, R6      ; Move R6 into B
    MUL AB         ; Multiply A and B (R4 * R6), result is in A (low byte) and B (high byte)
    ADD A, R1      ; Add the low byte of the result to the value in R1
    MOV R1, A      ; Store the result back in R1
    MOV A, B       ; Move the high byte of the result into Accumulator
    ADDC A, R0     ; Add the value in R0 (with carry if any)
    MOV R0, A      ; Store the result in R0

    ; ----- RESULT IN R0, R1, R2, R3 -----
    ; R0, R1, R2, R3 now contains the 32-bit result of the multiplication

    ; Keep the program running
    SJMP $         ; Infinite loop to halt execution

; ----- MEMORY WINDOW BEFORE EXECUTION -----
; Example:
; Before execution:
; R6 = FF (high byte of first number)
; R7 = FF (low byte of first number)
; R4 = FF (high byte of second number)
; R5 = FF (low byte of second number)

; ----- MEMORY WINDOW AFTER EXECUTION -----
; After execution:
; R0 = FF
; R1 = FE
; R2 = 00
; R3 = 01
; The result of FF FF x FF FF is FF FE 00 01 (in R0, R1, R2, and R3)

END


; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

; Program to perform 16-bit by 16-bit division using 8051
ORG 0H            ; Origin for the program start

START:
    ; ----- Input values -----
    MOV R1, #0D7H  ; Dividend high byte (D7)
    MOV R0, #4EH  ; Dividend low byte (4E)
    MOV R3, #00H  ; Divisor high byte (D9)
    MOV R2, #D9H  ; Divisor low byte (D9)

div16_16:
    CLR C         ; Clear carry initially
    MOV R4, #00H  ; Clear R4 working variable initially
    MOV R5, #00H  ; Clear R5 working variable initially
    MOV B, #00H   ; Clear B since B will count the number of left-shifted bits

div1:
    INC B         ; Increment counter for each left shift
    MOV A, R2     ; Move the current divisor low byte into the accumulator
    RLC A         ; Shift low-byte left, rotate through carry to apply highest bit to high-byte
    MOV R2, A     ; Save the updated divisor low-byte
    MOV A, R3     ; Move the current divisor high byte into the accumulator
    RLC A         ; Shift high-byte left, rotating in carry from low-byte
    MOV R3, A     ; Save the updated divisor high-byte
    JNC div1      ; Repeat until carry flag is set from high-byte

div2:              ; Shift right the divisor
    MOV A, R3     ; Move high-byte of divisor into accumulator
    RRC A         ; Rotate high-byte of divisor right and into carry
    MOV R3, A     ; Save updated value of high-byte of divisor
    MOV A, R2     ; Move low-byte of divisor into accumulator
    RRC A         ; Rotate low-byte of divisor right, with carry from high-byte
    MOV R2, A     ; Save updated value of low-byte of divisor
    CLR C         ; Clear carry, we don't need it anymore

    ; Make a safe copy of the dividend high and low byte
    MOV 07h, R1   ; Make a safe copy of the dividend high-byte
    MOV 06h, R0   ; Make a safe copy of the dividend low-byte

    MOV A, R0     ; Move low-byte of dividend into accumulator
    SUBB A, R2    ; Dividend - shifted divisor = result bit (no factor, only 0 or 1)
    MOV R0, A     ; Save updated dividend
    MOV A, R1     ; Move high-byte of dividend into accumulator
    SUBB A, R3    ; Subtract high-byte of divisor (all together 16-bit subtraction)
    MOV R1, A     ; Save updated high-byte back in high-byte of divisor
    JNC div3      ; If carry flag is NOT set, result is 1

    ; Otherwise result is 0, undo subtraction
    MOV R1, 07h   ; Restore safe copy of dividend high-byte
    MOV R0, 06h   ; Restore safe copy of dividend low-byte

div3:
    CPL C         ; Invert carry, so it can be directly copied into result
    MOV A, R4     ; Get the temporary result stored in R4
    RLC A         ; Shift carry flag into temporary result
    MOV R4, A     ; Update R4 with shifted value
    MOV A, R5     ; Get the second temporary result stored in R5
    RLC A         ; Shift carry into the result
    MOV R5, A     ; Update R5 with shifted value

    DJNZ B, div2  ; Decrement B and repeat until B is zero

    ; Store the result of division in R3 and R2
    MOV R3, R4    ; Move quotient (high part) to R3
    MOV R2, R5    ; Move quotient (low part) to R2

    SJMP $        ; Infinite loop to halt execution

; ----- MEMORY WINDOW BEFORE EXECUTION -----
; Example:
; Before execution:
; Dividend (R1, R0) = D7 4E
; Divisor (R3, R2) = 00 D9

; ----- MEMORY WINDOW AFTER EXECUTION -----
; After execution:
; Quotient (R3, R2) = 00 FE
; R3 = 00
; R2 = FE

END

; -----------------------------------------------------------------------------------------------
