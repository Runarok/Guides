; Program to simulate a Binary Up Counter on 8051 Microcontroller
ORG 0000H            ; Organization of code memory from 0000H

; Initialize memory locations to 0 (clear counters)
CLR 50H              ; Clear upper byte counter (50H)
CLR 51H              ; Clear lower byte counter (51H)

UP:
    ACALL DELAY      ; Call the subroutine to provide delay between two counter values

    ; LOWER BYTE COUNTER (Ones place)
    MOV A, 51H       ; Get the current lower byte (ones place) counter
    ADD A, #01H      ; Add 01h to previous value to get next counter
    MOV 51H, A       ; Store the updated value back into the lower byte counter
    JNZ UP           ; If lower byte is not zero, repeat the process for the lower byte

    ; UPPER BYTE COUNTER (Tens place)
    MOV A, 50H       ; Get the current upper byte (tens place) counter
    ADD A, #01H      ; Add 01h to previous value to get next counter
    MOV 50H, A       ; Store the updated value back into the upper byte counter
    JNZ UP           ; If upper byte is not zero, repeat the process for the upper byte

    SJMP UP          ; Repeat this counter indefinitely

; Subroutine to provide delay between two counter values
DELAY:
    MOV DPTR, #04FFH ; Initialize the memory pointer (address 04FFH)
L2:
    INC DPTR          ; Increment the memory pointer
    MOV A, DPL        ; Load the lower byte of DPTR into the accumulator
    ORL A, DPH        ; OR the higher byte and lower byte of DPTR
    JNZ L2            ; If the result is not zero, continue the loop
    RET               ; Return to the main program

; END of program
END

; RESULT DURING EXECUTION:
; MEMORY WINDOW D:0x50H: (00 to FFH) (00 to FFH) 00 00 00 00
; The counter will increment from 00 to FF (in binary, i.e., 0 to 255 decimal) for both the lower and upper byte.
; During execution, the values in registers 50H (upper byte) and 51H (lower byte) will change as follows:

; D:0x50H: (00 to FFH)  ; Upper byte (tens place) will increment from 00H to FFH
; D:0x51H: (00 to FFH)  ; Lower byte (ones place) will increment from 00H to FFH
; The counter will loop indefinitely, incrementing both bytes.



; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

; Program to simulate a Binary Down Counter on 8051 Microcontroller
ORG 0000H            ; Organization of code memory from 0000H

; Initialize memory locations to 0xFF (starting counter value)
MOV 50H, #0FFH       ; Initialize upper byte of HEX counter with FFH
MOV 51H, #0FFH       ; Initialize lower byte of HEX counter with FFH

UP:
    ACALL DELAY      ; Call the subroutine to provide delay between two counter values

    ; LOWER BYTE COUNTER (Ones place)
    DEC 51H          ; Decrement the lower byte counter (ones place)
    MOV A, 51H       ; Store the lower byte counter value in the accumulator
    JNZ UP           ; If lower byte is not zero, repeat the process for the lower byte

    ; UPPER BYTE COUNTER (Tens place)
    DEC 50H          ; Decrement the upper byte counter (tens place)
    SJMP UP          ; Repeat this counter process until both bytes reach zero

; Subroutine to provide delay between two counter values
DELAY:
    MOV DPTR, #04FFH ; Initialize the memory pointer (address 04FFH)
L2:
    INC DPTR          ; Increment the memory pointer
    MOV A, DPL        ; Load the lower byte of DPTR into the accumulator
    ORL A, DPH        ; OR the higher byte and lower byte of DPTR
    JNZ L2            ; If the result is not zero, continue the loop
    RET               ; Return to the main program

; END of program
END

; RESULT DURING EXECUTION:
; MEMORY WINDOW D:0x50H: (FFH to 00H) (FFH to 00H) 00 00 00 00
; The counter will decrement from FF to 00 (in binary, i.e., 255 to 0 decimal) for both the lower and upper byte.
; During execution, the values in registers 50H (upper byte) and 51H (lower byte) will change as follows:

; D:0x50H: (FFH to 00H)  ; Upper byte (tens place) will decrement from FFH to 00H
; D:0x51H: (FFH to 00H)  ; Lower byte (ones place) will decrement from FFH to 00H
; The counter will loop indefinitely, decrementing both bytes until both bytes reach 00.

; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

; Program to simulate a BCD Up Counter on 8051 Microcontroller
ORG 0000H            ; Organization of code memory from 0000H

; Clear the counters (upper and lower byte)
CLR 50H              ; Clear upper byte counter (50H)
CLR 51H              ; Clear lower byte counter (51H)

