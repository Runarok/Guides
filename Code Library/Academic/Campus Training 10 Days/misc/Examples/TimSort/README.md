# ⏱️ Tim Sort in Python

This file demonstrates the use of **Tim Sort**, the default sorting algorithm in Python’s built-in `list.sort()` and `sorted()` functions. Tim Sort is a hybrid algorithm derived from **Merge Sort** and **Insertion Sort**, designed to perform efficiently on real-world data.

---

## 📦 File Structure

- [`TimSort.py`](./TimSort.py): Contains the `tim_sort()` function using Python's built-in sort, and a sample usage block (commented).

---

## 📌 What is Tim Sort?

**Tim Sort** is a hybrid, stable sorting algorithm that combines:

- **Insertion Sort** for small runs (good on partially sorted data)
- **Merge Sort** for combining sorted runs

It was designed to optimize performance on many kinds of real-world data.

Tim Sort is:

- ✅ **Stable**
- ✅ **Efficient**
- ✅ **Widely used** (default in Python and Java)

---

## 🔧 How It Works

Python’s `list.sort()` and `sorted()` use Tim Sort under the hood. You don’t need to implement it manually — just call `.sort()`:

```python
arr.sort()
````

Under the hood:

1. Python scans the list to find already sorted "runs".
2. Uses insertion sort to extend small runs.
3. Merges runs using an optimized merge strategy.

---

### ✅ Example

```python
arr = [5, 21, 7, 23, 19]
tim_sort(arr)
print(arr)  # Output: [5, 7, 19, 21, 23]
```

---

## 🧪 Python Implementation

Below is the code provided in [`TimSort.py`](./TimSort.py):

```python
def tim_sort(arr):
    """
    Tim Sort: Hybrid sorting algorithm based on merge sort and insertion sort.
    Time Complexity: O(n log n)
    Stable: Yes
    """
    arr.sort()  # Python's built-in uses TimSort

# Example usage:
# data = [5, 21, 7, 23, 19]
# tim_sort(data)
# print(data)  # [5, 7, 19, 21, 23]
```

---

## 🧪 Edge Cases to Test

* ✅ An empty list: `[]`
* ✅ A single element: `[9]`
* ✅ Repeating elements: `[4, 2, 2, 4, 3]`
* ✅ Already sorted: `[1, 2, 3, 4]`
* ✅ Reverse sorted: `[5, 4, 3, 2, 1]`
* ✅ Large and mixed datasets

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                        |
| ------- | --------------- | ---------------------------------- |
| Best    | O(n)            | When the list is already sorted    |
| Average | O(n log n)      | Merge sort + insertion sort hybrid |
| Worst   | O(n log n)      | Always guaranteed                  |
| Space   | O(n)            | Temporary space for merging        |

---

## 📎 References

* [Wikipedia: Tim Sort](https://en.wikipedia.org/wiki/Timsort)
* [Python's sort documentation](https://docs.python.org/3/howto/sorting.html)
* [GeeksforGeeks: Tim Sort](https://www.geeksforgeeks.org/timsort/)

---

