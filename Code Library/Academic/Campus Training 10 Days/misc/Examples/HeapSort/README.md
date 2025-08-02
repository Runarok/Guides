
# 🌄 Heap Sort in Python

This file provides a Python implementation of **Heap Sort**, a comparison-based sorting technique based on the binary heap data structure. It is particularly effective when constant time removal of the largest element is required.

---

## 📦 File Structure

- [`HeapSort.py`](./HeapSort.py): Contains the `heap_sort()` function and a sample usage block (commented).

---

## 📌 What is Heap Sort?

**Heap Sort**:

- Builds a **max-heap** (or min-heap) from the list.
- Repeatedly extracts the root of the heap (largest element in max-heap) and places it at the end of the array.
- Restores the heap property each time an element is removed.

It is:

- ✅ In-place (no extra memory required)
- ❌ Not stable (relative order of equal elements may change)

---

## 🔧 How It Works

Given the list:

```python
arr = [12, 11, 13, 5, 6, 7]
````

### Step 1: Build Max Heap

Convert the array into a max-heap, where the largest value is at the root.

### Step 2: Extract Elements One by One

Swap the root with the last element and reduce heap size. Heapify again to maintain the max-heap property.

✅ Final Sorted Array:

```python
[5, 6, 7, 11, 12, 13]
```

---

## 🧪 Python Implementation

Below is the code provided in [`HeapSort.py`](./HeapSort.py):

```python
def heap_sort(arr):
    """
    Heap Sort: Converts the list to a heap structure and repeatedly extracts the max (or min).
    Time Complexity: O(n log n)
    Stable: No
    """
    def heapify(arr, n, i):
        largest = i
        left = 2 * i + 1
        right = 2 * i + 2
        if left < n and arr[left] > arr[largest]:
            largest = left
        if right < n and arr[right] > arr[largest]:
            largest = right
        if largest != i:
            arr[i], arr[largest] = arr[largest], arr[i]
            heapify(arr, n, largest)

    n = len(arr)
    for i in range(n // 2 - 1, -1, -1):
        heapify(arr, n, i)
    for i in range(n - 1, 0, -1):
        arr[i], arr[0] = arr[0], arr[i]
        heapify(arr, i, 0)

# Example usage:
# data = [12, 11, 13, 5, 6, 7]
# heap_sort(data)
# print(data)  # [5, 6, 7, 11, 12, 13]
```

---

## 🧪 Edge Cases to Test

* ✅ Empty list: `[]`
* ✅ One element: `[10]`
* ✅ Duplicates: `[3, 1, 2, 3, 1]`
* ✅ Already sorted: `[1, 2, 3, 4]`
* ✅ Reverse sorted: `[9, 8, 7, 6]`

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                       |
| ------- | --------------- | --------------------------------- |
| Best    | O(n log n)      | Always heapify & extract required |
| Average | O(n log n)      |                                   |
| Worst   | O(n log n)      |                                   |
| Space   | O(1)            | In-place                          |

---

## 📎 References

* [Wikipedia: Heap Sort](https://en.wikipedia.org/wiki/Heapsort)
* [GeeksforGeeks: Heap Sort](https://www.geeksforgeeks.org/heap-sort/)
* [Python `heapq` module](https://docs.python.org/3/library/heapq.html)

---
