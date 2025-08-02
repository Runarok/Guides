def bubble_sort(arr):
    """
    Bubble Sort: Repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order.
    Time Complexity: O(n^2)
    Stable: Yes
    """
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]

# Example usage:
# data = [64, 34, 25, 12, 22, 11, 90]
# bubble_sort(data)
# print(data)  # [11, 12, 22, 25, 34, 64, 90]