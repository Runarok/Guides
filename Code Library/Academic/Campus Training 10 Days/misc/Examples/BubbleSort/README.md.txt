# 🔁 Bubble Sort in Python

This repository provides a Python implementation of the **Bubble Sort** algorithm. Bubble Sort is a simple, stable, and intuitive comparison-based sorting algorithm. While not efficient for large datasets, it is often used for educational purposes to demonstrate how sorting algorithms work internally.

---

## 📦 File Structure

- [`BubbleSort.py`](./BubbleSort.py): Contains the `bubble_sort()` function and a sample usage block (commented).

---

## 📌 What is Bubble Sort?

Bubble Sort is a **comparison-based sorting algorithm** that works by repeatedly stepping through the list, comparing each pair of adjacent elements, and swapping them if they are in the wrong order.

With each pass through the list, the largest remaining unsorted element "bubbles up" to its correct position.

---

## 🔧 How It Works (Step-by-Step)

Let’s take a look at how Bubble Sort works on the list:

```python
arr = [64, 34, 25, 12, 22, 11, 90]
````

### Pass 1:

* Compare 64 and 34 → swap → `[34, 64, 25, 12, 22, 11, 90]`
* Compare 64 and 25 → swap → `[34, 25, 64, 12, 22, 11, 90]`
* Compare 64 and 12 → swap → `[34, 25, 12, 64, 22, 11, 90]`
* Compare 64 and 22 → swap → `[34, 25, 12, 22, 64, 11, 90]`
* Compare 64 and 11 → swap → `[34, 25, 12, 22, 11, 64, 90]`
* Compare 64 and 90 → no swap

After Pass 1, 90 is in its correct position.

### Pass 2:

* Similar comparisons continue, reducing the range each time.
* Eventually, the array becomes sorted after n-1 passes.

---

## 🧠 Why Use Bubble Sort?

Bubble Sort is:

* ✅ **Simple to implement and understand**
* ✅ **Stable**: does not change the relative order of equal elements
* ❌ **Inefficient** on large datasets (time complexity O(n²))

It is mostly used for:

* Teaching purposes
* Small datasets
* Algorithms where stability is required and performance is not critical

---

## 🧪 Python Implementation

Below is the code provided in [`BubbleSort.py`](./BubbleSort.py):

```python
def bubble_sort(arr):
    """
    Bubble Sort: Repeatedly steps through the list, compares adjacent elements,
    and swaps them if they are in the wrong order.
    Time Complexity: O(n^2)
    Stable: Yes
    """
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]

# Example usage:
# data = [64, 34, 25, 12, 22, 11, 90]
# bubble_sort(data)
# print(data)  # [11, 12, 22, 25, 34, 64, 90]
```

---

## 🧪 Edge Cases to Test

Test your implementation with:

* ✅ An empty list: `[]`
* ✅ A single element: `[5]`
* ✅ A list with duplicates: `[4, 2, 2, 4, 3]`
* ✅ An already sorted list: `[1, 2, 3, 4, 5]`
* ✅ A reverse sorted list: `[5, 4, 3, 2, 1]`

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation                |
| ------- | --------------- | -------------------------- |
| Best    | O(n)            | Already sorted, no swaps   |
| Average | O(n²)           | General case, nested loops |
| Worst   | O(n²)           | Reversed list, max swaps   |
| Space   | O(1)            | In-place sorting           |

---

## 📎 References

* [Wikipedia: Bubble Sort](https://en.wikipedia.org/wiki/Bubble_sort)
* [GeeksforGeeks Bubble Sort](https://www.geeksforgeeks.org/bubble-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---
