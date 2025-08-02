# 🧙‍♂️ Gnome Sort in Python

This file contains a Python implementation of **Gnome Sort**, a simple sorting algorithm similar to insertion sort, but with a different approach to shifting elements. It's often praised for its conceptual simplicity and ease of implementation.

---

## 📦 File Structure

- [`GnomeSort.py`](./GnomeSort.py): Contains the `gnome_sort()` function and a sample usage block (commented).

---

## 📌 What is Gnome Sort?

**Gnome Sort** (also known as Stupid Sort):

- Works similarly to insertion sort, but instead of shifting elements, it uses swapping and a simple pointer approach.
- If the current item is bigger than the previous, move forward.
- If it’s smaller, swap it backward until it reaches its correct position.

---

## 🔧 How It Works (Step-by-Step)

Let’s walk through the sorting of:

```python
arr = [34, 2, 10, 6, 7, 3]
````

### Step-by-step Flow:

1. Start at index `0`.
2. If current element is greater than or equal to the one before it, move forward.
3. Otherwise, swap backward until sorted.
4. Repeat until the end of the list.

✅ Final Sorted Array:

```python
[2, 3, 6, 7, 10, 34]
```

---

## 🧪 Python Implementation

Below is the code provided in [`GnomeSort.py`](./GnomeSort.py):

```python
def gnome_sort(arr):
    """
    Gnome Sort: Moves items to their correct place by swapping, similar to insertion sort but simpler code.
    Time Complexity: O(n^2)
    Stable: Yes
    """
    i = 0
    n = len(arr)
    while i < n:
        if i == 0 or arr[i] >= arr[i - 1]:
            i += 1
        else:
            arr[i], arr[i - 1] = arr[i - 1], arr[i]
            i -= 1

# Example usage:
# data = [34, 2, 10, 6, 7, 3]
# gnome_sort(data)
# print(data)  # [2, 3, 6, 7, 10, 34]
```

---

## 🧪 Edge Cases to Test

* ✅ Empty list: `[]`
* ✅ One element: `[5]`
* ✅ Duplicates: `[4, 3, 3, 4, 2]`
* ✅ Already sorted: `[1, 2, 3]`
* ✅ Reverse sorted: `[5, 4, 3, 2, 1]`

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation      |
| ------- | --------------- | ---------------- |
| Best    | O(n)            | Already sorted   |
| Average | O(n²)           | Random data      |
| Worst   | O(n²)           | Reverse sorted   |
| Space   | O(1)            | In-place sorting |

---

## 📎 References

* [Wikipedia: Gnome Sort](https://en.wikipedia.org/wiki/Gnome_sort)
* [GeeksforGeeks: Gnome Sort](https://www.geeksforgeeks.org/gnome-sort-a-stupid-one/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

