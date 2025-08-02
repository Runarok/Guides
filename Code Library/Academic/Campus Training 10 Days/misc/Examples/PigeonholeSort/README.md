# 🕳️ Pigeonhole Sort in Python

This file contains the implementation of **Pigeonhole Sort**, a sorting algorithm suitable for sorting lists with a small range of integer keys efficiently.

---

## 📦 File Structure

- [`PigeonholeSort.py`](./PigeonholeSort.py): Contains the `pigeonhole_sort()` function and example usage.

---

## 📌 What is Pigeonhole Sort?

Pigeonhole Sort places elements into "pigeonholes" (buckets) based on their value, then collects them in order. It works best when the range of keys (max - min) is small relative to the number of elements.

---

## 🔧 How It Works (Step-by-Step)

- Determine the minimum and maximum values.
- Create holes equal to the range of values.
- Place each element into its respective hole.
- Concatenate holes to get the sorted list.

---

## 🧪 Python Implementation

Provided in [`PigeonholeSort.py`](./PigeonholeSort.py):

```python
def pigeonhole_sort(arr):
    """
    Pigeonhole Sort: Places elements into pigeonholes based on value, then collects in order.
    Good for small ranges of integer keys.
    Time Complexity: O(n + r), where r is range of elements.
    Stable: Yes
    """
    if not arr:
        return
    min_val = min(arr)
    max_val = max(arr)
    size = max_val - min_val + 1
    holes = [[] for _ in range(size)]
    for num in arr:
        holes[num - min_val].append(num)
    idx = 0
    for hole in holes:
        for num in hole:
            arr[idx] = num
            idx += 1

# Example usage:
# data = [8, 3, 2, 7, 4, 6, 8]
# pigeonhole_sort(data)
# print(data)  # [2, 3, 4, 6, 7, 8, 8]
````

---

## 🧠 When to Use Pigeonhole Sort?

* When sorting integers with a **small key range** relative to the number of elements.
* When stable sorting is needed.
* Not suitable for large ranges due to memory usage.

---

## ⏱️ Time and Space Complexity

| Case  | Time Complexity | Space Complexity |
| ----- | --------------- | ---------------- |
| Best  | O(n + r)        | O(n + r)         |
| Worst | O(n + r)        | O(n + r)         |

(where *r* is the range of input values)

---

## 📎 References

* [Wikipedia: Pigeonhole Sort](https://en.wikipedia.org/wiki/Pigeonhole_sort)
* [GeeksforGeeks Pigeonhole Sort](https://www.geeksforgeeks.org/pigeonhole-sort/)

---

