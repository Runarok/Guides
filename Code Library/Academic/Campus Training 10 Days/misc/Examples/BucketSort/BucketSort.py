def bucket_sort(arr):
    """
    Bucket Sort: Distributes elements into buckets, sorts each bucket, and concatenates.
    Typically used for uniformly distributed data.
    Time Complexity: O(n + k), average case if data is uniformly distributed.
    Stable: Yes (with stable sort in buckets)
    """
    if not arr:
        return

    bucket_count = len(arr)
    min_value = min(arr)
    max_value = max(arr)
    range_value = max_value - min_value

    if range_value == 0:
        return

    buckets = [[] for _ in range(bucket_count)]
    for num in arr:
        index = int((num - min_value) / range_value * (bucket_count - 1))
        buckets[index].append(num)

    idx = 0
    for bucket in buckets:
        bucket.sort()
        for num in bucket:
            arr[idx] = num
            idx += 1

# Example usage:
# data = [0.42, 4.21, 0.33, 2.57, 3.14, 1.23]
# bucket_sort(data)
# print(data)  # [0.33, 0.42, 1.23, 2.57, 3.14, 4.21]