;***********************************************************************
; Program: Sorting Algorithm using Bubble Sort on 8051 Microcontroller
; This program demonstrates sorting in an array using both:
; 1. A third variable (for swapping)
; 2. Direct in-place swapping (without a third variable)
;***********************************************************************

ORG 0H              ; Program origin

;----------------------- Internal Memory to Internal Memory -----------------------------
; Data array to be sorted (Example of 5 numbers stored in internal RAM)
; Length of array (number of elements)

DATA:  DB 05H, 02H, 03H, 01H, 04H  ; Unsorted Data
LEN:   DB 05H   ; Length of the array

;----------------------- Sorting Using a Third Variable ------------------------------
; Bubble Sort Using a Temporary Third Variable for Swapping
START:
    MOV DPTR, #DATA   ; Load address of DATA array into DPTR
    MOV R0, #00       ; R0 will hold the index for the outer loop
    MOV R1, #00       ; R1 will hold the index for the inner loop
    MOV R2, #LEN      ; Load the length of the array in R2

OUTER_LOOP:
    MOV R1, R0
    INC R1
    MOV R3, R2       ; Store the length in R3 for comparison

INNER_LOOP:
    MOV A, @DPTR     ; Load current element from the array into A
    MOV B, A         ; Copy A into B (first element)
    INC DPTR
    MOV A, @DPTR     ; Load the next element into A
    MOV R4, A

    CJNE A, R4, NO_SWAP   ; If the elements are not equal, no swap needed

SWAP:
    MOV @DPTR, B     ; Swap the elements by moving B to the next location
    MOV DPTR, R1
    MOV @DPTR, A     ; Move A to the previous location
NO_SWAP:
    INC R1           ; Move to the next element
    CJNE R1, R3, INNER_LOOP  ; Continue the inner loop if not finished

    INC R0           ; Move to the next index for outer loop
    CJNE R0, R2, OUTER_LOOP  ; Continue the outer loop if not finished

    NOP              ; End of program
    END

;--------------------- Sorting Without a Third Variable --------------------------
; Bubble Sort Without Using a Temporary Variable for Swapping

START2:
    MOV DPTR, #DATA   ; Load address of DATA array into DPTR
    MOV R0, #00       ; R0 will hold the index for the outer loop
    MOV R1, #00       ; R1 will hold the index for the inner loop
    MOV R2, #LEN      ; Load the length of the array in R2

OUTER_LOOP2:
    MOV R1, R0
    INC R1
    MOV R3, R2       ; Store the length in R3 for comparison

INNER_LOOP2:
    MOV A, @DPTR     ; Load current element from the array into A
    MOV B, A         ; Copy A into B (first element)
    INC DPTR
    MOV A, @DPTR     ; Load the next element into A
    MOV R4, A

    CJNE A, R4, NO_SWAP2   ; If the elements are not equal, no swap needed

SWAP2:
    MOV A, @DPTR     ; Load current element into A
    MOV @DPTR, B     ; Swap the current element with the previous
    MOV DPTR, R1
    MOV @DPTR, A     ; Swap the previous element with the current
NO_SWAP2:
    INC R1           ; Move to the next element
    CJNE R1, R3, INNER_LOOP2  ; Continue inner loop if not finished

    INC R0           ; Move to the next index for outer loop
    CJNE R0, R2, OUTER_LOOP2  ; Continue outer loop if not finished

    NOP              ; End of program
    END

;***********************************************************************
; End of Program
;***********************************************************************
