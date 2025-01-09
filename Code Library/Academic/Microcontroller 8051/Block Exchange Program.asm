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
