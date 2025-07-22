# ⚡ Quick Sort in Python

This file contains the implementation of **Quick Sort**, a widely used efficient sorting algorithm based on divide and conquer.

---

## 📦 File Structure

- [`QuickSort.py`](./QuickSort.py): Contains the `quick_sort()` function and example usage.

---

## 📌 What is Quick Sort?

Quick Sort works by selecting a "pivot" element from the array and partitioning the other elements into two sub-arrays, according to whether they are less than or greater than the pivot. The sub-arrays are then sorted recursively.

---

## 🔧 How It Works (Step-by-Step)

- Choose the last element as pivot.
- Rearrange the array by placing elements smaller than pivot to the left, greater to the right.
- Recursively apply this to sub-arrays.

---

## 🧪 Python Implementation

Provided in [`QuickSort.py`](./QuickSort.py):

```python
def quick_sort(arr):
    """
    Quick Sort: Uses divide and conquer by selecting a pivot and partitioning the array.
    Time Complexity: O(n log n) average, O(n^2) worst
    Stable: No
    """
    def _quick_sort(items, low, high):
        if low < high:
            pi = partition(items, low, high)
            _quick_sort(items, low, pi - 1)
            _quick_sort(items, pi + 1, high)

    def partition(items, low, high):
        pivot = items[high]
        i = low - 1
        for j in range(low, high):
            if items[j] <= pivot:
                i += 1
                items[i], items[j] = items[j], items[i]
        items[i + 1], items[high] = items[high], items[i + 1]
        return i + 1

    _quick_sort(arr, 0, len(arr) - 1)

# Example usage:
# data = [10, 7, 8, 9, 1, 5]
# quick_sort(data)
# print(data)  # [1, 5, 7, 8, 9, 10]
````

---

## 🧠 When to Use Quick Sort?

* When average performance and in-place sorting are important.
* Not stable, so avoid if relative order of equal elements must be preserved.
* Not ideal for nearly sorted or small datasets (due to worst-case).

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Space Complexity |
| ------- | --------------- | ---------------- |
| Best    | O(n log n)      | O(log n)         |
| Average | O(n log n)      | O(log n)         |
| Worst   | O(n²)           | O(log n)         |

---

## 📎 References

* [Wikipedia: Quick Sort](https://en.wikipedia.org/wiki/Quicksort)
* [GeeksforGeeks Quick Sort](https://www.geeksforgeeks.org/quick-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

