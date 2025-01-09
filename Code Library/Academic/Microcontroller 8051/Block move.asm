; Internal Memory to Internal Memory

;***********************************************************************
; Program to Move Data from Internal RAM to Internal RAM
; This program copies 10 bytes of data from the source (internal RAM) 
; to the destination (internal RAM) using a loop.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
SOURCE  DB 10H, 20H, 30H, 40H, 50H, 60H, 70H, 80H, 90H, A0H ; Source data (Internal RAM)
DEST    DS 10            ; Destination space (Internal RAM), 10 bytes

;----------------------- Code Section -----------------------------
START:  
    MOV R0, #00          ; R0 will point to source address (internal RAM)
    MOV R1, #30H         ; R1 will point to destination address (internal RAM)

COPY_LOOP:
    MOV A, @R0           ; Load byte from source (internal RAM) into accumulator
    MOV @R1, A           ; Store byte from accumulator to destination (internal RAM)
    INC R0               ; Increment source address
    INC R1               ; Increment destination address
    MOV R2, #10          ; 10 bytes to copy
    CJNE R0, R2, COPY_LOOP ; Continue looping until all bytes are copied

    NOP                   ; End of block move

END                      ; End of program


; External Memory to Internal Memory

;***********************************************************************
; Program to Move Data from External Memory to Internal RAM
; This program copies 10 bytes of data from external memory 
; to internal RAM using the MOVX instruction.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
SOURCE  EQU 8000H        ; External memory address for source data
DEST    DS 10            ; Destination space (Internal RAM), 10 bytes

;----------------------- Code Section -----------------------------
START:  
    MOV DPTR, #SOURCE    ; Load the address of the external source into DPTR
    MOV R0, #30H         ; R0 will point to destination address (internal RAM)

COPY_LOOP:
    MOVX A, @DPTR        ; Load byte from external memory (using MOVX) into accumulator
    MOV @R0, A           ; Store byte from accumulator to destination (internal RAM)
    INC DPTR             ; Increment external memory address
    INC R0               ; Increment destination address
    MOV R2, #10          ; 10 bytes to copy
    CJNE R0, R2, COPY_LOOP ; Continue looping until all bytes are copied

    NOP                   ; End of block move

END                      ; End of program


; Internal Memory to External Memory

;***********************************************************************
; Program to Move Data from Internal RAM to External Memory
; This program copies 10 bytes of data from internal RAM 
; to external memory using the MOVX instruction.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
SOURCE  DB 10H, 20H, 30H, 40H, 50H, 60H, 70H, 80H, 90H, A0H ; Source data (Internal RAM)
DEST    EQU 8000H        ; External memory address for destination

;----------------------- Code Section -----------------------------
START:  
    MOV R0, #00          ; R0 will point to source address (internal RAM)
    MOV DPTR, #DEST      ; Load destination address into DPTR (external memory)

COPY_LOOP:
    MOV A, @R0           ; Load byte from source (internal RAM) into accumulator
    MOVX @DPTR, A        ; Store byte from accumulator to external memory (using MOVX)
    INC R0               ; Increment source address (internal RAM)
    INC DPTR             ; Increment destination address (external memory)
    MOV R2, #10          ; 10 bytes to copy
    CJNE R0, R2, COPY_LOOP ; Continue looping until all bytes are copied

    NOP                   ; End of block move

END                      ; End of program



; Internal Memory to External Memory

;***********************************************************************
; Program to Move Data from External Memory to External Memory
; This program copies 10 bytes of data from one external memory address 
; to another external memory address using the MOVX instruction.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
SOURCE  EQU 8000H        ; External source memory address (beginning of source data)
DEST    EQU 8100H        ; External destination memory address (start of destination)

;----------------------- Code Section -----------------------------
START:  
    MOV DPTR, #SOURCE    ; Load the address of the external source into DPTR
    MOV R0, #00          ; R0 will be used to store the byte offset (starting at 0)

COPY_LOOP:
    MOVX A, @DPTR        ; Load byte from external memory (using MOVX) into accumulator
    MOV DPTR, #DEST      ; Load the destination address into DPTR for the next byte
    MOVX @DPTR, A        ; Store byte from accumulator to external memory (destination)
    INC DPTR             ; Increment DPTR for external source address
    INC DPTR             ; Increment DPTR for external destination address (again)
    MOV R2, #10          ; Number of bytes to copy (10 bytes)
    CJNE R0, R2, COPY_LOOP ; Continue looping until all bytes are copied

    NOP                   ; End of block move

END                      ; End of program


