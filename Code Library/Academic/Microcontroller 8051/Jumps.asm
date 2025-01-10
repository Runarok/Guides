; OBJECTIVES:
; TO DEMONSTRATE CONDITIONAL BIT JUMP, CONDITIONAL BYTE JUMP,
; UNCONDITIONAL JUMP, CALL and RETURN instructions
; This program keeps checking P1.0 for low signal. Once a low signal arrives,
; the program checks for AAh at PORT 0. If the data is AAh a counter will start.

ORG 00H

; ----- MEMORY WINDOW BEFORE EXECUTION -----
; P0 = 0xFF    ; PORT 0 is set to 0xFF
; P1 = 0xFF    ; PORT 1 is set to 0xFF
; P2 = 0x00    ; PORT 2 is initialized to 0x00
; R0 = 0x00    ; Register R0 is initialized to 0x00
; Program is waiting for a low signal on P1.0.

; INITIALIZING THE COUNTER AND PORTS
MAIN: 
    MOV P0, #0FFH        ; Set PORT 0 to 0xFF
    MOV P1, #0FFH        ; Set PORT 1 to 0xFF
    MOV P2, #00H         ; Initialize PORT 2 to 0x00
    MOV R0, #00H         ; Initialize register R0 to 0

; WAITING FOR THE ARRIVAL OF LOW SIGNAL AT PORT 1.0
WAIT: 
    JB P1.0, WAIT        ; Conditional BIT JUMP - Jump if P1.0 is high (1), stay in loop if low (0)
    ; If P1.0 is low, proceed to next step.
    ACALL VERIFY_DATA    ; Conditional CALL - Call VERIFY_DATA subroutine

    SJMP WAIT            ; Unconditional JUMP - Always jump back to WAIT loop

; ----- MEMORY WINDOW AFTER EXECUTION (if P1.0 is low) -----
; P0 = (depends on the input)  ; P0 will hold the data we are checking (e.g., 0xAA).
; P1 = (unchanged)  ; P1 remains the same, unless modified externally.
; P2 = (depends on R0)  ; P2 will be updated with R0, which is incremented on each valid cycle.
; R0 = (increments)  ; R0 will be incremented if P0 = 0xAA.
; The program will loop back to WAIT.

; CHECKING THE DATA AT P0 FOR 0AAh
VERIFY_DATA:
    MOV A, P0            ; Move the value of PORT 0 into accumulator A
    CJNE A, #0AAH, RETURN ; Conditional BYTE JUMP - Jump to RETURN if A is not equal 0xAA

    INC R0               ; Increment R0 (counter)
    MOV P2, R0           ; Move the value of R0 into PORT 2
    ; ----- MEMORY WINDOW AFTER DATA CHECK (if P0 = 0xAA) -----
    ; R0 = (incremented)  ; R0 will be incremented by 1, and this value is copied to P2.
    ; P2 = (R0)           ; P2 will hold the incremented value of R0.

    ACALL DELAY          ; Unconditional CALL - Call DELAY subroutine

RETURN:
    RET                   ; RETURN from subroutine

; ----- MEMORY WINDOW AFTER RETURN (from VERIFY_DATA) -----
; P2 = (R0 value)    ; P2 still holds the updated value of R0.

; JUST A DELAY SUBROUTINE :)
DELAY:
    NOP                   ; No operation (NOP)
    MOV R2, #25           ; Set R2 to 25 (outer loop count)
H0:
    MOV R3, #255          ; Set R3 to 255 (inner loop count)
HI:
    MOV R4, #255          ; Set R4 to 255 (inner-inner loop count)
DJNZ R4, $               ; Decrement R4 and jump to $ (current position) until R4 becomes 0
DJNZ R3, HI             ; Decrement R3 and jump to HI until R3 becomes 0
DJNZ R2, H0             ; Decrement R2 and jump to H0 until R2 becomes 0
    RET                   ; RETURN from subroutine

; ----- MEMORY WINDOW AFTER DELAY -----
; Registers R0, R2, R3, and R4 will be modified during the delay, but will be restored afterward.
; The program returns to the MAIN loop.

END 

; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

; ----- CONDITIONAL BIT JUMP: Demonstrating JB (Jump if Bit is Set) -----
; -----------------------------------------------------------------------------------------------
; Before Execution:
; P1 = 0xFF    ; Port 1 is set to 0xFF (All bits are high)
; The program will wait for a low signal on P1.0.

