# 🧹 Comb Sort in Python

This file provides a Python implementation of the **Comb Sort** algorithm. Comb Sort is an improvement over Bubble Sort that uses a shrinking gap strategy to eliminate small values ("turtles") near the end of the list faster. It’s more efficient than Bubble Sort for many inputs, but it is **not stable** and is generally used as an educational algorithm or a lightweight alternative to more complex sorts.

---

## 📦 File Structure

- [`CombSort.py`](./CombSort.py): Contains the `comb_sort()` function and a sample usage block (commented).

---

## 📌 What is Comb Sort?

**Comb Sort** improves Bubble Sort by:

1. Using a **gap** between compared elements (starting large and shrinking).
2. Reducing the gap over time using a shrink factor (commonly `1.3`).
3. Performing a final pass with `gap = 1` (like Bubble Sort) to ensure completion.

---

## 🔧 How It Works (Step-by-Step)

Let's walk through the sorting process on this example:

```python
arr = [8, 4, 1, 56, 3, -44, 23, -6, 28, 0]
````

### Step 1: Initialize

* Initial gap = 10 (length of list)
* Shrink factor = 1.3

### Step 2: Shrink and Compare

We repeatedly:

1. Shrink the gap: `gap = int(gap / 1.3)`
2. Compare elements at distance `gap`
3. Swap if needed
4. Repeat until `gap = 1` and no swaps occur

### Sample Gap Progression:

* Gap 7: compare `arr[0]` and `arr[7]`, `arr[1]` and `arr[8]`, ...
* Gap 5: compare elements 5 apart
* Gap 1: acts like a final Bubble Sort pass

Eventually, the array becomes:

```python
[-44, -6, 0, 1, 3, 4, 8, 23, 28, 56]
```

---

## 🧪 Python Implementation

Below is the code provided in [`CombSort.py`](./CombSort.py):

```python
def comb_sort(arr):
    """
    Comb Sort: Improves bubble sort by using a gap sequence to eliminate turtles (small values at end).
    Time Complexity: Average O(n^2/2^p), Best O(n log n)
    Stable: No
    """
    n = len(arr)
    gap = n
    shrink = 1.3
    sorted_ = False
    while not sorted_:
        gap = int(gap / shrink)
        if gap <= 1:
            gap = 1
            sorted_ = True
        i = 0
        while i + gap < n:
            if arr[i] > arr[i + gap]:
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted_ = False
            i += 1

# Example usage:
# data = [8, 4, 1, 56, 3, -44, 23, -6, 28, 0]
# comb_sort(data)
# print(data)  # [-44, -6, 0, 1, 3, 4, 8, 23, 28, 56]
```

---

## 🧪 Edge Cases to Test

* ✅ An empty list: `[]`
* ✅ A single element: `[42]`
* ✅ Duplicate values: `[5, 1, 4, 1, 5]`
* ✅ Already sorted: `[-2, 0, 3, 9]`
* ✅ Reverse sorted: `[5, 4, 3, 2, 1]`
* ❌ Stability-sensitive data: Comb Sort is not stable

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                                  |
| ------- | --------------- | -------------------------------------------- |
| Best    | O(n log n)      | Ideal conditions, fewer swaps with early gap |
| Average | O(n² / 2^p)     | Depends on shrink factor and distribution    |
| Worst   | O(n²)           | Poor gap alignment, many swaps               |
| Space   | O(1)            | In-place sorting                             |

> 🧠 `p` is the number of passes (shrinking gap iterations)

---

## 📎 References

* [Wikipedia: Comb Sort](https://en.wikipedia.org/wiki/Comb_sort)
* [GeeksforGeeks Comb Sort](https://www.geeksforgeeks.org/comb-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

