def shell_sort(arr):
    """
    Shell Sort: Generalization of insertion sort that allows the exchange of items far apart.
    Time Complexity: Depends on gap sequence (best: O(n log n), worst: O(n^2))
    Stable: No
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

# Example usage:
# data = [12, 34, 54, 2, 3]
# shell_sort(data)
# print(data)  # [2, 3, 12, 34, 54]