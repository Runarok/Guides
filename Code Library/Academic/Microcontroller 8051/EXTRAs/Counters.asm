; Up Counters

;***********************************************************************
; Program to Demonstrate Up Counters for Binary, Decimal, Hexadecimal, and Octal
; This program demonstrates counting in binary, decimal, hexadecimal, and octal
; using internal memory in assembly.
;***********************************************************************

;----------------------- Binary Counter -----------------------------
; This section counts in binary and stores the result in internal memory.
; The counter increments by 1 in binary format, with 8-bit storage.
;***********************************************************************

section .data
    binaryCounter db 0x00      ; 8-bit binary counter (stored as a byte)

section .text
global _start

_start:
    ; Initialize Binary Counter to 0
    mov al, 0x00
    mov [binaryCounter], al

binary_loop:
    ; Increment Binary Counter by 1
    inc byte [binaryCounter]
    
    ; Display or store the value (you could extend this with output here)
    ; Placeholder for binary output logic
    
    ; Loop the binary counter
    jmp binary_loop

;----------------------- Decimal Counter -----------------------------
; This section counts in decimal and stores the result in internal memory.
; The counter increments by 1 in decimal format.
;***********************************************************************

section .data
    decimalCounter db 0x00      ; 8-bit decimal counter (stored as a byte)

section .text
global _start

_start:
    ; Initialize Decimal Counter to 0
    mov al, 0x00
    mov [decimalCounter], al

decimal_loop:
    ; Increment Decimal Counter by 1
    inc byte [decimalCounter]
    
    ; Display or store the value (you could extend this with output here)
    ; Placeholder for decimal output logic
    
    ; Loop the decimal counter
    jmp decimal_loop

;----------------------- Hexadecimal Counter -------------------------
; This section counts in hexadecimal and stores the result in internal memory.
; The counter increments by 1 in hexadecimal format.
;***********************************************************************

section .data
    hexCounter db 0x00      ; 8-bit hexadecimal counter (stored as a byte)

section .text
global _start

_start:
    ; Initialize Hexadecimal Counter to 0
    mov al, 0x00
    mov [hexCounter], al

hex_loop:
    ; Increment Hexadecimal Counter by 1
    inc byte [hexCounter]
    
    ; Display or store the value (you could extend this with output here)
    ; Placeholder for hexadecimal output logic
    
    ; Loop the hexadecimal counter
    jmp hex_loop

;----------------------- Octal Counter -----------------------------
; This section counts in octal and stores the result in internal memory.
; The counter increments by 1 in octal format.
;***********************************************************************

section .data
    octalCounter db 0x00      ; 8-bit octal counter (stored as a byte)

section .text
global _start

_start:
    ; Initialize Octal Counter to 0
    mov al, 0x00
    mov [octalCounter], al

octal_loop:
    ; Increment Octal Counter by 1
    inc byte [octalCounter]
    
    ; Display or store the value (you could extend this with output here)
    ; Placeholder for octal output logic
    
    ; Loop the octal counter
    jmp octal_loop

;***********************************************************************
; End of Program
; This program continuously increments counters for each numeral system.
;***********************************************************************

;---------------------------------------------------------------------------------


; Down Counters 

;***********************************************************************
; Program to Demonstrate Down Counters for Binary, Decimal, Hexadecimal, and Octal
; This program demonstrates counting down in binary, decimal, hexadecimal, and octal
; using internal memory in assembly.
;***********************************************************************

;----------------------- Binary Counter -----------------------------
; This section counts down in binary format, starting from 255 (0xFF) and decrements.
; The counter stops at 0x00 (binary 00000000).
;***********************************************************************

section .data
    binaryCounter db 0xFF      ; 8-bit binary counter, starting at 255 (0xFF)

section .text
global _start

_start:
    ; Initialize Binary Counter to 255 (0xFF)
    mov al, 0xFF
    mov [binaryCounter], al

binary_loop:
    ; Decrement Binary Counter by 1
    dec byte [binaryCounter]
    
    ; Display or store the value (you could extend this with output here)
    ; Placeholder for binary output logic
    
    ; Check if counter has reached zero, exit if so
    cmp byte [binaryCounter], 0x00
    je binary_done
    
    ; Continue looping
    jmp binary_loop

binary_done:
    ; End of binary counter section, continue to next section
    ; You can add code to jump to other counters or end the program

;----------------------- Decimal Counter -----------------------------
; This section counts down in decimal format, starting from 99 (0x63) and decrements.
; The counter stops at 0.
;***********************************************************************

section .data
    decimalCounter db 0x63      ; 8-bit decimal counter, starting at 99 (0x63)

section .text
global _start

_start:
    ; Initialize Decimal Counter to 99 (0x63)
    mov al, 0x63
    mov [decimalCounter], al

decimal_loop:
    ; Decrement Decimal Counter by 1
    dec byte [decimalCounter]
    
    ; Display or store the value (you could extend this with output here)
    ; Placeholder for decimal output logic
    
    ; Check if counter has reached zero, exit if so
    cmp byte [decimalCounter], 0x00
    je decimal_done
    
    ; Continue looping
    jmp decimal_loop

decimal_done:
    ; End of decimal counter section, continue to next section
    ; You can add code to jump to other counters or end the program

;----------------------- Hexadecimal Counter -------------------------
; This section counts down in hexadecimal format, starting from 0xFF and decrements.
; The counter stops at 0x00.
;***********************************************************************

section .data
    hexCounter db 0xFF      ; 8-bit hexadecimal counter, starting at 0xFF

section .text
global _start

_start:
    ; Initialize Hexadecimal Counter to 0xFF
    mov al, 0xFF
    mov [hexCounter], al

hex_loop:
    ; Decrement Hexadecimal Counter by 1
    dec byte [hexCounter]
    
    ; Display or store the value (you could extend this with output here)
    ; Placeholder for hexadecimal output logic
    
    ; Check if counter has reached zero, exit if so
    cmp byte [hexCounter], 0x00
    je hex_done
    
    ; Continue looping
    jmp hex_loop

hex_done:
    ; End of hexadecimal counter section, continue to next section
    ; You can add code to jump to other counters or end the program

;----------------------- Octal Counter -----------------------------
; This section counts down in octal format, starting from 0x77 (octal 77) and decrements.
; The counter stops at 0x00.
;***********************************************************************

section .data
    octalCounter db 0x77      ; 8-bit octal counter, starting at octal 77 (0x77)

section .text
global _start

_start:
    ; Initialize Octal Counter to octal 77 (0x77)
    mov al, 0x77
    mov [octalCounter], al

octal_loop:
    ; Decrement Octal Counter by 1
    dec byte [octalCounter]
    
    ; Display or store the value (you could extend this with output here)
    ; Placeholder for octal output logic
    
    ; Check if counter has reached zero, exit if so
    cmp byte [octalCounter], 0x00
    je octal_done
    
    ; Continue looping
    jmp octal_loop

octal_done:
    ; End of octal counter section, continue to next section
    ; You can add code to jump to other counters or end the program

;***********************************************************************
; End of Program
; This program continuously decrements counters for each numeral system.
;***********************************************************************

