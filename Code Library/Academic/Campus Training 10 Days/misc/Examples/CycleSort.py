def cycle_sort(arr):
    """
    Cycle Sort: Minimizes writes to memory; useful when writes are costly.
    Time Complexity: O(n^2)
    Stable: No
    """
    n = len(arr)
    for cycle_start in range(0, n - 1):
        item = arr[cycle_start]
        pos = cycle_start
        for i in range(cycle_start + 1, n):
            if arr[i] < item:
                pos += 1
        if pos == cycle_start:
            continue
        while item == arr[pos]:
            pos += 1
        arr[pos], item = item, arr[pos]
        while pos != cycle_start:
            pos = cycle_start
            for i in range(cycle_start + 1, n):
                if arr[i] < item:
                    pos += 1
            while item == arr[pos]:
                pos += 1
            arr[pos], item = item, arr[pos]

# Example usage:
# data = [20, 40, 50, 10, 30]
# cycle_sort(data)
# print(data)  # [10, 20, 30, 40, 50]