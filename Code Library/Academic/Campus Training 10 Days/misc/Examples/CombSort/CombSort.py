def comb_sort(arr):
    """
    Comb Sort: Improves bubble sort by using a gap sequence to eliminate turtles (small values at end).
    Time Complexity: Average O(n^2/2^p), Best O(n log n)
    Stable: No
    """
    n = len(arr)
    gap = n
    shrink = 1.3
    sorted_ = False
    while not sorted_:
        gap = int(gap / shrink)
        if gap <= 1:
            gap = 1
            sorted_ = True
        i = 0
        while i + gap < n:
            if arr[i] > arr[i + gap]:
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted_ = False
            i += 1

# Example usage:
# data = [8, 4, 1, 56, 3, -44, 23, -6, 28, 0]
# comb_sort(data)
# print(data)  # [-44, -6, 0, 1, 3, 4, 8, 23, 28, 56]