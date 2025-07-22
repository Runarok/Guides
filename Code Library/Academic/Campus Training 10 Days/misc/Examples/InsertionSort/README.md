# 📥 Insertion Sort in Python

This file contains a Python implementation of **Insertion Sort**, a simple and intuitive sorting algorithm that works well on small or nearly sorted datasets.

---

## 📦 File Structure

- [`InsertionSort.py`](./InsertionSort.py): Contains the `insertion_sort()` function and a sample usage block (commented).

---

## 📌 What is Insertion Sort?

**Insertion Sort** is a comparison-based sorting algorithm that:

- Builds the final sorted list one item at a time.
- Picks one element from the unsorted part and inserts it into the correct position in the sorted part.

✅ Simple  
✅ Stable  
❌ Not suitable for large datasets

---

## 🔧 How It Works

Given the list:

```python
arr = [12, 11, 13, 5, 6]
````

### Step-by-step:

1. Start from the second element (index 1).
2. Compare it with previous elements.
3. Shift larger elements one position to the right.
4. Insert the current element at the correct position.

✅ Final Sorted Array:

```python
[5, 6, 11, 12, 13]
```

---

## 🧪 Python Implementation

Below is the code provided in [`InsertionSort.py`](./InsertionSort.py):

```python
def insertion_sort(arr):
    """
    Insertion Sort: Builds the sorted list one item at a time, inserting each element into its proper place.
    Time Complexity: O(n^2)
    Stable: Yes
    """
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key

# Example usage:
# data = [12, 11, 13, 5, 6]
# insertion_sort(data)
# print(data)  # [5, 6, 11, 12, 13]
```

---

## 🧪 Edge Cases to Test

* ✅ Empty list: `[]`
* ✅ One element: `[42]`
* ✅ Duplicate values: `[3, 1, 2, 3, 1]`
* ✅ Already sorted: `[1, 2, 3, 4, 5]`
* ✅ Reverse sorted: `[5, 4, 3, 2, 1]`

---

## ⏱️ Time and Space Complexity

| Case    | Time Complexity | Explanation         |
| ------- | --------------- | ------------------- |
| Best    | O(n)            | Already sorted list |
| Average | O(n²)           | General case        |
| Worst   | O(n²)           | Reversed list       |
| Space   | O(1)            | In-place sorting    |

---

## 📎 References

* [Wikipedia: Insertion Sort](https://en.wikipedia.org/wiki/Insertion_sort)
* [GeeksforGeeks: Insertion Sort](https://www.geeksforgeeks.org/insertion-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

