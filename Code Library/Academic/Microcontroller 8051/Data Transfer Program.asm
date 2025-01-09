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
