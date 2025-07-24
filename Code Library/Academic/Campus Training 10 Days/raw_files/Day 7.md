# **Searching Algorithms**

---

## **Linear Search**

**How it works:**
1. Traverse the array value by value from the start.
2. Compare each value with the target value.
3. If found, return the index.
4. If not found by the end, return `-1`.

### **Python Example 1: Using `in` Operator**
```python
mylist = [3, 7, 2, 9, 5, 1, 8, 4, 6]

if 4 in mylist:
    print("Found!")
else:
    print("Not found!")
```

### **Python Example 2: Linear Search Function**
```python
def linearSearch(arr, targetVal):
    for i in range(len(arr)):
        if arr[i] == targetVal:
            return i
    return -1

mylist = [3, 7, 2, 9, 5, 1, 8, 4, 6]
x = 4

result = linearSearch(mylist, x)

if result != -1:
    print("Found at index", result)
else:
    print("Not found")
```

---

## **Binary Search**

Binary Search is a much faster search algorithm, but it requires the array to be **sorted**.

**How it works:**
1. Look at the middle value.
2. If the target is lower, search the left half; if higher, search the right half.
3. Repeat until found or search area is empty.
4. Return the index if found, else `-1`.

### **Manual Example**
- Array: `[2, 3, 7, 7, 11, 15, 25]`
- Target: `11`

- Step 1: Middle index = 3, value = 7. 7 < 11 → search right half.
- Step 2: New middle index = 5, value = 15. 15 > 11 → search left side (index 4).
- Step 3: Index 4, value = 11. Found!

**Result:** Value found at index 4.

### **Python Implementation**
```python
def binarySearch(arr, targetVal):
    left = 0
    right = len(arr) - 1

    while left <= right:
        mid = (left + right) // 2

        if arr[mid] == targetVal:
            return mid
        if arr[mid] < targetVal:
            left = mid + 1
        else:
            right = mid - 1

    return -1

mylist = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
x = 11

result = binarySearch(mylist, x)

if result != -1:
    print("Found at index", result)
else:
    print("Not found")
```

---

# **Sorting Algorithms**

---

## **Bubble Sort**

Bubble Sort sorts an array by "bubbling" the highest values to the end with repeated swaps.

**How it works:**
1. Compare each pair of adjacent elements.
2. Swap them if they are in the wrong order.
3. Repeat for all elements.

### **Manual Example**
- Start: `[7, 12, 9, 11, 3]`
- 12 and 9 swapped → `[7, 9, 12, 11, 3]`
- 12 and 11 swapped → `[7, 9, 11, 12, 3]`
- 12 and 3 swapped → `[7, 9, 11, 3, 12]`
- Repeat until sorted: `[3, 7, 9, 11, 12]`

### **Python Implementation**
```python
mylist = [64, 34, 25, 12, 22, 11, 90, 5]

n = len(mylist)
for i in range(n-1):
    for j in range(n-i-1):
        if mylist[j] > mylist[j+1]:
            mylist[j], mylist[j+1] = mylist[j+1], mylist[j]

print(mylist)
```

### **Optimized Bubble Sort**
Stop early if no swaps are made during a pass.

```python
mylist = [7, 3, 9, 12, 11]

n = len(mylist)
for i in range(n-1):
    swapped = False
    for j in range(n-i-1):
        if mylist[j] > mylist[j+1]:
            mylist[j], mylist[j+1] = mylist[j+1], mylist[j]
            swapped = True
    if not swapped:
        break

print(mylist)
```

---

## **Quicksort**

Quicksort is a fast, recursive sorting algorithm.

**How it works:**
1. Choose a pivot element.
2. Partition the array so lower values are left, higher values right.
3. Recursively sort left and right subarrays.

### **Manual Example**
- Start: `[11, 9, 12, 7, 3]`, pivot = 3
- Partition: `[3, 9, 12, 7, 11]`
- Pivot: 11, partition right subarray, etc.

### **Python Implementation**
```python
def partition(array, low, high):
    pivot = array[high]
    i = low - 1

    for j in range(low, high):
        if array[j] <= pivot:
            i += 1
            array[i], array[j] = array[j], array[i]

    array[i+1], array[high] = array[high], array[i+1]
    return i+1

def quicksort(array, low=0, high=None):
    if high is None:
        high = len(array) - 1

    if low < high:
        pivot_index = partition(array, low, high)
        quicksort(array, low, pivot_index-1)
        quicksort(array, pivot_index+1, high)

mylist = [64, 34, 25, 5, 22, 11, 90, 12]
quicksort(mylist)
print(mylist)
```

