# ⚡ Radix Sort in Python

This file contains the implementation of **Radix Sort**, a non-comparative sorting algorithm that sorts integers by processing individual digits.

---

## 📦 File Structure

- [`RadixSort.py`](./RadixSort.py): Contains the `radix_sort()` function and example usage.

---

## 📌 What is Radix Sort?

Radix Sort processes digits from least significant to most significant, sorting numbers by each digit position using a stable counting sort as a subroutine. It works well for sorting non-negative integers.

---

## 🔧 How It Works (Step-by-Step)

- Find the maximum number to determine the number of digits.
- Sort elements based on the digit at each exponent (1s, 10s, 100s, etc.) using counting sort.
- Repeat until all digits are processed.

---

## 🧪 Python Implementation

Provided in [`RadixSort.py`](./RadixSort.py):

```python
def radix_sort(arr):
    """
    Radix Sort: Sorts numbers by processing individual digits from least to most significant.
    Works for non-negative integers.
    Time Complexity: O(nk), where k is the number of digits.
    Stable: Yes
    """
    if not arr:
        return

    def counting_sort_exp(arr, exp):
        n = len(arr)
        output = [0] * n
        count = [0] * 10

        for i in range(n):
            index = arr[i] // exp
            count[index % 10] += 1

        for i in range(1, 10):
            count[i] += count[i - 1]

        for i in range(n - 1, -1, -1):
            index = arr[i] // exp
            output[count[index % 10] - 1] = arr[i]
            count[index % 10] -= 1

        for i in range(n):
            arr[i] = output[i]

    max1 = max(arr)
    exp = 1
    while max1 // exp > 0:
        counting_sort_exp(arr, exp)
        exp *= 10

# Example usage:
# data = [170, 45, 75, 90, 802, 24, 2, 66]
# radix_sort(data)
# print(data)  # [2, 24, 45, 66, 75, 90, 170, 802]
````

---

## 🧠 When to Use Radix Sort?

* When sorting large lists of non-negative integers.
* Particularly useful when the range of integers (number of digits) is not significantly larger than the number of items.

---

## ⏱️ Time and Space Complexity

| Case | Time Complexity | Space Complexity |
| ---- | --------------- | ---------------- |
| All  | O(nk)           | O(n + k)         |

*k = number of digits in the largest number.*

---

## 📎 References

* [Wikipedia: Radix Sort](https://en.wikipedia.org/wiki/Radix_sort)
* [GeeksforGeeks Radix Sort](https://www.geeksforgeeks.org/radix-sort/)
* [Python Sorting HOWTO](https://docs.python.org/3/howto/sorting.html)

---

