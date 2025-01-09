;***********************************************************************
; Basic Linear Search (Iterative)
; Find Largest Element in an Array (Basic Linear Search)
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; Array of 10 elements

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; Set R0 to 0 (starting index of array)
    MOV R1, #10          ; Set R1 to 10 (number of elements in array)
    MOV A, ARRAY + R0    ; Load first element into A (A will hold the largest element)
    MOV R2, A            ; Store the first element as the largest (R2 holds largest value)

FIND_LARGEST_LOOP:
    INC R0               ; Increment R0 to point to the next element
    MOV A, ARRAY + R0    ; Load the next element into A
    CMP A, R2            ; Compare A (current element) with R2 (largest so far)
    JC NEXT_ELEMENT      ; If current element is less than or equal to largest, skip

    MOV R2, A            ; If current element is greater, update R2 (largest value)

NEXT_ELEMENT:
    INC R1               ; Increment element counter (R1)
    MOV A, R1            ; Check if all elements are processed
    CMP A, #10           ; Compare with 10 (total number of elements)
    JC FIND_LARGEST_LOOP ; If not all elements are processed, repeat the loop

    ; At this point, the largest element is stored in R2
    NOP                   ; No operation (end of program)
    END                   ; End of program


;***********************************************************************
; Find Largest Element Using a Subroutine
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; Array of 10 elements

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; Set R0 to 0 (starting index of array)
    MOV R1, #10          ; Set R1 to 10 (number of elements in array)
    MOV A, ARRAY + R0    ; Load first element into A (A will hold the largest element)
    MOV R2, A            ; Store the first element as the largest (R2 holds largest value)

    CALL FIND_LARGEST    ; Call subroutine to find largest element
    NOP                   ; No operation (end of program)
    END                   ; End of program

;----------------------- Subroutine -----------------------------
FIND_LARGEST:
    MOV R3, R0           ; Copy R0 (index) into R3 to keep track
FIND_LARGEST_LOOP:
    INC R3               ; Increment the index
    MOV A, ARRAY + R3    ; Load the next element into A
    CMP A, R2            ; Compare A (current element) with R2 (largest)
    JC NEXT_ELEMENT      ; If A <= R2, continue loop

    MOV R2, A            ; Update R2 with new largest value

NEXT_ELEMENT:
    INC R1               ; Increment element counter
    MOV A, R1            ; Compare the counter with the total number of elements
    CMP A, #10
    JC FIND_LARGEST_LOOP ; Loop if not all elements are processed

    RET                  ; Return from subroutine


;***********************************************************************
; Find Largest Element Using Recursion
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; Array of 10 elements

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; Set R0 to 0 (starting index of array)
    MOV R1, #09          ; Set R1 to the last index (9)
    MOV A, ARRAY + R0    ; Load first element into A
    MOV R2, A            ; Store the first element as largest (R2)

    CALL FIND_LARGEST_RECURSIVE
    NOP                   ; No operation (end of program)
    END                   ; End of program

;----------------------- Recursive Subroutine -----------------------------
FIND_LARGEST_RECURSIVE:
    MOV A, R0            ; Load current index
    INC A
    MOV R0, A            ; Increment index
    MOV A, ARRAY + R0    ; Load the next element into A
    CMP A, R2            ; Compare current element with largest so far (R2)
    JC RECURSION_EXIT    ; If current element is not larger, exit

    MOV R2, A            ; Update largest value if found a new max

RECURSION_EXIT:
    MOV A, R0
    MOV R3, R1           ; Check if all elements are processed
    CMP A, R3
    JC FIND_LARGEST_RECURSIVE ; Recurse until all elements are compared

    RET


;***********************************************************************
; Optimized Find Largest Element with Early Exit
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; Array of 10 elements

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; Set R0 to 0 (starting index of array)
    MOV R1, #10          ; Set R1 to 10 (number of elements in array)
    MOV A, ARRAY + R0    ; Load first element into A
    MOV R2, A            ; Store the first element as the largest (R2)

FIND_LARGEST_LOOP:
    INC R0               ; Increment R0 to point to the next element
    MOV A, ARRAY + R0    ; Load the next element into A
    CMP A, R2            ; Compare A (current element) with R2 (largest so far)
    JC CHECK_END         ; If current element is less than or equal to largest, skip

    MOV R2, A            ; If current element is greater, update R2 (largest value)

CHECK_END:
    INC R1               ; Increment element counter (R1)
    MOV A, R1            ; Check if all elements are processed
    CMP A, #10           ; Compare with 10 (total number of elements)
    JC FIND_LARGEST_LOOP ; If not all elements are processed, repeat the loop

    ; At this point, the largest element is stored in R2
    NOP                   ; No operation (end of program)
    END                   ; End of program


;***********************************************************************
; Find Largest Element Using Comparison Subroutine
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; Array of 10 elements

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; Set R0 to 0 (starting index of array)
    MOV R1, #09          ; Set R1 to 9 (last index)
    MOV A, ARRAY + R0    ; Load the first element into A
    MOV R2, A            ; Store the first element as largest (R2)

    CALL COMPARE_LOOP    ; Call subroutine to compare elements
    NOP                   ; No operation (end of program)
    END                   ; End of program

;----------------------- Comparison Subroutine -----------------------------
COMPARE_LOOP:
    INC R0               ; Increment R0 to next index
    MOV A, ARRAY + R0    ; Load the next element into A
    CALL COMPARE         ; Compare current element with R2 (largest so far)
    RET

; Comparison subroutine
COMPARE:
    CMP A, R2            ; Compare current element with largest
    JC COMPARE_EXIT      ; If current element is smaller or equal, skip
    MOV R2, A            ; If current element is larger, update largest (R2)

COMPARE_EXIT:
    RET

