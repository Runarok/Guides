
# ⚡ Shell Sort in Python

This file contains the implementation of **Shell Sort**, an optimization over insertion sort that allows exchanges of items far apart.

---

## 📦 File Structure

- [`ShellSort.py`](./ShellSort.py): Contains the `shell_sort()` function and example usage.

---

## 📌 What is Shell Sort?

Shell Sort is a generalization of insertion sort. It starts by sorting pairs of elements far apart from each other, then progressively reduces the gap between elements to be compared.

---

## 🔧 How It Works (Step-by-Step)

- Choose an initial gap (commonly half the list size).
- Perform a gapped insertion sort for this gap size.
- Reduce the gap and repeat the process.
- Continue until the gap is 1, at which point it becomes a regular insertion sort.

---

## 🧪 Python Implementation

Provided in [`ShellSort.py`](./ShellSort.py):

```python
def shell_sort(arr):
    """
    Shell Sort: Generalization of insertion sort that allows the exchange of items far apart.
    Time Complexity: Depends on gap sequence (best: O(n log n), worst: O(n^2))
    Stable: No
    """
    n = len(arr)
    gap = n // 2
    while gap > 0:
        for i in range(gap, n):
            temp = arr[i]
            j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap //= 2

# Example usage:
# data = [12, 34, 54, 2, 3]
# shell_sort(data)
# print(data)  # [2, 3, 12, 34, 54]
````

---

## 🧠 When to Use Shell Sort?

* When you want a simple, relatively efficient sorting algorithm with better performance than insertion sort.
* Useful for medium-sized lists and partially sorted data.

---

## ⏱️ Time and Space Complexity

| Case  | Time Complexity | Space Complexity |
| ----- | --------------- | ---------------- |
| Best  | O(n log n)      | O(1)             |
| Worst | O(n^2)          | O(1)             |

---

## 📎 References

* [Wikipedia: Shell Sort](https://en.wikipedia.org/wiki/Shellsort)
* [GeeksforGeeks Shell Sort](https://www.geeksforgeeks.org/shellsort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---
