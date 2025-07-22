# 🔄 Cycle Sort in Python

This file provides a Python implementation of the **Cycle Sort** algorithm. Cycle Sort is unique in that it minimizes the number of writes to the array. It is especially useful in scenarios where writing to memory is expensive, such as in EEPROMs or flash memory.

---

## 📦 File Structure

- [`CycleSort.py`](./CycleSort.py): Contains the `cycle_sort()` function and a sample usage block (commented).

---

## 📌 What is Cycle Sort?

**Cycle Sort**:

- Works by identifying "cycles" in the permutation of the array elements.
- Each cycle is rotated to put every element in its correct position.
- Minimizes writes by only writing each value once into its final position.

It is **not stable**, but it is **in-place** and writes to memory at most `n - 1` times.

---

## 🔧 How It Works (Step-by-Step)

Let’s walk through this example:

```python
arr = [20, 40, 50, 10, 30]
````

### Step 1: Start with first index

* Start with `20`, find how many elements are smaller → `10` is smaller → `pos = 1`
* Place `20` at index 1 (its correct position)

Repeat for remaining elements, rotating cycles and placing each item in its sorted position.

### Step 2: Continue to next unsorted element

Eventually, the array becomes sorted with the **minimum number of write operations**.

---

### ✅ Final Sorted Array:

```python
[10, 20, 30, 40, 50]
```

---

## 🧪 Python Implementation

Below is the code provided in [`CycleSort.py`](./CycleSort.py):

```python
def cycle_sort(arr):
    """
    Cycle Sort: Minimizes writes to memory; useful when writes are costly.
    Time Complexity: O(n^2)
    Stable: No
    """
    n = len(arr)
    for cycle_start in range(0, n - 1):
        item = arr[cycle_start]
        pos = cycle_start
        for i in range(cycle_start + 1, n):
            if arr[i] < item:
                pos += 1
        if pos == cycle_start:
            continue
        while item == arr[pos]:
            pos += 1
        arr[pos], item = item, arr[pos]
        while pos != cycle_start:
            pos = cycle_start
            for i in range(cycle_start + 1, n):
                if arr[i] < item:
                    pos += 1
            while item == arr[pos]:
                pos += 1
            arr[pos], item = item, arr[pos]

# Example usage:
# data = [20, 40, 50, 10, 30]
# cycle_sort(data)
# print(data)  # [10, 20, 30, 40, 50]
```

---

## 🧪 Edge Cases to Test

* ✅ An empty list: `[]`
* ✅ A single element: `[7]`
* ✅ Repeating values: `[4, 3, 4, 3, 1]` (note: not stable)
* ✅ Already sorted: `[1, 2, 3, 4]`
* ✅ Reverse sorted: `[5, 4, 3, 2, 1]`

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                  |
| ------- | --------------- | ---------------------------- |
| Best    | O(n²)           | Always O(n²) comparisons     |
| Average | O(n²)           | Same as worst                |
| Worst   | O(n²)           | Nested loop for each cycle   |
| Writes  | O(n)            | Each element is written once |
| Space   | O(1)            | In-place sorting             |

---

## 📎 References

* [Wikipedia: Cycle Sort](https://en.wikipedia.org/wiki/Cycle_sort)
* [GeeksforGeeks: Cycle Sort](https://www.geeksforgeeks.org/cycle-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

