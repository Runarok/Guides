"""
Non-Comparison-Based Sorting Algorithms

This file contains implementations of non-comparison-based sorting algorithms.
Each function takes a list and sorts it in-place (or returns a new sorted list if more appropriate).
Example usage and expected output are given as comments.
"""

# 1. Counting Sort
def counting_sort(arr):
    """
    Counting Sort: Counts the occurrence of each value and calculates positions.
    Only works for non-negative integers (or a known range with modifications).
    Time Complexity: O(n + k), where k is the range of input.
    Stable: Yes

    Example:
        data = [4, 2, 2, 8, 3, 3, 1]
        counting_sort(data)
        # data is now [1, 2, 2, 3, 3, 4, 8]
    """
    if not arr:
        return
    min_val = min(arr)
    max_val = max(arr)
    range_of_elements = max_val - min_val + 1

    # Initialize count array and output array
    count = [0] * range_of_elements
    output = [0] * len(arr)

    # Store the count of each element
    for num in arr:
        count[num - min_val] += 1

    # Change count[i] so that count[i] now contains actual position of this element in output array
    for i in range(1, len(count)):
        count[i] += count[i - 1]

    # Build the output array (stable sort)
    for num in reversed(arr):
        output[count[num - min_val] - 1] = num
        count[num - min_val] -= 1

    # Copy the output array to arr
    for i in range(len(arr)):
        arr[i] = output[i]

# 2. Radix Sort (for non-negative integers)
def radix_sort(arr):
    """
    Radix Sort: Sorts numbers by processing individual digits from least to most significant.
    Works for non-negative integers (can be adapted for other types).
    Time Complexity: O(nk), where k is the number of digits.
    Stable: Yes

    Example:
        data = [170, 45, 75, 90, 802, 24, 2, 66]
        radix_sort(data)
        # data is now [2, 24, 45, 66, 75, 90, 170, 802]
    """
    if not arr:
        return

    def counting_sort_exp(arr, exp):
        n = len(arr)
        output = [0] * n
        count = [0] * 10

        # Store count of occurrences in count[]
        for i in range(n):
            index = arr[i] // exp
            count[index % 10] += 1

        # Change count[i] so that count[i] contains position of digit in output[]
        for i in range(1, 10):
            count[i] += count[i - 1]

        # Build the output array
        for i in range(n - 1, -1, -1):
            index = arr[i] // exp
            output[count[index % 10] - 1] = arr[i]
            count[index % 10] -= 1

        # Copy the output array to arr
        for i in range(n):
            arr[i] = output[i]

    # Find the maximum number to know the number of digits
    max1 = max(arr)
    exp = 1
    while max1 // exp > 0:
        counting_sort_exp(arr, exp)
        exp *= 10

# 3. Bucket Sort (for floats in [0, 1) or customizable for known ranges)
def bucket_sort(arr):
    """
    Bucket Sort: Distributes elements into buckets, sorts each bucket, and concatenates.
    Typically used for uniformly distributed data.

    Time Complexity: O(n + k), average case if data is uniformly distributed.
    Stable: Yes (with stable sort in buckets)

    Example:
        data = [0.42, 4.21, 0.33, 2.57, 3.14, 1.23]
        bucket_sort(data)
        # data is now [0.33, 0.42, 1.23, 2.57, 3.14, 4.21]
    """
    if not arr:
        return

    # Decide number of buckets
    bucket_count = len(arr)
    min_value = min(arr)
    max_value = max(arr)
    range_value = max_value - min_value

    # Avoid division by zero if all elements are equal
    if range_value == 0:
        return

    # Create empty buckets
    buckets = [[] for _ in range(bucket_count)]

    # Insert elements into buckets
    for num in arr:
        # Finding the appropriate bucket index
        index = int((num - min_value) / range_value * (bucket_count - 1))
        buckets[index].append(num)

    # Sort each bucket and concatenate
    idx = 0
    for bucket in buckets:
        bucket.sort()
        for num in bucket:
            arr[idx] = num
            idx += 1

# 4. Pigeonhole Sort (for small range of integer keys)
def pigeonhole_sort(arr):
    """
    Pigeonhole Sort: Places each element in its pigeonhole, then collects them in order.
    Works best when the range of elements is not significantly greater than the number of elements.

    Time Complexity: O(n + r), where r is the range of elements.
    Stable: Yes

    Example:
        data = [8, 3, 2, 7, 4, 6, 8]
        pigeonhole_sort(data)
        # data is now [2, 3, 4, 6, 7, 8, 8]
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

# --------------------------------
# EXAMPLE USAGE (Uncomment to test)
# --------------------------------
# test_cases = [
#     ([4, 2, 2, 8, 3, 3, 1], counting_sort),
#     ([170, 45, 75, 90, 802, 24, 2, 66], radix_sort),
#     ([0.42, 4.21, 0.33, 2.57, 3.14, 1.23], bucket_sort),
#     ([8, 3, 2, 7, 4, 6, 8], pigeonhole_sort),
# ]
# for arr, sort_fn in test_cases:
#     l = arr.copy()
#     sort_fn(l)
#     print(f"{sort_fn.__name__}: {l}")