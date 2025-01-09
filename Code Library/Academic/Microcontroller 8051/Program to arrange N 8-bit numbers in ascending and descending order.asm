; Program to arrange N 8-bit numbers in ascending and descending order using 8051

; ---- Program to arrange N 8-bit numbers in ascending order using 8051 ----

ORG 0H             ; Origin address for the program start

; ----- MEMORY WINDOW BEFORE EXECUTION -----
; Before execution:
; D:0x50H:  06  04  03  07  02  01
; D:0x60H:  00  00  00  00  00  00

START:
    ; ---- Sort in Ascending Order ----
    MOV R2, #05H   ; Initialize the iteration counter (5 elements to sort)
    DEC R2         ; Decrement the iteration count
    
BACK1_ASCENDING:
    MOV R0, #50H   ; Initialize memory pointer1 (points to 0x50)
    MOV R1, #51H   ; Initialize memory pointer2 (points to 0x51)
    MOV A, R2      ; Store outer loop count in A
    MOV R3, A      ; Store inner loop count in R3

BACK_ASCENDING:
    MOV A, @R0     ; Get the data from memory pointer1 (R0)
    MOV B, @R1     ; Get the data from memory pointer2 (R1)
    CJNE A, B, LOOP_ASCENDING ; Compare if A != B, go to LOOP_ASCENDING
    
LOOP_ASCENDING:
    JC LOOP1_ASCENDING ; If carry generates (A > B), jump to LOOP1_ASCENDING
    MOV @R0, B     ; Exchange the data in memory pointer1 (R0) and memory pointer2 (R1)
    MOV @R1, A     ; Store the value of A into memory pointer2

LOOP1_ASCENDING:
    INC R0         ; Increment memory pointer1
    INC R1         ; Increment memory pointer2
    DJNZ R3, BACK_ASCENDING  ; Decrement inner loop count, if not zero go to BACK_ASCENDING

    DJNZ R2, BACK1_ASCENDING ; Decrement outer loop count, if not zero go to BACK1_ASCENDING


; -------------------------------------------------------------------------------------------
; ---- Program to arrange N 8-bit numbers in descending order using 8051 ----

    ; ----- MEMORY WINDOW AFTER ASCENDING -----
    ; After execution:
    ; D:0x50H:  01  02  03  04  06  07

    ; ---- Sort in Descending Order ----
    MOV R2, #05H   ; Initialize the iteration counter (5 elements to sort)
    DEC R2         ; Decrement the iteration count
    
BACK1_DESCENDING:
    MOV R0, #50H   ; Initialize memory pointer1 (points to 0x50)
    MOV R1, #51H   ; Initialize memory pointer2 (points to 0x51)
    MOV A, R2      ; Store outer loop count in A
    MOV R3, A      ; Store inner loop count in R3

BACK_DESCENDING:
    MOV A, @R0     ; Get the data from memory pointer1 (R0)
    MOV B, @R1     ; Get the data from memory pointer2 (R1)
    CJNE A, B, LOOP_DESCENDING ; Compare if A != B, go to LOOP_DESCENDING
    
LOOP_DESCENDING:
    JNC LOOP1_DESCENDING ; If no carry (A <= B), jump to LOOP1_DESCENDING
    MOV @R0, B     ; Exchange the data in memory pointer1 (R0) and memory pointer2 (R1)
    MOV @R1, A     ; Store the value of A into memory pointer2

LOOP1_DESCENDING:
    INC R0         ; Increment memory pointer1
    INC R1         ; Increment memory pointer2
    DJNZ R3, BACK_DESCENDING  ; Decrement inner loop count, if not zero go to BACK_DESCENDING

    DJNZ R2, BACK1_DESCENDING ; Decrement outer loop count, if not zero go to BACK1_DESCENDING

    ; ----- MEMORY WINDOW AFTER DESCENDING -----
    ; After execution:
    ; D:0x50H:  07  06  04  03  02  01

    NOP            ; No operation (end of program)

END
