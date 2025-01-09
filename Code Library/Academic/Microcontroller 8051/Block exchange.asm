; Internal Memory to Internal Memory

;***********************************************************************
; Program to Exchange Data between Internal RAM and Internal RAM
; This program swaps data between two internal RAM locations.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
SOURCE  DB 10H          ; Source data (Internal RAM)
DEST    DB 20H          ; Destination data (Internal RAM)

;----------------------- Code Section -----------------------------
START:
    MOV A, SOURCE        ; Load data from source (Internal RAM) into accumulator
    XCH DEST             ; Exchange data between accumulator and destination (Internal RAM)

    NOP                   ; End of program (You can add termination logic if needed)

END                      ; End of program



; Internal Memory to External Memory

;***********************************************************************
; Program to Exchange Data between Internal RAM and External Memory
; This program swaps data between internal RAM and external memory.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
SOURCE  DB 10H          ; Source data (Internal RAM)
DEST    EQU 8000H        ; Destination (External memory)

;----------------------- Code Section -----------------------------
START:
    MOV A, SOURCE        ; Load data from source (Internal RAM) into accumulator
    MOV DPTR, #DEST      ; Load destination address (External memory) into DPTR
    MOVX @DPTR, A        ; Store data from accumulator to external memory

    MOVX A, @DPTR        ; Load data from external memory to accumulator
    MOV SOURCE, A        ; Store data from accumulator to source (Internal RAM)

    NOP                   ; End of program (You can add termination logic if needed)

END                      ; End of program



; External Memory to External Memory

;***********************************************************************
; Program to Exchange Data between External Memory and External Memory
; This program swaps data between two external memory locations.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
SOURCE  EQU 8000H        ; Source address in external memory
DEST    EQU 8100H        ; Destination address in external memory

;----------------------- Code Section -----------------------------
START:
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
