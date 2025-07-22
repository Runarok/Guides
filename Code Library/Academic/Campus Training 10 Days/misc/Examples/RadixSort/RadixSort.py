def radix_sort(arr):
    """
    Radix Sort: Sorts numbers by processing individual digits from least to most significant.
    Works for non-negative integers.
    Time Complexity: O(nk), where k is the number of digits.
    Stable: Yes
    """
    if not arr:
        return

    def counting_sort_exp(arr, exp):
        n = len(arr)
        output = [0] * n
        count = [0] * 10

        for i in range(n):
            index = arr[i] // exp
            count[index % 10] += 1

        for i in range(1, 10):
            count[i] += count[i - 1]

        for i in range(n - 1, -1, -1):
            index = arr[i] // exp
            output[count[index % 10] - 1] = arr[i]
            count[index % 10] -= 1

        for i in range(n):
            arr[i] = output[i]

    max1 = max(arr)
    exp = 1
    while max1 // exp > 0:
        counting_sort_exp(arr, exp)
        exp *= 10

# Example usage:
# data = [170, 45, 75, 90, 802, 24, 2, 66]
# radix_sort(data)
# print(data)  # [2, 24, 45, 66, 75, 90, 170, 802]