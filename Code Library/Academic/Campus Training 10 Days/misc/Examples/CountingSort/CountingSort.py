def counting_sort(arr):
    """
    Counting Sort: Counts the occurrence of each value and calculates positions.
    Only works for non-negative integers (or can be modified for negatives).
    Time Complexity: O(n + k), where k is the range of input.
    Stable: Yes
    """
    if not arr:
        return
    min_val = min(arr)
    max_val = max(arr)
    range_of_elements = max_val - min_val + 1
    count = [0] * range_of_elements
    output = [0] * len(arr)
    for num in arr:
        count[num - min_val] += 1
    for i in range(1, len(count)):
        count[i] += count[i - 1]
    for num in reversed(arr):
        output[count[num - min_val] - 1] = num
        count[num - min_val] -= 1
    for i in range(len(arr)):
        arr[i] = output[i]

# Example usage:
# data = [4, 2, 2, 8, 3, 3, 1]
# counting_sort(data)
# print(data)  # [1, 2, 2, 3, 3, 4, 8]