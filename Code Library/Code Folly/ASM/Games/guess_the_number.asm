; 8051 Assembly: Guess the Number Game
; The number to be guessed is hardcoded as 0x25 (37 in decimal)
; User will input a number and the program will indicate if the guess is too high, too low, or correct.

ORG 0H            ; Start of the program memory

START:
    MOV SP, #70H    ; Initialize the Stack Pointer
    
    ; Set the predefined number to be guessed
    MOV R0, #0x25    ; Correct number = 0x25 (37 in decimal)
    
    ; Set up UART for communication
    MOV TMOD, #20H   ; Timer 1 mode 2 (auto reload)
    MOV TH1, #0xFD   ; Baud rate 9600 (assuming 11.0592 MHz clock)
    MOV TL1, #0xFD   ; Baud rate 9600
    SETB TR1          ; Start Timer 1 for UART
    
    ; Wait for user input
INPUT_LOOP:
    MOV SBUF, #'G'    ; Send "G" for "Guess the number" prompt
WAIT_FOR_TRANSMIT:
    JNB TI, WAIT_FOR_TRANSMIT  ; Wait until the transmit buffer is empty
    CLR TI            ; Clear transmit interrupt flag

    ; Receive user input
WAIT_FOR_RECEIVE:
    JNB RI, WAIT_FOR_RECEIVE   ; Wait until data is received
    MOV A, SBUF       ; Get the input value from the serial buffer
    CLR RI            ; Clear the receive interrupt flag

    ; Compare the input number with the correct number (R0)
    MOV B, A          ; Store input in register B for comparison

    ; Check if guess is too low
    INC B             ; Compare with correct number by incrementing it
    JC TOO_LOW        ; If carry set, the input was too low
    
    ; Check if guess is too high
    MOV A, B          ; If not, check if guess is too high
    MOV B, R0
    INC B
    JC TOO_HIGH

    ; Guess is correct
    MOV SBUF, #'C'    ; Send "C" for correct guess
    JUMP END_GAME

TOO_LOW:
    MOV SBUF, #'L'    ; Send "L" for too low
    JUMP INPUT_LOOP

TOO_HIGH:
    MOV SBUF, #'H'    ; Send "H" for too high
    JUMP INPUT_LOOP

END_GAME:
    MOV SBUF, #'E'    ; Send "E" for end of game
    HLT               ; Halt the game
    
END
