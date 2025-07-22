def selection_sort(arr):
    """
    Selection Sort: Selects the smallest (or largest) element from the unsorted list and swaps it with the element at the beginning.
    Time Complexity: O(n^2)
    Stable: No
    """
    n = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i+1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]

# Example usage:
# data = [64, 25, 12, 22, 11]
# selection_sort(data)
# print(data)  # [11, 12, 22, 25, 64]