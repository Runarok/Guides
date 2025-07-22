def heap_sort(arr):
    """
    Heap Sort: Converts the list to a heap structure and repeatedly extracts the max (or min).
    Time Complexity: O(n log n)
    Stable: No
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
    for i in range(n // 2 - 1, -1, -1):
        heapify(arr, n, i)
    for i in range(n - 1, 0, -1):
        arr[i], arr[0] = arr[0], arr[i]
        heapify(arr, i, 0)

# Example usage:
# data = [12, 11, 13, 5, 6, 7]
# heap_sort(data)
# print(data)  # [5, 6, 7, 11, 12, 13]