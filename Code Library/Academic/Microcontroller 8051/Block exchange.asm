;***********************************************************************
; Program to Exchange Data between Different Memory Types
; This program swaps data between internal RAM, external memory, and more.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Internal Memory to Internal Memory -----------------------------
; Program to Exchange Data between Internal RAM and Internal RAM
; This program swaps data between two internal RAM locations.
SOURCE  DB 10H          ; Source data (Internal RAM)
DEST    DB 20H          ; Destination data (Internal RAM)

START1:
    MOV A, SOURCE        ; Load data from source (Internal RAM) into accumulator
    XCH DEST             ; Exchange data between accumulator and destination (Internal RAM)
    NOP                   ; End of program (You can add termination logic if needed)

;----------------------- Internal Memory to External Memory -----------------------------
; Program to Exchange Data between Internal RAM and External Memory
; This program swaps data between internal RAM and external memory.
SOURCE  DB 10H          ; Source data (Internal RAM)
DEST    EQU 8000H        ; Destination (External memory)

START2:
    MOV A, SOURCE        ; Load data from source (Internal RAM) into accumulator
    MOV DPTR, #DEST      ; Load destination address (External memory) into DPTR
    MOVX @DPTR, A        ; Store data from accumulator to external memory

    MOVX A, @DPTR        ; Load data from external memory to accumulator
    MOV SOURCE, A        ; Store data from accumulator to source (Internal RAM)

    NOP                   ; End of program (You can add termination logic if needed)

;----------------------- External Memory to External Memory -----------------------------
; Program to Exchange Data between External Memory and External Memory
; This program swaps data between two external memory locations.
SOURCE  EQU 8000H        ; Source address in external memory
DEST    EQU 8100H        ; Destination address in external memory

START3:
    MOV DPTR, #SOURCE    ; Load address of source (External memory) into DPTR
    MOVX A, @DPTR        ; Load data from source (External memory) into accumulator

    MOV DPTR, #DEST      ; Load address of destination (External memory) into DPTR
    MOVX @DPTR, A        ; Store data from accumulator to destination (External memory)

    MOV DPTR, #SOURCE    ; Load address of source (External memory) again into DPTR
    MOVX A, @DPTR        ; Load data from source (External memory) into accumulator
    MOV DPTR, #DEST      ; Load address of destination (External memory) into DPTR
    MOVX @DPTR, A        ; Store data from accumulator to destination (External memory)

    NOP                   ; End of program (You can add termination logic if needed)

END                      ; End of program
