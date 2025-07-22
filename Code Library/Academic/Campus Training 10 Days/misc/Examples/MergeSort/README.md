# 📥 Merge Sort in Python

This file contains a Python implementation of **Merge Sort**, a classic and efficient divide-and-conquer sorting algorithm.

---

## 📦 File Structure

- [`MergeSort.py`](./MergeSort.py): Contains the `merge_sort()` function and a sample usage block (commented).

---

## 📌 What is Merge Sort?

**Merge Sort** is a **divide and conquer** algorithm that:

- Divides the list into halves recursively until sublists of size one are obtained.
- Merges sublists back together in sorted order.

✅ Efficient  
✅ Stable  
✅ Suitable for large datasets

---

## 🔧 How It Works

Given the list:

```python
arr = [12, 11, 13, 5, 6, 7]
````

### Step-by-step:

1. Split into halves: `[12, 11, 13]` and `[5, 6, 7]`.
2. Recursively split until single elements remain.
3. Merge pairs of sublists back together in sorted order.
4. Continue merging until the full list is sorted.

✅ Final Sorted Array:

```python
[5, 6, 7, 11, 12, 13]
```

---

## 🧪 Python Implementation

Below is the code provided in [`MergeSort.py`](./MergeSort.py):

```python
def merge_sort(arr):
    """
    Merge Sort: Uses divide and conquer, splits the list into halves, sorts each recursively, and merges them.
    Time Complexity: O(n log n)
    Stable: Yes
    """
    if len(arr) > 1:
        mid = len(arr) // 2
        L = arr[:mid]
        R = arr[mid:]

        merge_sort(L)
        merge_sort(R)

        i = j = k = 0
        while i < len(L) and j < len(R):
            if L[i] <= R[j]:
                arr[k] = L[i]
                i += 1
            else:
                arr[k] = R[j]
                j += 1
            k += 1

        while i < len(L):
            arr[k] = L[i]
            i += 1
            k += 1
        while j < len(R):
            arr[k] = R[j]
            j += 1
            k += 1

# Example usage:
# data = [12, 11, 13, 5, 6, 7]
# merge_sort(data)
# print(data)  # [5, 6, 7, 11, 12, 13]
```

---

## 🧪 Edge Cases to Test

* ✅ Empty list: `[]`
* ✅ Single element: `[1]`
* ✅ Duplicates: `[4, 1, 3, 4, 2]`
* ✅ Already sorted: `[1, 2, 3, 4, 5]`
* ✅ Reverse sorted: `[5, 4, 3, 2, 1]`

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                   |
| ------- | --------------- | ----------------------------- |
| Best    | O(n log n)      | Divide and conquer steps      |
| Average | O(n log n)      | Consistent performance        |
| Worst   | O(n log n)      | Consistent performance        |
| Space   | O(n)            | Additional memory for merging |

---

## 📎 References

* [Wikipedia: Merge Sort](https://en.wikipedia.org/wiki/Merge_sort)
* [GeeksforGeeks: Merge Sort](https://www.geeksforgeeks.org/merge-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