MAIN_BIT_JUMP:
    MOV P1, #0FFH        ; Set PORT 1 to 0xFF (P1.0 is high initially)
WAIT_BIT:
    JB P1.0, WAIT_BIT    ; Conditional BIT JUMP - Wait for P1.0 to go low.
    ; After execution (P1.0 goes low):
    ; P1.0 will be low, and the program will continue execution.
    
; -----------------------------------------------------------------------------------------------
; After Execution:
; P1 = (depends on external signal)  ; P1.0 will be low when the jump is made.
; The program will proceed to the next instruction once P1.0 goes low.
; The program then continues.

; -----------------------------------------------------------------------------------------------
; ----- CONDITIONAL BYTE JUMP: Demonstrating CJNE (Compare and Jump if Not Equal) -----
; -----------------------------------------------------------------------------------------------
; Before Execution:
; P0 = 0xFF    ; Set PORT 0 to 0xFF.
; The program will compare the value of P0 with 0xAA.

MAIN_BYTE_JUMP:
    MOV P0, #0FFH        ; Set PORT 0 to 0xFF
    MOV A, P0            ; Load value of P0 into A
    CJNE A, #0AAH, NOT_AA ; Conditional BYTE JUMP - Jump to NOT_AA if P0 is not 0xAA.
    ; If P0 = 0xAA:
    ; The program continues here.

NOT_AA:
    ; After execution (if P0 != 0xAA):
    ; The program will jump to NOT_AA and continue from there.
    ; If P0 == 0xAA, it will continue past CJNE.

; -----------------------------------------------------------------------------------------------
; After Execution:
; P0 = (depends on external signal)  ; P0 holds either 0xFF or 0xAA depending on the comparison.
; The program will either continue from the CJNE instruction or jump to NOT_AA.

; -----------------------------------------------------------------------------------------------
; ----- UNCONDITIONAL JUMP: Demonstrating SJMP (Short Jump) -----
; -----------------------------------------------------------------------------------------------
; Before Execution:
; The program is currently at the SJMP instruction and will jump unconditionally.

MAIN_UNCONDITIONAL_JUMP:
    SJMP END_OF_PROGRAM  ; Unconditional Jump - Jumps to END_OF_PROGRAM label.
    ; The program will jump here and continue from END_OF_PROGRAM.

; -----------------------------------------------------------------------------------------------
; After Execution:
; The program will jump unconditionally to END_OF_PROGRAM and will not execute further instructions
; below the SJMP.
END_OF_PROGRAM:
    ; After execution (the program has jumped):
    ; Execution continues from here.

; -----------------------------------------------------------------------------------------------
; ----- CALL AND RETURN: Demonstrating CALL and RET Instructions -----
; -----------------------------------------------------------------------------------------------
; Before Execution:
; R0 = 0x00    ; Register R0 is set to 0 initially.

MAIN_CALL_RETURN:
    CALL INCREMENT_R0    ; Call the INCREMENT_R0 subroutine.
    ; After execution (after CALL):
    ; R0 will be incremented by the INCREMENT_R0 subroutine.
    RET                   ; Return from the CALL.

INCREMENT_R0:
    INC R0               ; Increment R0 by 1.
    RET                   ; Return to the calling program.

; -----------------------------------------------------------------------------------------------
; After Execution:
; R0 = 0x01    ; R0 will be incremented to 0x01 after returning from INCREMENT_R0 subroutine.
; The program will continue from the RET instruction.


; -----------------------------------------------------------------------------------------------
; ----- MEMORY WINDOW BEFORE AND AFTER EXECUTION -----
; -----------------------------------------------------------------------------------------------
; Before Execution:
; P0 = 0xFF    ; PORT 0 initially set to 0xFF.
; P1 = 0xFF    ; PORT 1 initially set to 0xFF.
; R0 = 0x00    ; R0 is initialized to 0.
; The program waits for a low signal on P1.0, compares P0, jumps unconditionally, calls a subroutine, etc.

; After Execution:
; The state of memory will be changed based on the program flow:
; If P1.0 goes low, the JB instruction will trigger, and the program continues.
; If P0 = 0xAA, CJNE won't jump, and R0 will be incremented during the CALL.
; The program will finally return to its main loop.
