def gnome_sort(arr):
    """
    Gnome Sort: Moves items to their correct place by swapping, similar to insertion sort but simpler code.
    Time Complexity: O(n^2)
    Stable: Yes
    """
    i = 0
    n = len(arr)
    while i < n:
        if i == 0 or arr[i] >= arr[i - 1]:
            i += 1
        else:
            arr[i], arr[i - 1] = arr[i - 1], arr[i]
            i -= 1

# Example usage:
# data = [34, 2, 10, 6, 7, 3]
# gnome_sort(data)
# print(data)  # [2, 3, 6, 7, 10, 34]