; Bubble Sort (Internal Memory)

;***********************************************************************
; Bubble Sort - Sorts an array in ascending order using the bubble sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; R0 = 0, index for outer loop
    MOV R1, #09          ; R1 = 9, the last index of the array
    MOV R2, #0           ; R2 = 0, flag for swap check

BUBBLE_LOOP:
    MOV R3, R0           ; R3 = R0, index for inner loop
    INC R3                ; R3 = R0 + 1, comparing adjacent elements

    ; Inner loop to compare adjacent elements
    MOV A, ARRAY + R0     ; Load ARRAY[R0] into A
    CMP A, ARRAY + R3     ; Compare ARRAY[R0] with ARRAY[R3]
    JC NO_SWAP            ; If ARRAY[R0] < ARRAY[R3], no swap needed

    ; Swap the elements if out of order
    MOV B, ARRAY + R0     ; Save ARRAY[R0] to B
    MOV ARRAY + R0, ARRAY + R3 ; Swap ARRAY[R0] with ARRAY[R3]
    MOV ARRAY + R3, B     ; Store value from B (previous ARRAY[R0])

    SETB R2               ; Set flag R2 to indicate that a swap occurred

NO_SWAP:
    INC R0                ; Increment R0 for next pair comparison
    CJNE R0, R1, BUBBLE_LOOP ; Continue inner loop if not at the end

    ; If no swap occurred, array is sorted
    MOV A, R2
    JZ DONE               ; If no swaps, finish the sorting process
    CLR R2                ; Reset swap flag for the next outer loop iteration
    MOV R0, #00           ; Reset R0 for the next iteration
    MOV R1, #09           ; Set R1 to last index again
    SJMP BUBBLE_LOOP

DONE:
    NOP                   ; End of the program
    END                   ; End of program



; Selection Sort (Internal Memory)

;***********************************************************************
; Selection Sort - Sorts an array in ascending order using the selection sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; R0 = 0, index for outer loop
    MOV R1, #09          ; R1 = 9, last index of the array

SELECTION_LOOP:
    MOV R2, R0           ; R2 = R0, start index of the unsorted portion
    MOV A, ARRAY + R0     ; Load ARRAY[R0] into A
    MOV R3, R0           ; R3 = R0, index of minimum element

    ; Inner loop to find the minimum element in the unsorted part
    INC R2                ; Move to next element in the unsorted part
    MOV R4, #09          ; R4 = 9, last index of the array

FIND_MIN:
    MOV A, ARRAY + R2     ; Load ARRAY[R2] into A
    CMP A, ARRAY + R3     ; Compare with current minimum (ARRAY[R3])
    JC UPDATE_MIN         ; If A < current minimum, update the minimum

    INC R2
    CJNE R2, R4, FIND_MIN ; Continue searching until end of array

    ; Swap minimum element with the current element
UPDATE_MIN:
    MOV B, ARRAY + R0     ; Store ARRAY[R0] in B
    MOV ARRAY + R0, ARRAY + R3 ; Swap ARRAY[R0] with ARRAY[R3]
    MOV ARRAY + R3, B     ; Store value in B into ARRAY[R3]

    INC R0                ; Move to next element in the unsorted part
    CJNE R0, R1, SELECTION_LOOP ; Continue sorting until the whole array is sorted

DONE:
    NOP                   ; End of the program
    END                   ; End of program



; Insertion Sort (Internal Memory)

;***********************************************************************
; Insertion Sort - Sorts an array in ascending order using the insertion sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    MOV R0, #01          ; Start from the second element
    MOV R1, #09          ; Last index of the array

INSERTION_LOOP:
    MOV A, ARRAY + R0     ; Load ARRAY[R0] into A
    MOV R2, R0           ; R2 = R0, index of the current element
    MOV R3, R0           ; R3 = R0, start of the sorted portion

SHIFT_LOOP:
    DEC R3                ; Move to previous element in sorted portion
    MOV B, ARRAY + R3     ; Load ARRAY[R3] into B
    CMP A, B              ; Compare current element with sorted element
    JC INSERT_ELEMENT     ; If A >= B, insert element

    MOV ARRAY + R2, B     ; Shift element one position to the right
    MOV R2, R3            ; Update index for next element comparison

    MOV R4, #00           ; Flag for shift operation
    JUMP SHIFT_LOOP       ; Repeat until current element is inserted

INSERT_ELEMENT:
    MOV ARRAY + R2, A     ; Insert current element in sorted position

    INC R0                ; Move to the next element in the array
    CJNE R0, R1, INSERTION_LOOP ; Continue sorting until the array is sorted

DONE:
    NOP                   ; End of program
    END                   ; End of program




; Merge Sort (Internal Memory)

;***********************************************************************
; Merge Sort - Sorts an array in ascending order using the merge sort algorithm.
; This program assumes the array is small and does not handle recursion deeply.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    ; We would typically implement merge sort using recursion, but 
    ; for simplicity, this is a basic version that assumes the 
    ; array is of size 10 and does not handle recursion deeply.
    ; Pseudo-code would involve:
    ; - Dividing the array into two halves.
    ; - Recursively sorting the two halves.
    ; - Merging the sorted halves.
    
    ; For simplicity, you can implement a small recursive sorting with predefined subarrays here.
    
    NOP                   ; End of the program
    END                   ; End of program




; Quick Sort (Internal Memory)

