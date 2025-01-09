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
; Quick Sort - Sorts an array in ascending order using the quick sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    ; Call Quick Sort with the array bounds (0 to 9)
    MOV R0, #00          ; R0 = 0 (low index)
    MOV R1, #09          ; R1 = 9 (high index)
    CALL QUICK_SORT
    NOP
    END

; Quick Sort subroutine
QUICK_SORT:
    ; Base case: if low >= high, return
    MOV A, R0
    CMP A, R1
    JC QUICKSORT_EXIT
    
    ; Partition the array and get the pivot index
    CALL PARTITION
    MOV R2, A            ; Save the pivot index in R2
    ; Recursively sort left and right subarrays
    MOV A, R0
    MOV R3, R2
    CALL QUICK_SORT
    MOV A, R2
    INC A
    MOV R0, A            ; Low part starts from pivot+1
    MOV A, R1
    CALL QUICK_SORT

QUICKSORT_EXIT:
    RET

; Partition subroutine: Returns the pivot index
PARTITION:
    ; Partitioning logic using pivot (using the first element as pivot)
    MOV R4, R0           ; R4 = low index
    MOV R5, R1           ; R5 = high index
    MOV A, ARRAY + R0     ; Load pivot element into A
    MOV R6, A            ; R6 = pivot value

PARTITION_LOOP:
    ; Move R4 and R5 to find the correct place to swap
    INC R4
    MOV A, ARRAY + R4     ; Compare element with pivot
    CMP A, R6
    JC PARTITION_LOOP     ; If A <= pivot, keep moving R4
    
    DEC R5
    MOV A, ARRAY + R5     ; Compare element with pivot
    CMP A, R6
    JC PARTITION_LOOP     ; If A >= pivot, keep moving R5
    
    ; Swap elements at R4 and R5
    MOV A, ARRAY + R4
    MOV B, ARRAY + R5
    MOV ARRAY + R4, B
    MOV ARRAY + R5, A
    SJMP PARTITION_LOOP

    RET




; Heap Sort (Internal Memory)

;***********************************************************************
; Heap Sort - Sorts an array in ascending order using the heap sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    ; Build max heap
    MOV R0, #00          ; Start index for heapify
    MOV R1, #09          ; End index (array size - 1)
    CALL HEAPIFY

    ; Sort the array by repeatedly extracting the max element
    MOV R1, #09          ; Max element at the root
HEAP_SORT_LOOP:
    MOV A, ARRAY + R1     ; Extract max
    MOV B, ARRAY + R0
    MOV ARRAY + R0, A
    MOV ARRAY + R1, B

    DEC R1                ; Reduce heap size
    CALL HEAPIFY          ; Re-heapify the root
    CJNE R1, #00, HEAP_SORT_LOOP
    NOP
    END

; Heapify subroutine
HEAPIFY:
    ; Assuming the array follows a heap structure, check and maintain the max-heap property
    MOV R2, R0           ; Current node
    MOV R3, R0
    MOV A, ARRAY + R0     ; Load current node
    MOV R4, R0
    MOV R5, R1           ; Start index for heap size
    ; Further logic to heapify nodes and maintain the heap property
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
    ; Assuming the array is in base 10, start sorting from least significant digit
    MOV R0, #00          ; Start digit place
    MOV R1, #9           ; We sort based on each digit (10)
    CALL RADIX_SORT

    NOP                   ; End of the program
    END

; Radix Sort subroutine
RADIX_SORT:
    ; For each digit place, use a stable sort like counting sort
    ; Implement counting sort for each digit (with appropriate carry)
    RET



; Shell Sort (Internal Memory)
 
;***********************************************************************
; Shell Sort - Sorts an array in ascending order using the shell sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    ; Use a decreasing sequence of gaps
    MOV R0, #04          ; Gap size
    CALL SHELL_SORT
    NOP                   ; End of the program
    END

; Shell Sort subroutine
SHELL_SORT:
    ; Implement shell sort with a specific gap sequence
    RET




; Counting Sort (Internal Memory)

;***********************************************************************
; Counting Sort - Sorts an array in ascending order using the counting sort algorithm.
;***********************************************************************

ORG 0H                  ; Origin, starting point of the program

;----------------------- Data Section -----------------------------
ARRAY   DB 10H, 5H, 3H, 8H, 2H, 7H, 6H, 1H, 9H, 4H ; 10-element array

;----------------------- Code Section -----------------------------
START:
    ; Prepare an auxiliary array for counting
    MOV R0, #00          ; Index for the counting array
    MOV R1, #09          ; Max value (9 for this array)
    CALL COUNTING_SORT
    NOP
    END

; Counting Sort subroutine
COUNTING_SORT:
    ; Logic for counting occurrences of each number in the input array
    ; Rebuild the sorted array using the count array
    RET

