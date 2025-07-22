def quick_sort(arr):
    """
    Quick Sort: Uses divide and conquer by selecting a pivot and partitioning the array.
    Time Complexity: O(n log n) average, O(n^2) worst
    Stable: No
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

# Example usage:
# data = [10, 7, 8, 9, 1, 5]
# quick_sort(data)
# print(data)  # [1, 5, 7, 8, 9, 10]