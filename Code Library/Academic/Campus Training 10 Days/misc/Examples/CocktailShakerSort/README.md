# 🍸 Cocktail Shaker Sort in Python

This file provides a Python implementation of the **Cocktail Shaker Sort** algorithm. Also known as **Bidirectional Bubble Sort**, this algorithm is a variation of Bubble Sort that sorts in both directions on each pass through the list. It improves performance slightly over Bubble Sort by moving items both forward and backward.

---

## 📦 File Structure

- [`CocktailShakerSort.py`](./CocktailShakerSort.py): Contains the `cocktail_shaker_sort()` function and a sample usage block (commented).

---

## 📌 What is Cocktail Shaker Sort?

Cocktail Shaker Sort is a **stable comparison-based sorting algorithm** that operates in two directions:

1. **Forward Pass**: Moves the largest unsorted element to the end.
2. **Backward Pass**: Moves the smallest unsorted element to the beginning.

This bi-directional approach helps slightly improve upon the inefficiencies of classic Bubble Sort.

---

## 🔧 How It Works (Step-by-Step)

Let’s sort the following array:

```python
arr = [5, 1, 4, 2, 8, 0, 2]
````

---

### 🔁 Pass 1 (Left to Right):

* Compare and swap adjacent values:

  `[5, 1] → swap → [1, 5, 4, 2, 8, 0, 2]`

  `[5, 4] → swap → [1, 4, 5, 2, 8, 0, 2]`

  `[5, 2] → swap → [1, 4, 2, 5, 8, 0, 2]`

  `[5, 8] → OK`

  `[8, 0] → swap → [1, 4, 2, 5, 0, 8, 2]`

  `[8, 2] → swap → [1, 4, 2, 5, 0, 2, 8]`

🔚 Largest element `8` is now at the correct position.

---

### 🔁 Pass 1 (Right to Left):

* Compare and swap back:

  `[2, 0] → swap → [1, 4, 2, 5, 0, 2, 8]`

  `[5, 0] → swap → [1, 4, 2, 0, 5, 2, 8]`

  `[2, 0] → swap → [1, 4, 0, 2, 5, 2, 8]`

  `[4, 0] → swap → [1, 0, 4, 2, 5, 2, 8]`

  `[1, 0] → swap → [0, 1, 4, 2, 5, 2, 8]`

🔝 Smallest element `0` is now at the correct position.

---

### 🔁 Repeating...

Subsequent passes continue forward and backward, gradually narrowing the sorted range from both ends, until the array is completely sorted.

---

### ✅ Final Sorted Array:

```python
[0, 1, 2, 2, 4, 5, 8]
```

---

## 🧪 Python Implementation

Below is the code provided in [`CocktailShakerSort.py`](./CocktailShakerSort.py):

```python
def cocktail_shaker_sort(arr):
    """
    Cocktail Shaker Sort: Like bubble sort, but passes in both directions.
    Time Complexity: O(n^2)
    Stable: Yes
    """
    n = len(arr)
    swapped = True
    start = 0
    end = n - 1
    while swapped:
        swapped = False
        for i in range(start, end):
            if arr[i] > arr[i + 1]:
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = True
        if not swapped:
            break
        swapped = False
        end -= 1
        for i in range(end - 1, start - 1, -1):
            if arr[i] > arr[i + 1]:
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = True
        start += 1

# Example usage:
# data = [5, 1, 4, 2, 8, 0, 2]
# cocktail_shaker_sort(data)
# print(data)  # [0, 1, 2, 2, 4, 5, 8]
```

---

## 🧪 Edge Cases to Test

Test your implementation with:

* ✅ An empty list: `[]`
* ✅ A single element: `[10]`
* ✅ Duplicates: `[3, 1, 2, 3, 1]`
* ✅ Already sorted: `[1, 2, 3, 4, 5]`
* ✅ Reverse sorted: `[5, 4, 3, 2, 1]`

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                |
| ------- | --------------- | -------------------------- |
| Best    | O(n)            | Already sorted, early exit |
| Average | O(n²)           | Bidirectional nested loops |
| Worst   | O(n²)           | Reverse sorted             |
| Space   | O(1)            | In-place sorting           |

---

## 📎 References

* [Wikipedia: Cocktail Shaker Sort](https://en.wikipedia.org/wiki/Cocktail_shaker_sort)
* [GeeksforGeeks: Cocktail Sort](https://www.geeksforgeeks.org/cocktail-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---
