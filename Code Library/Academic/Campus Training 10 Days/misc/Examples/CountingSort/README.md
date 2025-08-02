# 🔢 Counting Sort in Python

This file provides a Python implementation of the **Counting Sort** algorithm. Counting Sort is a non-comparison-based sorting algorithm that is efficient for sorting integers within a known, limited range. It is **stable**, **fast**, and particularly well-suited for non-negative integers.

---

## 📦 File Structure

- [`CountingSort.py`](./CountingSort.py): Contains the `counting_sort()` function and a sample usage block (commented).

---

## 📌 What is Counting Sort?

**Counting Sort** works by:

1. Counting how many times each unique value appears in the input array.
2. Calculating the position of each value in the sorted output.
3. Rebuilding the sorted array based on the counts.

Unlike comparison-based algorithms, Counting Sort does not compare elements but works by **indexing into a count array**.

---

## 🔧 How It Works (Step-by-Step)

Let’s walk through sorting this list:

```python
arr = [4, 2, 2, 8, 3, 3, 1]
````

### Step 1: Initialize

* Min value: `1`
* Max value: `8`
* Range: `8 - 1 + 1 = 8`

### Step 2: Count Frequencies

Create a count array of size `8` (range of elements):

```python
count = [0, 1, 2, 2, 1, 0, 0, 1]
# Indices represent the values from 1 to 8
```

### Step 3: Cumulative Count

Convert count array into prefix sum:

```python
count = [0, 1, 3, 5, 6, 6, 6, 7]
```

This tells us where each element should be placed in the output.

### Step 4: Build Output Array

Place elements into their sorted positions while maintaining stability.

### ✅ Final Sorted Array:

```python
[1, 2, 2, 3, 3, 4, 8]
```

---

## 🧪 Python Implementation

Below is the code provided in [`CountingSort.py`](./CountingSort.py):

```python
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
```

---

## 🧪 Edge Cases to Test

* ✅ An empty list: `[]`
* ✅ A single element: `[7]`
* ✅ Repeating values: `[5, 3, 3, 5, 1]`
* ✅ Already sorted: `[1, 2, 3, 4]`
* ✅ Reverse sorted: `[5, 4, 3, 2, 1]`
* ❌ Floats or strings: Not supported
* ⚠️ Negative integers: Only supported with modification

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                           |
| ------- | --------------- | ------------------------------------- |
| Best    | O(n + k)        | Linear time if range `k` is not large |
| Average | O(n + k)        | Independent of element order          |
| Worst   | O(n + k)        | Depends on size of range `k`          |
| Space   | O(n + k)        | Output array + count array            |

> 📌 `n` = number of elements, `k` = range of values (`max - min + 1`)

---

## 📎 References

* [Wikipedia: Counting Sort](https://en.wikipedia.org/wiki/Counting_sort)
* [GeeksforGeeks: Counting Sort](https://www.geeksforgeeks.org/counting-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

