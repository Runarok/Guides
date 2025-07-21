def insertion_sort(arr):
    """
    Insertion Sort: Builds the sorted list one item at a time, inserting each element into its proper place.
    Time Complexity: O(n^2)
    Stable: Yes
    """
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key

# Example usage:
# data = [12, 11, 13, 5, 6]
# insertion_sort(data)
# print(data)  # [5, 6, 11, 12, 13]