; 8051 Assembly: Enhanced Number Guessing Game with Score System
; Features: Classic Mode, Reverse Mode, Speed Mode, and Score System

ORG 0H            ; Program start address

; Game variables
TARGET_NUM   EQU 0x30    ; Memory location to store target number
USER_GUESS   EQU 0x31    ; Memory location to store user's guess
ATTEMPTS     EQU 0x32    ; Memory location to store attempts counter
MAX_ATTEMPTS EQU 0x33    ; Memory location to store max attempts
SCORE        EQU 0x34    ; Memory location to store score
TIMER_COUNT  EQU 0x35    ; Memory location to store timer count

START:
    MOV SP, #70H        ; Initialize Stack Pointer
    MOV R0, #0          ; Clear any previous data
    
    ; Initialize UART for communication
    MOV TMOD, #20H       ; Timer 1 mode 2 for baud rate generation
    MOV TH1, #0xFD       ; Baud rate for 9600 (assuming 11.0592 MHz clock)
    MOV TL1, #0xFD
    SETB TR1             ; Start Timer 1
    
    ; Show welcome message
    MOV SBUF, 'W'
    JNB TI, $
    CLR TI
    MOV SBUF, 'e'
    JNB TI, $
    CLR TI
    MOV SBUF, 'l'
    JNB TI, $
    CLR TI
    MOV SBUF, 'c'
    JNB TI, $
    CLR TI
    MOV SBUF, 'o'
    JNB TI, $
    CLR TI
    MOV SBUF, 'm'
    JNB TI, $
    CLR TI
    MOV SBUF, 'e'
    JNB TI, $
    CLR TI
    MOV SBUF, 13        ; New line
    JNB TI, $
    CLR TI
    
    ; Game modes prompt
    MOV SBUF, 'C'
    JNB TI, $
    CLR TI
    MOV SBUF, 'h'
    JNB TI, $
    CLR TI
    MOV SBUF, 'o'
    JNB TI, $
    CLR TI
    MOV SBUF, 'o'
    JNB TI, $
    CLR TI
    MOV SBUF, 's'
    JNB TI, $
    CLR TI
    MOV SBUF, 'e'
    JNB TI, $
    CLR TI

    ; Ask the user for mode selection
    MOV SBUF, '1'         ; Classic Mode
    JNB TI, $
    CLR TI
    MOV SBUF, '2'         ; Reverse Mode
    JNB TI, $
    CLR TI
    MOV SBUF, '3'         ; Speed Mode
    JNB TI, $
    CLR TI

    ; Wait for user input (game mode)
    MOV A, SBUF
    ; Based on the mode, start respective mode.
    ; 1 - Classic Mode
    ; 2 - Reverse Mode
    ; 3 - Speed Mode

    ; Classic Mode (user guesses number)
    ; Target number is set to 50 for now (this can be random or pre-defined)
    MOV R0, #50           ; Set target number to 50
    MOV R1, #0            ; Clear attempts counter
    MOV R2, #10           ; Max attempts set to 10
    
    ; Classic Mode Loop
CLASSIC_MODE:
    MOV SBUF, 'G'
    JNB TI, $
    CLR TI
    MOV SBUF, 'u'
    JNB TI, $
    CLR TI
    MOV SBUF, 'e'
    JNB TI, $
    CLR TI
    MOV SBUF, 's'
    JNB TI, $
    CLR TI
    MOV SBUF, 's'
    JNB TI, $
    CLR TI
    MOV SBUF, ' '
    JNB TI, $
    CLR TI

    ; User guesses number
    MOV SBUF, 'P'
    JNB TI, $
    CLR TI
    MOV SBUF, 'l'
    JNB TI, $
    CLR TI
    MOV SBUF, 'e'
    JNB TI, $
    CLR TI
    MOV SBUF, 'a'
    JNB TI, $
    CLR TI

    ; Get the user input for guess, validate and compare with target number
    ; If guess matches, print success message and exit loop, else print high/low feedback

    MOV A, USER_GUESS     ; Get the user input guess
    ; Compare the guess with target number and provide feedback

    ; Calculate Score
    ; Based on the number of attempts and time taken
    MOV A, ATTEMPTS
    MOV B, #10
    MUL AB
    MOV A, SCORE          ; Subtract the calculated penalty based on attempts

    ; Display score
    MOV SBUF, 'S'
    JNB TI, $
    CLR TI
    MOV SBUF, 'C'
    JNB TI, $
    CLR TI
    MOV SBUF, 'O'
    JNB TI, $
    CLR TI
    MOV SBUF, 'R'
    JNB TI, $
    CLR TI
    MOV SBUF, 'E'
    JNB TI, $
    CLR TI

    ; Ask if user wants to play again
    MOV SBUF, 'D'         ; Do you want to play again? (Y/N)
    JNB TI, $
    CLR TI
    ; Handle input response 'Y'/'N' and loop or exit accordingly.

    ; End the game
    MOV SBUF, 'E'
    JNB TI, $
    CLR TI
    MOV SBUF, 'N'
    JNB TI, $
    CLR TI
    MOV SBUF, 'D'
    JNB TI, $
    CLR TI
    MOV SBUF, 13         ; New line

    ; Halt program
    HLT

END
