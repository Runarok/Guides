def tim_sort(arr):
    """
    Tim Sort: Hybrid sorting algorithm based on merge sort and insertion sort.
    Time Complexity: O(n log n)
    Stable: Yes
    """
    arr.sort()  # Python's built-in uses TimSort

# Example usage:
# data = [5, 21, 7, 23, 19]
# tim_sort(data)
# print(data)  # [5, 7, 19, 21, 23]