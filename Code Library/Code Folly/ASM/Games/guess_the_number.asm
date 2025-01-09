; 8051 Assembly: Number Guessing Game with Score System

ORG 0H        ; Start of memory

START:
    MOV SP, #70H  ; Initialize Stack Pointer
    MOV R0, #50   ; Correct number = 50 (you can change this)
    MOV R1, #10   ; Maximum number of attempts
    MOV R2, #0    ; Attempts counter

    ; Initialize UART for communication
    MOV TMOD, #20H
    MOV TH1, #0xFD
    MOV TL1, #0xFD
    SETB TR1    ; Start Timer 1

    ; Display welcome message
    MOV SBUF, #'W'
WAIT1:
    JNB TI, WAIT1
    CLR TI
    MOV SBUF, #'e'
WAIT2:
    JNB TI, WAIT2
    CLR TI
    MOV SBUF, #'l'
WAIT3:
    JNB TI, WAIT3
    CLR TI
    MOV SBUF, #'c'
WAIT4:
    JNB TI, WAIT4
    CLR TI
    MOV SBUF, #'o'
WAIT5:
    JNB TI, WAIT5
    CLR TI
    MOV SBUF, #'m'
WAIT6:
    JNB TI, WAIT6
    CLR TI
    MOV SBUF, #'e'
WAIT7:
    JNB TI, WAIT7
    CLR TI
    MOV SBUF, #13  ; Line feed (new line)
WAIT8:
    JNB TI, WAIT8
    CLR TI
    MOV SBUF, #'G'  ; Display "Game starts now!"
WAIT9:
    JNB TI, WAIT9
    CLR TI

; Loop for the guessing game
GAME_LOOP:
    MOV SBUF, #'G'
WAIT10:
    JNB TI, WAIT10
    CLR TI
    MOV SBUF, #'u'
WAIT11:
    JNB TI, WAIT11
    CLR TI
    MOV SBUF, #'e'
WAIT12:
    JNB TI, WAIT12
    CLR TI
    MOV SBUF, #'s'
WAIT13:
    JNB TI, WAIT13
    CLR TI
    MOV SBUF, #'s'
WAIT14:
    JNB TI, WAIT14
    CLR TI

    ; Get the user's guess from UART
    MOV SBUF, #'P'
WAIT15:
    JNB TI, WAIT15
    CLR TI
    MOV SBUF, #'l'
WAIT16:
    JNB TI, WAIT16
    CLR TI

    MOV SBUF, #'e'
WAIT17:
    JNB TI, WAIT17
    CLR TI
    MOV SBUF, #'a'

    ; User guessed correctly, quit after 3 rounds.
