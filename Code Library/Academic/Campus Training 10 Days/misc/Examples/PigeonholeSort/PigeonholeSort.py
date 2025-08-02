def pigeonhole_sort(arr):
    """
    Pigeonhole Sort: Places elements into pigeonholes based on value, then collects in order.
    Good for small ranges of integer keys.
    Time Complexity: O(n + r), where r is range of elements.
    Stable: Yes
    """
    if not arr:
        return
    min_val = min(arr)
    max_val = max(arr)
    size = max_val - min_val + 1
    holes = [[] for _ in range(size)]
    for num in arr:
        holes[num - min_val].append(num)
    idx = 0
    for hole in holes:
        for num in hole:
            arr[idx] = num
            idx += 1

# Example usage:
# data = [8, 3, 2, 7, 4, 6, 8]
# pigeonhole_sort(data)
# print(data)  # [2, 3, 4, 6, 7, 8, 8]