---

## **Selection Sort**

Selection Sort finds the lowest value and moves it to the front, one by one.

**How it works:**
1. Find the minimum value in the unsorted part.
2. Swap it to the front.
3. Repeat for all elements.

### **Manual Example**
- Start: `[7, 12, 9, 11, 3]`
- Minimum is 3 → `[3, 7, 12, 9, 11]`
- Minimum in rest is 7 (no move)
- Next minimum is 9 → `[3, 7, 9, 12, 11]`
- Next minimum is 11 → `[3, 7, 9, 11, 12]`

### **Python Implementation**
```python
mylist = [64, 34, 25, 5, 22, 11, 90, 12]

n = len(mylist)
for i in range(n-1):
    min_index = i
    for j in range(i+1, n):
        if mylist[j] < mylist[min_index]:
            min_index = j
    min_value = mylist.pop(min_index)
    mylist.insert(i, min_value)

print(mylist)
```

---

# Insertion Sort with Python

The **Insertion Sort** algorithm divides the array into a sorted and unsorted part. It takes one value at a time from the unsorted part and inserts it into the correct place in the sorted part.

---

**How it works:**
1. Consider the first value as sorted.
2. Take the next value and insert it into the correct position in the sorted part.
3. Repeat for all values until the array is sorted.

### Manual Run Through

- Start: `[7, 12, 9, 11, 3]`
- After sorting 7 and 12: `[7, 12, 9, 11, 3]` (12 stays)
- Insert 9: `[7, 9, 12, 11, 3]`
- Insert 11: `[7, 9, 11, 12, 3]`
- Insert 3: `[3, 7, 9, 11, 12]`

---

### Python Implementation

```python
mylist = [64, 34, 25, 12, 22, 11, 90, 5]

n = len(mylist)
for i in range(1, n):
    insert_index = i
    current_value = mylist.pop(i)
    for j in range(i-1, -1, -1):
        if mylist[j] > current_value:
            insert_index = j
    mylist.insert(insert_index, current_value)

print(mylist)
```

---

# Counting Sort with Python

**Counting Sort** sorts an array by counting occurrences of each distinct value.

**How it works:**
1. Make a count array to count instances of each value.
2. Count each value from the input.
3. Use the count array to reconstruct the sorted output.

**Conditions:**
- Works only for integer, non-negative values within a limited range.

### Manual Example

- myArray = `[2, 3, 0, 2, 3, 2]`
- countArray = `[1, 0, 3, 2]`
- Sorted: `[0, 2, 2, 2, 3, 3]`

### Python Implementation

```python
def countingSort(arr):
    max_val = max(arr)
    count = [0] * (max_val + 1)

    while len(arr) > 0:
        num = arr.pop(0)
        count[num] += 1

    for i in range(len(count)):
        while count[i] > 0:
            arr.append(i)
            count[i] -= 1

    return arr

mylist = [4, 2, 2, 6, 3, 3, 1, 6, 5, 2, 3]
mysortedlist = countingSort(mylist)
print(mysortedlist)
```

---

# Radix Sort with Python

**Radix Sort** sorts numbers by individual digits, starting from the least significant digit.

**How it works:**
1. For each digit (ones, tens, hundreds, ...), place numbers into buckets by the digit value.
2. Rebuild the array by collecting from buckets in order.
3. Repeat for next digit position until all positions are processed.

**Stability is required** for correct sorting.

### Manual Example

- myArray = `[33, 45, 40, 25, 17, 24]`
- After units digit: `[40, 33, 24, 45, 25, 17]`
- After tens digit: `[17, 24, 25, 33, 40, 45]`

### Python Implementation

```python
mylist = [170, 45, 75, 90, 802, 24, 2, 66]
print("Original array:", mylist)
radixArray = [[], [], [], [], [], [], [], [], [], []] 
maxVal = max(mylist)
exp = 1

while maxVal // exp > 0:
    while len(mylist) > 0:
        val = mylist.pop()
        radixIndex = (val // exp) % 10
        radixArray[radixIndex].append(val)

    for bucket in radixArray:
        while len(bucket) > 0:
            val = bucket.pop()
            mylist.append(val)

    exp *= 10

print(mylist)
```

---

# Merge Sort with Python

**Merge Sort** is a divide-and-conquer sorting algorithm.

**How it works:**
1. Divide the array into halves recursively until sub-arrays have one element.
2. Merge sub-arrays back together, always picking the smallest value first.

### Manual Example

