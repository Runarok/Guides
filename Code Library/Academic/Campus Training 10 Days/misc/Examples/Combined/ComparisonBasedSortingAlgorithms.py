"""
Comparison-Based Sorting Algorithms

This file contains implementations of several classic comparison-based sorting algorithms.
Each function accepts a list and sorts it in-place. Example usage and expected output are provided as comments.
"""

# 1. Bubble Sort
def bubble_sort(arr):
    """
    Bubble Sort: Repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order.
    Time Complexity: O(n^2)
    Stable: Yes

    Example:
        data = [64, 34, 25, 12, 22, 11, 90]
        bubble_sort(data)
        # data is now [11, 12, 22, 25, 34, 64, 90]
    """
    n = len(arr)
    for i in range(n):
        # Last i elements are already in place
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]

# 2. Selection Sort
def selection_sort(arr):
    """
    Selection Sort: Selects the smallest (or largest) element from the unsorted list and swaps it with the element at the beginning.
    Time Complexity: O(n^2)
    Stable: No

    Example:
        data = [64, 25, 12, 22, 11]
        selection_sort(data)
        # data is now [11, 12, 22, 25, 64]
    """
    n = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i+1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]

# 3. Insertion Sort
def insertion_sort(arr):
    """
    Insertion Sort: Builds the sorted list one item at a time, inserting each element into its proper place.
    Time Complexity: O(n^2)
    Stable: Yes

    Example:
        data = [12, 11, 13, 5, 6]
        insertion_sort(data)
        # data is now [5, 6, 11, 12, 13]
    """
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        # Move elements of arr[0..i-1], that are greater than key, to one position ahead
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key

# 4. Merge Sort
def merge_sort(arr):
    """
    Merge Sort: Uses divide and conquer, splits the list into halves, sorts each recursively, and merges them.
    Time Complexity: O(n log n)
    Stable: Yes

    Example:
        data = [12, 11, 13, 5, 6, 7]
        merge_sort(data)
        # data is now [5, 6, 7, 11, 12, 13]
    """
    if len(arr) > 1:
        mid = len(arr) // 2
        L = arr[:mid]
        R = arr[mid:]

        merge_sort(L)
        merge_sort(R)

        # Merge the sorted halves
        i = j = k = 0
        while i < len(L) and j < len(R):
            if L[i] <= R[j]:
                arr[k] = L[i]
                i += 1
            else:
                arr[k] = R[j]
                j += 1
            k += 1

        # Copy any remaining elements
        while i < len(L):
            arr[k] = L[i]
            i += 1
            k += 1
        while j < len(R):
            arr[k] = R[j]
            j += 1
            k += 1

# 5. Quick Sort
def quick_sort(arr):
    """
    Quick Sort: Uses divide and conquer by selecting a pivot and partitioning the array.
    Time Complexity: O(n log n) average, O(n^2) worst
    Stable: No

    Example:
        data = [10, 7, 8, 9, 1, 5]
        quick_sort(data)
        # data is now [1, 5, 7, 8, 9, 10]
    """
    def _quick_sort(items, low, high):
        if low < high:
            pi = partition(items, low, high)
            _quick_sort(items, low, pi - 1)
            _quick_sort(items, pi + 1, high)

    def partition(items, low, high):
        pivot = items[high]
        i = low - 1
        for j in range(low, high):
            if items[j] <= pivot:
                i += 1
                items[i], items[j] = items[j], items[i]
        items[i + 1], items[high] = items[high], items[i + 1]
        return i + 1

    _quick_sort(arr, 0, len(arr) - 1)

# 6. Heap Sort
def heap_sort(arr):
    """
    Heap Sort: Converts the list to a heap structure and repeatedly extracts the max (or min).
    Time Complexity: O(n log n)
    Stable: No

    Example:
        data = [12, 11, 13, 5, 6, 7]
        heap_sort(data)
        # data is now [5, 6, 7, 11, 12, 13]
    """
    def heapify(arr, n, i):
        largest = i
        left = 2 * i + 1
        right = 2 * i + 2
        if left < n and arr[left] > arr[largest]:
            largest = left
        if right < n and arr[right] > arr[largest]:
            largest = right
        if largest != i:
            arr[i], arr[largest] = arr[largest], arr[i]
            heapify(arr, n, largest)

    n = len(arr)
    # Build max heap
    for i in range(n // 2 - 1, -1, -1):
        heapify(arr, n, i)
    # Extract elements
    for i in range(n - 1, 0, -1):
        arr[i], arr[0] = arr[0], arr[i]
        heapify(arr, i, 0)

# 7. Shell Sort
def shell_sort(arr):
    """
    Shell Sort: Generalization of insertion sort that allows the exchange of items far apart.
    Time Complexity: Depends on gap sequence (best: O(n log n), worst: O(n^2))
    Stable: No

    Example:
        data = [12, 34, 54, 2, 3]
        shell_sort(data)
        # data is now [2, 3, 12, 34, 54]
    """
    n = len(arr)
    gap = n // 2
    while gap > 0:
        for i in range(gap, n):
            temp = arr[i]
            j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap //= 2

# 8. Tim Sort (Python's built-in sorted uses Tim Sort)
def tim_sort(arr):
    """
    Tim Sort: Hybrid sorting algorithm based on merge sort and insertion sort.
    Time Complexity: O(n log n)
    Stable: Yes

    Example:
        data = [5, 21, 7, 23, 19]
        tim_sort(data)
        # data is now [5, 7, 19, 21, 23]
    """
    arr.sort()  # Python's built-in uses TimSort

# --------------------------------
# EXAMPLE USAGE (Uncomment to test)
# --------------------------------
# test_cases = [
#     [64, 34, 25, 12, 22, 11, 90],
#     [12, 11, 13, 5, 6, 7],
#     [5, 21, 7, 23, 19],
#     [10, 7, 8, 9, 1, 5],
#     [12, 34, 54, 2, 3]
# ]
# for sort_fn in [bubble_sort, selection_sort, insertion_sort, merge_sort, quick_sort, heap_sort, shell_sort, tim_sort]:
#     for case in test_cases:
#         arr = case.copy()
#         sort_fn(arr)
#         print(f"{sort_fn.__name__}: {arr}")