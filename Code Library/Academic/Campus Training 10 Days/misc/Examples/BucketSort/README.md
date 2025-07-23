# 🪣 Bucket Sort in Python

This file provides a Python implementation of the **Bucket Sort** algorithm. Bucket Sort is particularly effective when sorting elements that are **uniformly distributed over a known range**. It works by distributing the elements into a number of buckets, sorting each bucket individually (typically using another algorithm like insertion or Python's built-in sort), and then concatenating the results.

---

## 📦 File Structure

- [`BucketSort.py`](./BucketSort.py): Contains the `bucket_sort()` function and a sample usage block (commented).

---

## 📌 What is Bucket Sort?

**Bucket Sort** is a distribution sort that:

1. **Distributes** elements into a fixed number of buckets based on value range.
2. **Sorts** each bucket individually (often using a stable sorting algorithm).
3. **Concatenates** the sorted buckets to form the final sorted array.

It is most efficient when the data is **evenly or uniformly distributed**.

---

## 🔧 How It Works (Step-by-Step)

Let’s sort the following array using Bucket Sort:

```python
arr = [0.42, 4.21, 0.33, 2.57, 3.14, 1.23]
````

### Step 1: Initialization

* Number of buckets: `6` (same as number of elements)
* Min value: `0.33`, Max value: `4.21`
* Range: `4.21 - 0.33 = 3.88`

### Step 2: Distribute into Buckets

We use the formula:

```
index = int((num - min_value) / range_value * (bucket_count - 1))
```

* `0.42` → Bucket 0
* `4.21` → Bucket 5
* `0.33` → Bucket 0
* `2.57` → Bucket 3
* `3.14` → Bucket 4
* `1.23` → Bucket 1

Buckets:

```python
[
  [0.42, 0.33],   # Bucket 0
  [1.23],         # Bucket 1
  [],             # Bucket 2
  [2.57],         # Bucket 3
  [3.14],         # Bucket 4
  [4.21]          # Bucket 5
]
```

### Step 3: Sort Each Bucket

Each bucket is sorted individually:

```python
[
  [0.33, 0.42],   # Bucket 0
  [1.23],         # Bucket 1
  [],             # Bucket 2
  [2.57],         # Bucket 3
  [3.14],         # Bucket 4
  [4.21]          # Bucket 5
]
```

### Step 4: Concatenate Buckets

Final sorted array:

```python
[0.33, 0.42, 1.23, 2.57, 3.14, 4.21]
```

---

## 🧪 Python Implementation

Below is the code provided in [`BucketSort.py`](./BucketSort.py):

```python
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
        bucket.sort()  # Python’s built-in sort is stable
        for num in bucket:
            arr[idx] = num
            idx += 1

# Example usage:
# data = [0.42, 4.21, 0.33, 2.57, 3.14, 1.23]
# bucket_sort(data)
# print(data)  # [0.33, 0.42, 1.23, 2.57, 3.14, 4.21]
```

---

## 🧪 Edge Cases to Test

Test your implementation with:

* ✅ An empty list: `[]`
* ✅ All elements the same: `[3.3, 3.3, 3.3]`
* ✅ Already sorted data: `[0.1, 0.2, 0.3, 0.4]`
* ✅ Reverse sorted data: `[4.0, 3.0, 2.0, 1.0]`
* ✅ Uniformly distributed floats
* ❌ Integers with large range (not ideal for Bucket Sort)

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                                 |
| ------- | --------------- | ------------------------------------------- |
| Best    | O(n + k)        | Buckets distributed evenly, minimal sorting |
| Average | O(n + k)        | Uniform distribution                        |
| Worst   | O(n²)           | All elements fall into one bucket           |
| Space   | O(n + k)        | Buckets + original array                    |

> ℹ️ `k` = number of buckets

---

## 📎 References

* [Wikipedia: Bucket Sort](https://en.wikipedia.org/wiki/Bucket_sort)
* [GeeksforGeeks Bucket Sort](https://www.geeksforgeeks.org/bucket-sort-2/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---