- Start: `[12, 8, 9, 3, 11, 5, 4]`
- Split recursively.
- Merge `[8]` and `[9]` → `[8, 9]`
- Merge up to final `[3, 4, 5, 8, 9, 11, 12]`

### Python Implementation

```python
def mergeSort(arr):
    if len(arr) <= 1:
        return arr

    mid = len(arr) // 2
    leftHalf = arr[:mid]
    rightHalf = arr[mid:]

    sortedLeft = mergeSort(leftHalf)
    sortedRight = mergeSort(rightHalf)

    return merge(sortedLeft, sortedRight)

def merge(left, right):
    result = []
    i = j = 0

    while i < len(left) and j < len(right):
        if left[i] < right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1

    result.extend(left[i:])
    result.extend(right[j:])

    return result

mylist = [3, 7, 6, -10, 15, 23.5, 55, -13]
mysortedlist = mergeSort(mylist)
print("Sorted array:", mysortedlist)
```

---

# File Handling & Data Operations

## Read and Display CSV Data

**Display first row of dataset:**
```python
import csv

def main():
    with open('data/CHERNAIR.csv', 'r') as file:
        reader = csv.reader(file)
        data = list(reader)

    if data:
        print("First row of the CSV file:")
        print(data[0])
    else:
        print("CSV file is empty.")

if __name__ == "__main__":
    main()
```

---

**Program 1:** Display row 23 of the dataset  
**Program 2:** Perform sorting on dataset  
**Program 3:** Search for “23.49,0.003” in the dataset using Linear or Binary Search  
**Program 4:** Perform Bubble Sort on dataset  
**Program 5:** Perform Selection Sort, Quick Sort, Insertion Sort, Counting Sort, Radix Sort, Merge Sort

[Download Dataset](https://www.kaggle.com/datasets/lsind18/chernobyl-data-air-concentration)

---

## CSV Linear Regression Example

**Simple Linear Regression:** \( y = mx + c \)
- x: I 131 (Bq/m3)
- y: Cs 137 (Bq/m3)

```python
import csv                         

def main():
    x_values = []  # I 131 (Bq/m3)
    y_values = []  # Cs 137 (Bq/m3)

    with open('data/CHERNAIR.csv', 'r') as file:
        reader = csv.reader(file)
        data = list(reader)

    if data:
        print("Header:", data[0])
        header = data[0]

        # Find correct column indexes by name
        idx_x = header.index('I 131 (Bq/m3)')
        idx_y = header.index('Cs 137 (Bq/m3)')

        for row in data[1:]:
            try:
                x = float(row[idx_x])
                y = float(row[idx_y])
                x_values.append(x)
                y_values.append(y)
            except ValueError:
                continue

        if len(x_values) == 0:
            print("No valid data found in selected columns.")
            return

        # Mean calculation
        n = len(x_values)
        mean_x = sum(x_values) / n
        mean_y = sum(y_values) / n

        # Calculate slope (m)
        numer = 0
        denom = 0
        for i in range(n):
            numer += (x_values[i] - mean_x) * (y_values[i] - mean_y)
            denom += (x_values[i] - mean_x) ** 2

        m = numer / denom
        c = mean_y - m * mean_x

        print("Linear Regression Equation:")
        print("Cs 137 = {:.4f} × I 131 + {:.4f}".format(m, c))

        # Predict from user input
        x_input = float(input("Enter I 131 (Bq/m3) to predict Cs 137: "))
        prediction = m * x_input + c
        print("Predicted Cs 137 (Bq/m3):", round(prediction, 4))

    else:
        print("CSV file is empty.")

if __name__ == "__main__":
    main()
```

---

# Additional Practice & Projects

- Sort a list of names from a CSV using Quick Sort.
- Create a frequency distribution chart for survey ratings (0–5) using Counting Sort.
- Sort a list of phone numbers using Radix Sort.
- Count the number of swaps in Bubble Sort.
- Count shifts in Insertion Sort.

---

## **Project: Sorting Algorithm Visualizer (Console-Based)**

**🎯 Objective:**  
- Implement and compare Bubble, Selection, Insertion, Merge, Quick, Counting, Radix sorts.
- Visualize and compare steps and performance.

**Suggested Structure:**

```
sorting_project/
│
├── main.py                # Main menu and driver code  
├── bubble_sort.py         # Bubble Sort implementation  
├── selection_sort.py      # Selection Sort implementation  
├── insertion_sort.py      # Insertion Sort implementation  
├── merge_sort.py          # Merge Sort implementation  
├── quick_sort.py          # Quick Sort implementation  
├── sample_data.py         # Sample data for testing  
└── utils.py               # Helper functions like print_steps
```

---
