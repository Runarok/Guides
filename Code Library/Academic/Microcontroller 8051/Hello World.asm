; ----- MEMORY WINDOW BEFORE EXECUTION -----
; Initial state of special function registers and data memory.
; SCON: Serial Control Register
; TH1, TL1: Timer 1 High and Low bytes for baud rate setting
; MYDATA0: String to be sent via serial communication

CR EQU 0DH      ; Carriage Return (CR)
LF EQU 0AH      ; Line Feed (LF)

ORG 0H          ; Start of code

; Initialization of the Special Function Registers (SFR)
MOV A, #0CH     ; Clear screen command
ACALL SENDsr    ; Call SENDsr to send the clear screen command
MOV A, #LF      ; Line Feed
ACALL SENDsr    ; Call SENDsr to send a line feed
MOV DPTR, #MYDATA0  ; Load pointer for message (MYDATA0) to DPTR

; Start of main loop to send string continuously
H_1: CLR A
MOVC A, @A + DPTR   ; Get the next character from code memory (MYDATA0)
JZ HERE              ; If the character is zero (null terminator), exit loop
ACALL SENDsr         ; Otherwise, call SENDsr to send the character
ACALL DELAY          ; Delay between sending characters
INC DPTR             ; Increment DPTR to point to the next character
SJMP H_1             ; Jump back to send the next character

; Serial Data Transfer Subroutine (SENDsr)
SENDsr: 
    MOV TMOD, #20H    ; Timer 1, mode 2 (auto-reload)
    MOV TH1, #-3      ; 9600 baud rate setting for Timer 1
    MOV SCON, #50H    ; 8-bit data, 1 stop bit, REN enabled
    SETB TR1          ; Start Timer 1
    MOV SBUF, A       ; Load data from ACC to serial buffer (SBUF)
    JNB TI, $         ; Wait until transmission complete (TI bit set)
    CLR TI            ; Clear TI bit for next character
    RET               ; Return from SENDsr subroutine

; Delay Subroutine (DELAY)
DELAY:
    MOV R0, #05H      ; Set delay counter
DELAY1:
    MOV TMOD, #10H    ; Set Timer 1 in mode 1 (16-bit mode)
    MOV TL1, #00H     ; Set low byte of Timer 1 to 0
    MOV TH1, #00H     ; Set high byte of Timer 1 to 0
    SETB TR1          ; Start Timer 1
    JNB TF1, $        ; Wait until TF1 (Timer 1 overflow) flag is set
    CLR TR1           ; Clear Timer 1 control bit to stop the timer
    CLR TF1           ; Clear Timer 1 overflow flag
    DJNZ R0, DELAY1   ; Decrement R0 and loop if not zero
    RET               ; Return from delay subroutine

; The string to be sent
MYDATA0: DB CR, LF, "Hello World", 0  ; Message to be transmitted (null-terminated)

HERE:
    SJMP HERE         ; Infinite loop (stops the program here)

END
