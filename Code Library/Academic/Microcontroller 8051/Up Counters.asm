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
