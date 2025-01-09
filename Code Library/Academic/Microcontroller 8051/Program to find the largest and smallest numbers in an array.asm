; Program to find the largest and smallest numbers in an array using 8051

ORG 0H             ; Origin address for the program start


; ---- Program to find the largest number in an array using 8051 ---- 

; ----- MEMORY WINDOW BEFORE EXECUTION -----
; Before execution:
; D:0x50H:  22  AB  3D  44  55  00
; D:0x60H:  00  00  00  00  00  00

START:
    ; ---- Find Largest Number ----
    MOV R0, #50H   ; Initialize source memory pointer (R0 points to 0x50)
    MOV R2, #05H   ; Initialize iteration counter (5 elements in the array)
    MOV B, @R0     ; Use B Register to store the largest value, initialize it with first value
    
BACK_LARGEST:
    MOV A, @R0     ; Load the data from source memory (R0) into accumulator (A)
    CJNE A, B, LOOP_LARGEST ; Compare accumulator with B, if not equal, go to LOOP_LARGEST
    
LOOP_LARGEST:
    JC LOOP1_LARGEST ; If carry flag is set (A is greater than B), jump to LOOP1_LARGEST
    MOV B, A       ; Store larger value in B register
    INC R0         ; Increment the source memory pointer
    DJNZ R2, BACK_LARGEST  ; Decrement iteration counter (R2), if not zero, repeat the process

    SJMP NEXT_LARGEST      ; Jump to NEXT_LARGEST (end of loop)

LOOP1_LARGEST:
    INC R0         ; Increment the source memory pointer
    DJNZ R2, BACK_LARGEST  ; Decrement iteration counter (R2), if not zero, repeat the process

NEXT_LARGEST:
    MOV 60H, B     ; Store the largest value in memory location 0x60

    ; ----- MEMORY WINDOW AFTER FINDING LARGEST -----
    ; After finding largest number:
    ; D:0x50H:  22  AB  3D  44  55  00
    ; D:0x60H:  AB  00  00  00  00  00


; -------------------------------------------------------------------------------------------- 

; ---- Program to find the smallest number in an array using 8051 ---- 

    ; ---- Find Smallest Number ----
    MOV R0, #50H   ; Initialize source memory pointer (R0 points to 0x50)
    MOV R2, #05H   ; Initialize iteration counter (5 elements in the array)
    MOV B, @R0     ; Use B Register to store the smallest value, initialize it with first value
    
BACK_SMALLEST:
    MOV A, @R0     ; Load the data from source memory (R0) into accumulator (A)
    CJNE A, B, LOOP_SMALLEST ; Compare accumulator with B, if not equal, go to LOOP_SMALLEST
    
LOOP_SMALLEST:
    JNC LOOP1_SMALLEST ; If no carry (A is greater than or equal to B), jump to LOOP1_SMALLEST
    MOV B, A       ; Store smaller value in B register
    INC R0         ; Increment the source memory pointer
    DJNZ R2, BACK_SMALLEST  ; Decrement iteration counter (R2), if not zero, repeat the process

    SJMP NEXT_SMALLEST      ; Jump to NEXT_SMALLEST (end of loop)

LOOP1_SMALLEST:
    INC R0         ; Increment the source memory pointer
    DJNZ R2, BACK_SMALLEST  ; Decrement iteration counter (R2), if not zero, repeat the process

NEXT_SMALLEST:
    MOV 60H, B     ; Store the smallest value in memory location 0x60

    ; ----- MEMORY WINDOW AFTER EXECUTION -----
    ; After execution:
    ; D:0x50H:  22  AB  3D  44  55  00
    ; D:0x60H:  22  00  00  00  00  00  ; Smallest value "22" is stored at 0x60

    NOP            ; No operation (end of program)

END