UP:
    ACALL DELAY      ; Call the subroutine to provide delay between two counter values

    ; LOWER BYTE COUNTER (Ones place)
    MOV A, 51H       ; Get the current lower byte counter
    ADD A, #01H      ; Add 01h to the current value to get the next counter value
    DA A             ; Convert the result to BCD format (Decimal Adjust)
    MOV 51H, A       ; Store the updated counter value in the lower byte (51H)
    JNZ UP           ; If the lower byte counter is not zero, repeat the process

    ; UPPER BYTE COUNTER (Tens place)
    MOV A, 50H       ; If the lower byte reaches 0, get the current upper byte counter
    ADD A, #01H      ; Add 01h to the current value to get the next counter value
    DA A             ; Convert the result to BCD format (Decimal Adjust)
    MOV 50H, A       ; Store the updated counter value in the upper byte (50H)
    JNZ UP           ; If the upper byte counter is not zero, repeat the process

    SJMP UP          ; Repeat this counter until the program is stopped

; Subroutine to provide delay between two counter values
DELAY:
    MOV DPTR, #04FFH ; Initialize the memory pointer (address 04FFH)
L2:
    INC DPTR         ; Increment the memory pointer
    MOV A, DPL       ; Load the lower byte of DPTR into the accumulator
    ORL A, DPH       ; OR the higher byte and lower byte of DPTR
    JNZ L2           ; If the result is not zero, continue the loop
    RET              ; Return to the main program

; END of the program
END

; RESULT DURING EXECUTION:
; MEMORY WINDOW D:0x50H: (00 to 99H) (00 to 99H) 00 00 00 00
; The counter will increment from 00:00 to 99:99 (in BCD format).
; During execution, the values in registers 50H (upper byte) and 51H (lower byte) will change as follows:

; D:0x50H: (00 to 99H)   ; Upper byte (tens place) will increment from 00H to 99H.
; D:0x51H: (00 to 99H)   ; Lower byte (ones place) will increment from 00H to 99H.

; The counter will loop infinitely, incrementing the lower byte from 00 to 99, and then incrementing the upper byte
; as the lower byte rolls over to 00.

; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------------------

; BCD Down Counter Program for 8051 Microcontroller
ORG 0000H            ; Organization of code memory from 0000H

; Initialize the counters (upper and lower byte) to 99H
MOV 50H, #99H        ; Initialize upper byte of counter with 99H
MOV 51H, #99H        ; Initialize lower byte of counter with 99H

UP:
    ACALL DELAY      ; Call the subroutine to provide delay between two counter values

    ; LOWER BYTE COUNTER (Ones place)
    MOV A, 51H       ; Get the current lower byte counter
    ADD A, #99H      ; Add 99h to the current value to get the next counter value
    DA A             ; Convert the result to BCD format (Decimal Adjust)
    MOV 51H, A       ; Store the updated counter value in the lower byte (51H)
    JNZ UP           ; If the lower byte counter is not zero, repeat the process

    ; UPPER BYTE COUNTER (Tens place)
    MOV A, 50H       ; If the lower byte reaches 0, get the current upper byte counter
    ADD A, #99H      ; Add 99h to the current value to get the next counter value
    DA A             ; Convert the result to BCD format (Decimal Adjust)
    MOV 50H, A       ; Store the updated counter value in the upper byte (50H)
    JNZ UP           ; If the upper byte counter is not zero, repeat the process

    SJMP UP          ; Repeat this counter until the program is stopped

; Subroutine to provide delay between two counter values
DELAY:
    MOV DPTR, #04FFH ; Initialize the memory pointer (address 04FFH)
L2:
    INC DPTR         ; Increment the memory pointer
    MOV A, DPL       ; Load the lower byte of DPTR into the accumulator
    ORL A, DPH       ; OR the higher byte and lower byte of DPTR
    JNZ L2           ; If the result is not zero, continue the loop
    RET              ; Return to the main program

; END of the program
END

; RESULT DURING EXECUTION:
; MEMORY WINDOW D:0x50H: (99H to 00H) (99H to 00H) 00 00 00 00
; The counter will decrement from 99:99 to 00:00 in BCD format.
; During execution, the values in registers 50H (upper byte) and 51H (lower byte) will change as follows:

; D:0x50H: (99H to 00H)   ; Upper byte (tens place) will decrement from 99H to 00H.
; D:0x51H: (99H to 00H)   ; Lower byte (ones place) will decrement from 99H to 00H.

; The counter will loop indefinitely, decrementing the lower byte from 99 to 00, and then decrementing the upper byte
; as the lower byte rolls over to 99 again.
