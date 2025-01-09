; DATA TRANSFER. - BLOCK MOVE, EXCHANGE, SORTING, FINDING LARGEST AND SMALLEST ELEMENT IN AN ARRAY

; Data Transfer Program in 8051 Assembly

ORG 0H            ; Origin address 0H for program start

START:            
    MOV R0, #50H  ; Initialize source memory pointer (R0 points to 0x50)
    MOV R1, #60H  ; Initialize destination memory pointer (R1 points to 0x60)
    MOV R2, #05H  ; Initialize iteration counter with 5 (copy 5 bytes)
    
    ; --------- Before Execution ---------
    ; Source memory (D:0x50H) contains:  22 AB 3D 44 55 00
    ; Destination memory (D:0x60H) contains: 00 00 00 00 00 00
    ; --------- Execution Starts ---------

BACK:              
    MOV A, @R0    ; Move data from source memory (R0) to accumulator (A)
    MOV @R1, A    ; Store data from accumulator (A) to destination memory (R1)
    INC R0        ; Increment source memory pointer (R0)
    INC R1        ; Increment destination memory pointer (R1)
    DJNZ R2, BACK ; Decrement iteration counter (R2), and loop if R2 is not zero
    
    ; --------- After Execution ---------
    ; Source memory (D:0x50H) remains the same:  22 AB 3D 44 55 00
    ; Destination memory (D:0x60H) now contains: 22 AB 3D 44 55 00
    ; --------- Execution Ends ---------

    NOP           ; No operation (just to mark the end of program, can be omitted)

END


; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------


; Block Exchange Program in 8051 Assembly

ORG 0H            ; Origin address 0H for program start

START:            
    MOV R0, #50H  ; Initialize source memory pointer (R0 points to 0x50)
    MOV R1, #60H  ; Initialize destination memory pointer (R1 points to 0x60)
    MOV R2, #05H  ; Initialize iteration counter with 5 (exchange 5 bytes)
    
    ; --------- Before Execution ---------
    ; Source memory (D:0x50H) contains:  01 02 03 04 05 00
    ; Destination memory (D:0x60H) contains: 06 07 08 09 10 00
    ; --------- Execution Starts ---------

BACK:              
    MOV A, @R0    ; Move data from source memory (R0) to accumulator (A)
    XCH A, @R1   ; Exchange data between accumulator (A) and destination memory (R1)
    MOV @R0, A    ; Store the exchanged data into source memory (R0)
    INC R0        ; Increment source memory pointer (R0)
    INC R1        ; Increment destination memory pointer (R1)
    DJNZ R2, BACK ; Decrement iteration counter (R2), and loop if R2 is not zero
    
    ; --------- After Execution ---------
    ; Source memory (D:0x50H) now contains: 06 07 08 09 10 00
    ; Destination memory (D:0x60H) now contains: 01 02 03 04 05 00
    ; --------- Execution Ends ---------

    NOP           ; No operation (just to mark the end of program, can be omitted)

END

; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

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

; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

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

; -----------------------------------------------------------------------------------------------
