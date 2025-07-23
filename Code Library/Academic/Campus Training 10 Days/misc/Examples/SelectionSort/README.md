# ⚡ Selection Sort in Python

This file contains the implementation of **Selection Sort**, a simple comparison-based sorting algorithm.

---

## 📦 File Structure

- [`SelectionSort.py`](./SelectionSort.py): Contains the `selection_sort()` function and example usage.

---

## 📌 What is Selection Sort?

Selection Sort repeatedly selects the smallest (or largest) element from the unsorted part of the list and swaps it with the element at the current position. It is easy to implement but inefficient on large lists.

---

## 🔧 How It Works (Step-by-Step)

- Start at the beginning of the array.
- Find the minimum element in the unsorted portion.
- Swap it with the element at the beginning of the unsorted portion.
- Move the boundary between sorted and unsorted elements one step forward.
- Repeat until the entire list is sorted.

---

## 🧪 Python Implementation

Provided in [`SelectionSort.py`](./SelectionSort.py):

```python
def selection_sort(arr):
    """
    Selection Sort: Selects the smallest (or largest) element from the unsorted list
    and swaps it with the element at the beginning.
    Time Complexity: O(n^2)
    Stable: No
    """
    n = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i+1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]

# Example usage:
# data = [64, 25, 12, 22, 11]
# selection_sort(data)
# print(data)  # [11, 12, 22, 25, 64]
````

---

## 🧠 When to Use Selection Sort?

* For small datasets or when memory writes are costly (selection sort minimizes writes).
* When simplicity is preferred over efficiency.

---

## ⏱️ Time and Space Complexity

| Case | Time Complexity | Space Complexity |
| ---- | --------------- | ---------------- |
| All  | O(n^2)          | O(1)             |

---

## 📎 References

* [Wikipedia: Selection Sort](https://en.wikipedia.org/wiki/Selection_sort)
* [GeeksforGeeks Selection Sort](https://www.geeksforgeeks.org/selection-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