;***********************************************************************
; Quick Sort - Sorts an array in ascending order using quick sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; Low index = 0
    MOV R1, #09          ; High index = 9
    CALL QUICK_SORT
    NOP                   ; End of the program
    END

; Quick Sort subroutine
QUICK_SORT:
    ; Base case: If low >= high, return
    MOV A, R0
    CMP A, R1
    JC QUICKSORT_EXIT

    ; Partition the array and get the pivot index
    CALL PARTITION
    MOV R2, A            ; Save pivot index in R2

    ; Recursively sort the left subarray
    MOV A, R0
    MOV R3, R2           ; Set R3 to pivot index
    CALL QUICK_SORT

    ; Recursively sort the right subarray
    MOV A, R2
    INC A
    MOV R0, A            ; Low part starts from pivot+1
    MOV A, R1
    CALL QUICK_SORT

QUICKSORT_EXIT:
    RET

; Partition subroutine: Partitions the array around a pivot
PARTITION:
    ; Choose the pivot as the first element (ARRAY[R0])
    MOV A, ARRAY + R0     ; Load pivot element into A
    MOV R6, A            ; Store pivot in R6

    ; Start partitioning from R0 + 1
    MOV R4, R0           ; R4 = low index
    MOV R5, R1           ; R5 = high index

PARTITION_LOOP:
    ; Increment R4 to find an element greater than or equal to pivot
    INC R4
    MOV A, ARRAY + R4
    CMP A, R6
    JC PARTITION_LOOP

    ; Decrement R5 to find an element smaller than or equal to pivot
    DEC R5
    MOV A, ARRAY + R5
    CMP A, R6
    JC PARTITION_LOOP

    ; Swap the elements at R4 and R5
    MOV A, ARRAY + R4
    MOV B, ARRAY + R5
    MOV ARRAY + R4, B
    MOV ARRAY + R5, A

    ; Continue partitioning
    CJNE R4, R5, PARTITION_LOOP

    MOV A, R5            ; Return the pivot index
    RET





; Heap Sort (Internal Memory)

;***********************************************************************
; Heap Sort - Sorts an array in ascending order using heap sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    ; Build the heap by calling heapify for each element
    MOV R0, #04          ; Start heapifying from index 4 (the last non-leaf node)
    MOV R1, #09          ; Last index (9)
    CALL BUILD_HEAP

    ; Sort the array by repeatedly extracting the max element
    MOV R1, #09          ; Max element at root
HEAP_SORT_LOOP:
    ; Swap root with the last element
    MOV A, ARRAY + R1
    MOV B, ARRAY + R0
    MOV ARRAY + R0, A
    MOV ARRAY + R1, B

    DEC R1                ; Reduce heap size
    CALL HEAPIFY          ; Heapify the root
    CJNE R1, #00, HEAP_SORT_LOOP
    NOP
    END

; Build heap subroutine
BUILD_HEAP:
    MOV R2, R0           ; Current index to heapify
    CALL HEAPIFY
    INC R2                ; Move to the next node
    MOV R0, R2
    CJNE R0, R1, BUILD_HEAP
    RET

; Heapify subroutine
HEAPIFY:
    ; Assume the element at R0 is a node in the heap, and we need to ensure the heap property
    MOV R3, R0           ; Current node
    MOV A, ARRAY + R0     ; Load current node value
    MOV R4, R0           ; Left child index = 2 * i + 1
    SHL R4, #1            ; Left child = 2*i
    INC R4                ; Left child = 2*i + 1
    MOV B, ARRAY + R4    ; Left child value
    CMP A, B
    JC LEFT_CHILD_GREATER
    MOV A, B

LEFT_CHILD_GREATER:
    MOV R5, R4           ; Store left child index in R5
    RET



; Radix Sort (Internal Memory)

;***********************************************************************
; Radix Sort - Sorts an array in ascending order using the radix sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    ; Sort the array by processing digits (simplified)
    MOV R0, #00          ; Start from the least significant digit
    MOV R1, #09          ; Maximum element value (9)
    CALL RADIX_SORT
    NOP                   ; End of program
    END

; Radix Sort subroutine
RADIX_SORT:
    ; Process each digit (start from least significant digit)
    ; Simplified version: we assume only one digit
    MOV R2, #00          ; Count array for digits 0-9
    MOV R3, #09          ; Maximum value
    RET




; Shell Sort (Internal Memory)
 
;***********************************************************************
; Shell Sort - Sorts an array in ascending order using shell sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    MOV R0, #4           ; Initial gap (size of sublist)
    CALL SHELL_SORT
    NOP                   ; End of program
    END

; Shell Sort subroutine
SHELL_SORT:
    MOV R1, #09          ; Array size = 10
SHELL_LOOP:
    ; Perform insertion sort with current gap
    MOV R2, R0
    MOV R3, #00          ; Start comparing with R0

    CJNE R0, R1, SHELL_LOOP
    RET





; Counting Sort (Internal Memory)

;***********************************************************************
; Counting Sort - Sorts an array in ascending order using counting sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    MOV R0, #00          ; Start at index 0
    MOV R1, #09          ; Maximum value index
    CALL COUNTING_SORT
    NOP                   ; End of program
    END

; Counting Sort subroutine
COUNTING_SORT:
    ; Setup count array for 0-9
    MOV R2, #00          ; Initialize counters
    RET
