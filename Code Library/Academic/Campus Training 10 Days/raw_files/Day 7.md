# **Searching Algorithms**

## **Linear Search:**

**How it works:**

1. Go through the array value by value from the start.  
2. Compare each value to check if it is equal to the value we are looking for.  
3. If the value is found, return the index of that value.  
4. If the end of the array is reached and the value is not found, return \-1 to indicate that the value was not found.

## **Implement Linear Search in Python**

In Python, the fastest way check if a value exists in a list is to use the `in` operator.

Program 1:

| mylist \= \[3, 7, 2, 9, 5, 1, 8, 4, 6\]if 4 in mylist:  print("Found\!")else:  print("Not found\!") |
| :---- |

But if you need to find the index of a value, you will need to implement a linear search:

| def linearSearch(arr, targetVal):  for i in range(len(arr)):    if arr\[i\] \== targetVal:      return i  return \-1mylist \= \[3, 7, 2, 9, 5, 1, 8, 4, 6\]x \= 4result \= linearSearch(mylist, x)if result \!= \-1:  print("Found at index", result)else:  print("Not found")  |
| :---- |

Binary search again works based on Time complexity due ti linear nature of search refer to the graph on time complexity.

## Binary Search:

The Binary Search algorithm searches through a **sorted** array and returns the index of the value it searches for.  
Binary Search is much faster than Linear Search, but requires a sorted array to work.

**How it works:**

1. Check the value in the center of the array.  
2. If the target value is lower, search the left half of the array. If the target value is higher, search the right half.  
3. Continue step 1 and 2 for the new reduced part of the array until the target value is found or until the search area is empty.  
4. If the value is found, return the target value index. If the target value is not found, return \-1.

Let's try to understand how **Binary Search** works by doing it manually before implementing it in Python.  
 We will search for the value **11** in the following sorted array:

**Manual Run Thru:**

---

**Step 1: Start with the array**  
 `[ 2, 3, 7, 7, 11, 15, 25 ]`

---

**Step 2: Check the middle value**

* Middle index: **3**

* Value at index 3: **7**

Is **7 \== 11**?  
 → **No** — Since 7 is less than 11, search the **right half** of the array.

---

**Step 3: Search the right half**

* Right half: `[ 11, 15, 25 ]`

* Middle index (of this segment): **5**

* Value at index 5: **15**

Is **15 \== 11**?  
 → **No** — Since 15 is greater than 11, search the **left side** of this segment.

---

**Step 4: Search the left of index 5**

* Only remaining index: **4**

* Value at index 4: **11**

**Found it\! ✅**

---

**✅ Result:**

* **Value found:** 11

* **Index position:** 4

---

**🏁 Binary Search Completed**

## **Implementing Binary Search in Python**

To implement the Binary Search algorithm we need:

1. An array with values to search through.  
2. A target value to search for.  
3. A loop that runs as long as left index is less than, or equal to, the right index.  
4. An if-statement that compares the middle value with the target value, and returns the index if the target value is found.  
5. An if-statement that checks if the target value is less than, or larger than, the middle value, and updates the "left" or "right" variables to narrow down the search area.  
6. After the loop, return \-1, because at this point we know the target value has not been found.

The resulting code for Binary Search looks like this:

**Program 1:**

| def binarySearch(arr, targetVal):  left \= 0  right \= len(arr) \- 1  while left \<= right:    mid \= (left \+ right) // 2    if arr\[mid\] \== targetVal:      return mid     if arr\[mid\] \< targetVal:      left \= mid \+ 1    else:      right \= mid \- 1  return \-1mylist \= \[1, 3, 5, 7, 9, 11, 13, 15, 17, 19\]x \= 11result \= binarySearch(mylist, x)if result \!= \-1:  print("Found at index", result)else:  print("Not found")  |
| :---- |

# **Bubble Sort with Python**

Bubble Sort is an algorithm that sorts an array from the lowest value to the highest value.

The word 'Bubble' comes from how this algorithm works, it makes the highest values 'bubble up'.

**How it works:**

1. Go through the array, one value at a time.  
2. For each value, compare the value with the next value.  
3. If the value is higher than the next one, swap the values so that the highest value comes last.  
4. Go through the array as many times as there are values in the array.

## **Manual Run Through**

Before we implement the Bubble Sort algorithm in a programming language, let's manually run through a short array only one time, just to get the idea.

**Step 1:** We start with an unsorted array.

`[7, 12, 9, 11, 3]`  
---

**Step 2:** We look at the two first values. Does the lowest value come first? Yes, so we don't need to swap them.

`[7, 12, 9, 11, 3]`  
---

**Step 3:** Take one step forward and look at values 12 and 9\. Does the lowest value come first? No.

`[7, 12, 9, 11, 3]`  
---

**Step 4:** So we need to swap them so that 9 comes first.

`[7, 9, 12, 11, 3]`  
---

**Step 5:** Taking one step forward, looking at 12 and 11\.

`[7, 9, 12, 11, 3]`  
---

**Step 6:** We must swap so that 11 comes before 12\.

`[7, 9, 11, 12, 3]`  
---

**Step 7:** Looking at 12 and 3, do we need to swap them? Yes.

`[7, 9, 11, 12, 3]`  
---

**Step 8:** Swapping 12 and 3 so that 3 comes first.

`[7, 9, 11, 3, 12]`  
---

Repeat until no more swaps are needed and you will get a sorted array:

## **Implement Bubble Sort in Python**

To implement the Bubble Sort algorithm in Python, we need:

1. An array with values to sort.  
2. An inner loop that goes through the array and swaps values if the first value is higher than the next value. This loop must loop through one less value each time it runs.  
3. An outer loop that controls how many times the inner loop must run. For an array with n values, this outer loop must run n-1 times.

**Program 1:**

| mylist \= \[64, 34, 25, 12, 22, 11, 90, 5\]n \= len(mylist)for i in range(n\-1):  for j in range(n-i\-1):    if mylist\[j\] \> mylist\[j+1\]:      mylist\[j\], mylist\[j+1\] \= mylist\[j+1\], mylist\[j\]print(mylist) |
| :---- |

## **Bubble Sort Improvement**

The Bubble Sort algorithm can be improved a little bit more.

Imagine that the array is almost sorted already, with the lowest numbers at the start, like this for example:

mylist \= \[7, 3, 9, 12, 11\]

In this case, the array will be sorted after the first run, but the Bubble Sort algorithm will continue to run, without swapping elements, and that is not necessary.

If the algorithm goes through the array one time without swapping any values, the array must be finished sorted, and we can stop the algorithm, like this:

Program 1 Contd.

| mylist \= \[7, 3, 9, 12, 11\]n \= len(mylist)for i in range(n\-1):  swapped \= False  for j in range(n-i\-1):    if mylist\[j\] \> mylist\[j+1\]:      mylist\[j\], mylist\[j+1\] \= mylist\[j+1\], mylist\[j\]      swapped \= True  if not swapped:    breakprint(mylist) |
| :---- |

# **Quicksort with Python**

As the name suggests, Quicksort is one of the fastest sorting algorithms.

The Quicksort algorithm takes an array of values, chooses one of the values as the 'pivot' element, and moves the other values so that lower values are on the left of the pivot element, and higher values are on the right of it.

**How it works:**

1. Choose a value in the array to be the pivot element.  
2. Order the rest of the array so that lower values than the pivot element are on the left, and higher values are on the right.  
3. Swap the pivot element with the first element of the higher values so that the pivot element lands in between the lower and higher values.  
4. Do the same operations (recursively) for the sub-arrays on the left and right side of the pivot element.

## **Manual Run Through**

Before we implement the Quicksort algorithm in a programming language, let's manually run through a short array, just to get the idea.

**Step 1:** We start with an unsorted array.

`[ 11, 9, 12, 7, 3]`  
---

**Step 2:** We choose the last value 3 as the pivot element.

`[ 11, 9, 12, 7, 3]`  
---

**Step 3:** The rest of the values in the array are all greater than 3, and must be on the right side of 3\. Swap 3 with 11\.

`[ 3, 9, 12, 7, 11]`  
---

**Step 4:** Value 3 is now in the correct position. We need to sort the values to the right of 3\. We choose the last value 11 as the new pivot element.

`[ 3, 9, 12, 7, 11]`  
---

**Step 5:** The value 7 must be to the left of pivot value 11, and 12 must be to the right of it. Move 7 and 12\.

`[ 3, 9, 7, 12, 11]`  
---

**Step 6:** Swap 11 with 12 so that lower values 9 and 7 are on the left side of 11, and 12 is on the right side.

`[ 3, 9, 7, 11, 12]`  
---

**Step 7:** 11 and 12 are in the correct positions. We choose 7 as the pivot element in sub-array \[ 9, 7\], to the left of 11\.

`[ 3, 9, 7, 11, 12]`  
---

**Step 8:** We must swap 9 with 7\.

`[ 3, 7, 9, 11, 12]`

And now, the array is sorted.

## **Implement Quicksort in Python**

To write a 'quickSort' method that splits the array into shorter and shorter sub-arrays we use recursion. This means that the 'quickSort' method must call itself with the new sub-arrays to the left and right of the pivot element. Read more about recursion [here](https://www.w3schools.com/python/gloss_python_function_recursion.asp).

To implement the Quicksort algorithm in a Python program, we need:

1. An array with values to sort.  
2. A quickSort method that calls itself (recursion) if the sub-array has a size larger than 1\.  
3. A partition method that receives a sub-array, moves values around, swaps the pivot element into the sub-array and returns the index where the next split in sub-arrays happens.

The resulting code looks like this:

### **Example**

| def partition(array, low, high):  pivot \= array\[high\]  i \= low \- 1  for j in range(low, high): 	if array\[j\] \<= pivot:   	i \+= 1   	array\[i\], array\[j\] \= array\[j\], array\[i\]  array\[i+1\], array\[high\] \= array\[high\], array\[i+1\]  return i+1def quicksort(array, low=0, high=None):  if high is None:    high \= len(array) \- 1  if low \< high:    pivot\_index \= partition(array, low, high)    quicksort(array, low, pivot\_index\-1)    quicksort(array, pivot\_index+1, high)mylist \= \[64, 34, 25, 5, 22, 11, 90, 12\]quicksort(mylist)print(mylist)  |
| :---- |

# **Selection Sort with Python**

The Selection Sort algorithm finds the lowest value in an array and moves it to the front of the array.

**How it works:**

1. Go through the array to find the lowest value.  
2. Move the lowest value to the front of the unsorted part of the array.  
3. Go through the array again as many times as there are values in the array.

## **Manual Run Through**

Before we implement the Selection Sort algorithm in Python program, let's manually run through a short array only one time, just to get the idea.

**Step 1:** We start with an unsorted array.

`[ 7, 12, 9, 11, 3]`  
---

**Step 2:** Go through the array, one value at a time. Which value is the lowest? 3, right?

`[ 7, 12, 9, 11, 3]`  
---

**Step 3:** Move the lowest value 3 to the front of the array.

`[ 3, 7, 12, 9, 11]`  
---

**Step 4:** Look through the rest of the values, starting with 7\. 7 is the lowest value, and already at the front of the array, so we don't need to move it.

`[ 3, 7, 12, 9, 11]`  
---

**Step 5:** Look through the rest of the array: 12, 9 and 11\. 9 is the lowest value.

`[ 3, 7, 12, 9, 11]`  
---

**Step 6:** Move 9 to the front.

`[ 3, 7, 9, 12, 11]`  
---

**Step 7:** Looking at 12 and 11, 11 is the lowest.

`[ 3, 7, 9, 12, 11]`  
---

**Step 8:** Move it to the front.

`[ 3, 7, 9, 11, 12]`

Finally, the array is sorted.

## **Implement Selection Sort in Python**

To implement the Selection Sort algorithm in Python, we need:

1. An array with values to sort.  
2. An inner loop that goes through the array, finds the lowest value, and moves it to the front of the array. This loop must loop through one less value each time it runs.  
3. An outer loop that controls how many times the inner loop must run. For an array with n

values, this outer loop must run n−1 times.

The resulting code looks like this:

| mylist \= \[64, 34, 25, 5, 22, 11, 90, 12\]n \= len(mylist)for i in range(n\-1):  min\_index \= i  for j in range(i+1, n): 	if mylist\[j\] \< mylist\[min\_index\]:   	min\_index \= j  min\_value \= mylist.pop(min\_index)  mylist.insert(i, min\_value)print(mylist)  |
| :---- |

# **Insertion Sort with Python**

The Insertion Sort algorithm uses one part of the array to hold the sorted values, and the other part of the array to hold values that are not sorted yet.

The algorithm takes one value at a time from the unsorted part of the array and puts it into the right place in the sorted part of the array, until the array is sorted.

**How it works:**

1. Take the first value from the unsorted part of the array.  
2. Move the value into the correct place in the sorted part of the array.  
3. Go through the unsorted part of the array again as many times as there are values.

## **Manual Run Through**

Before we implement the Insertion Sort algorithm in a Python program, let's manually run through a short array, just to get the idea.

**Step 1:** We start with an unsorted array.

`[ 7, 12, 9, 11, 3]`  
---

**Step 2:** We can consider the first value as the initial sorted part of the array. If it is just one value, it must be sorted, right?

`[ 7, 12, 9, 11, 3]`  
---

**Step 3:** The next value 12 should now be moved into the correct position in the sorted part of the array. But 12 is higher than 7, so it is already in the correct position.

`[ 7, 12, 9, 11, 3]`  
---

**Step 4:** Consider the next value 9\.

`[ 7, 12, 9, 11, 3]`  
---

**Step 5:** The value 9 must now be moved into the correct position inside the sorted part of the array, so we move 9 in between 7 and 12\.

`[ 7, 9, 12, 11, 3]`  
---

**Step 6:** The next value is 11\.

`[ 7, 9, 12, > 11, 3]`  
---

**Step 7:** We move it in between 9 and 12 in the sorted part of the array.

`[ 7, 9, 11, 12, 3]`  
---

**Step 8:** The last value to insert into the correct position is 3\.

`[ 7, 9, 11, 12, 3]`  
---

**Step 9:** We insert 3 in front of all other values because it is the lowest value.

`[ 3,7, 9, 11, 12]`

Finally, the array is sorted.

## **Implement Insertion Sort in Python**

To implement the Insertion Sort algorithm in a Python program, we need:

1. An array with values to sort.  
2. An outer loop that picks a value to be sorted. For an array with n

values, this outer loop skips the first value, and must run n−1 , the sorted part of the array starts at index 0 and ends at index i−1

1. .

The resulting code looks like this:

times.  
An inner loop that goes through the sorted part of the array, to find where to insert the value. If the value to be sorted is at index i

| mylist \= \[64, 34, 25, 12, 22, 11, 90, 5\]n \= len(mylist)for i in range(1,n):  insert\_index \= i  current\_value \= mylist.pop(i)  for j in range(i\-1, \-1, \-1):    if mylist\[j\] \> current\_value:      insert\_index \= j  mylist.insert(insert\_index, current\_value)print(mylist) |
| :---- |

# **Counting Sort with Python**

The Counting Sort algorithm sorts an array by counting the number of times each value occurs.

**How it works:**

1. Create a new array for counting how many there are of the different values.  
2. Go through the array that needs to be sorted.  
3. For each value, count it by increasing the counting array at the corresponding index.  
4. After counting the values, go through the counting array to create the sorted array.  
5. For each count in the counting array, create the correct number of elements, with values that correspond to the counting array index.

## **Conditions for Counting Sort**

These are the reasons why Counting Sort is said to only work for a limited range of non-negative integer values:

* **Integer values:** Counting Sort relies on counting occurrences of distinct values, so they must be integers. With integers, each value fits with an index (for non negative values), and there is a limited number of different values, so that the number of possible different values k

is not too big compared to the number of values n   is larger than the number of values to be sorted n, the counting array we need for sorting will be larger than the original array we have that needs sorting, and the algorithm becomes ineffective..  
**Non negative values:** Counting Sort is usually implemented by creating an array for counting. When the algorithm goes through the values to be sorted, value x is counted by increasing the counting array value at index x. If we tried sorting negative values, we would get in trouble with sorting value \-3, because index \-3 would be outside the counting array.  
**Limited range of values:** If the number of possible different values to be sorted k

## **Manual Run Through**

Before we implement the Counting Sort algorithm in a programming language, let's manually run through a short array, just to get the idea.

**Step 1:** We start with an unsorted array.

`myArray = [ 2, 3, 0, 2, 3, 2]`  
---

**Step 2:** We create another array for counting how many there are of each value. The array has 4 elements, to hold values 0 through 3\.

`myArray = [ 2, 3, 0, 2, 3, 2]`  
`countArray = [ 0, 0, 0, 0]`  
---

**Step 3:** Now let's start counting. The first element is 2, so we must increment the counting array element at index 2\.

`myArray = [ 2, 3, 0, 2, 3, 2]`  
`countArray = [ 0, 0, 1, 0]`  
---

**Step 4:** After counting a value, we can remove it, and count the next value, which is 3\.

`myArray = [ 3, 0, 2, 3, 2]`  
`countArray = [ 0, 0, 1, 1]`  
---

**Step 5:** The next value we count is 0, so we increment index 0 in the counting array.

`myArray = [ 0, 2, 3, 2]`  
`countArray = [ 1, 0, 1, 1]`  
---

**Step 6:** We continue like this until all values are counted.

`myArray = [ ]`  
`countArray = [ 1, 0, 3, 2]`  
---

**Step 7:** Now we will recreate the elements from the initial array, and we will do it so that the elements are ordered lowest to highest.

The first element in the counting array tells us that we have 1 element with value 0\. So we push 1 element with value 0 into the array, and we decrease the element at index 0 in the counting array with 1\.

`myArray = [ 0]`  
`countArray = [ 0, 0, 3, 2]`  
---

**Step 8:** From the counting array we see that we do not need to create any elements with value 1\.

`myArray = [ 0]`  
`countArray = [ 0, 0, 3, 2]`  
---

**Step 9:** We push 3 elements with value 2 into the end of the array. And as we create these elements we also decrease the counting array at index 2\.

`myArray = [ 0, 2, 2, 2]`  
`countArray = [ 0, 0, 0, 2]`  
---

**Step 10:** At last we must add 2 elements with value 3 at the end of the array.

`myArray = [0, 2, 2, 2, 3, 3]`  
`countArray = [ 0, 0, 0, 0]`

Finally\! The array is sorted.

## **Implement Counting Sort in Python**

To implement the Counting Sort algorithm in a Python program, we need:

1. An array with values to sort.  
2. A 'countingSort' method that receives an array of integers.  
3. An array inside the method to keep count of the values.  
4. A loop inside the method that counts and removes values, by incrementing elements in the counting array.  
5. A loop inside the method that recreates the array by using the counting array, so that the elements appear in the right order.

**One more thing:** We need to find out what the highest value in the array is, so that the counting array can be created with the correct size. For example, if the highest value is 5, the counting array must be 6 elements in total, to be able count all possible non negative integers 0, 1, 2, 3, 4 and 5\.

The resulting code looks like this:

| def countingSort(arr):  max\_val \= max(arr)  count \= \[0\] \* (max\_val \+ 1)  while len(arr) \> 0:    num \= arr.pop(0)    count\[num\] \+= 1  for i in range(len(count)):    while count\[i\] \> 0:      arr.append(i)      count\[i\] \-= 1  return arrmylist \= \[4, 2, 2, 6, 3, 3, 1, 6, 5, 2, 3\]mysortedlist \= countingSort(mylist)print(mysortedlist) |
| :---- |

# **Radix Sort with Python**

## **Radix Sort**

The Radix Sort algorithm sorts an array by individual digits, starting with the least significant digit (the rightmost one).

**How it works:**

1. Start with the least significant digit (rightmost digit).  
2. Sort the values based on the digit in focus by first putting the values in the correct bucket based on the digit in focus, and then put them back into array in the correct order.  
3. Move to the next digit, and sort again, like in the step above, until there are no digits left.

**Stable Sorting in Radix Sort**

Radix Sort needs to be **stable** to work correctly. A *stable sorting algorithm* keeps the order of equal elements the same before and after sorting.

For example, if "K" and "L" both have the value 3, and "K" comes before "L" in the original list, a stable sort will keep "K" before "L" in the final sorted list.

This is important in Radix Sort because it sorts numbers one digit at a time. After sorting by one digit (like the units place), we move to the next digit (like the tens place). If the sort is not stable, the order from the previous step can get messed up, and the final result will be wrong.

In simulations, you can see how stable sorting works. If we sort in an **unstable** way—like putting items into buckets from the end of the array—it can lead to incorrect results.

## **Manual Run Through**

Let's try to do the sorting manually, just to get an even better understanding of how Radix Sort works before actually implementing it in a programming language.

**Step 1:** We start with an unsorted array, and an empty array to fit values with corresponding radices 0 till 9\.

`myArray = [ 33, 45, 40, 25, 17, 24]`  
`radixArray = [ [], [], [], [], [], [], [], [], [], [] ]`  
---

**Step 2:** We start sorting by focusing on the least significant digit.

`myArray = [ 33, 45, 40, 25, 17, 24]`  
`radixArray = [ [], [], [], [], [], [], [], [], [], [] ]`  
---

**Step 3:** Now we move the elements into the correct positions in the radix array according to the digit in focus. Elements are taken from the start of myArray and pushed into the correct position in the radixArray.

`myArray = [ ]`  
`radixArray = [ [40], [], [], [33], [24], [45, 25], [], [17], [], [] ]`  
---

**Step 4:** We move the elements back into the initial array, and the sorting is now done for the least significant digit. Elements are taken from the end radixArray, and put into the start of myArray.

`myArray = [ 40, 33, 24, 45, 25, 17 ]`  
`radixArray = [ [], [], [], [], [], [], [], [], [], [] ]`  
---

**Step 5:** We move focus to the next digit. Notice that values 45 and 25 are still in the same order relative to each other as they were to start with, because we sort in a stable way.

`myArray = [ 40, 33, 24, 45, 25, 17 ]`  
`radixArray = [ [], [], [], [], [], [], [], [], [], [] ]`  
---

**Step 6:** We move elements into the radix array according to the focused digit.

`myArray = [ ]`  
`radixArray = [ [], [17], [24, 25], [33], [40, 45], [], [], [], [], [] ]`  
---

**Step 7:** We move elements back into the start of myArray, from the back of radixArray.

`myArray = [ 17, 24, 25, 33, 40, 45 ]`  
`radixArray = [ [], [], [], [], [], [], [], [], [], [] ]`

The sorting is finished\!

## **Implement Radix Sort in Python**

To implement the Radix Sort algorithm we need:

1. An array with non negative integers that needs to be sorted.  
2. A two dimensional array with index 0 to 9 to hold values with the current radix in focus.  
3. A loop that takes values from the unsorted array and places them in the correct position in the two dimensional radix array.  
4. A loop that puts values back into the initial array from the radix array.  
5. An outer loop that runs as many times as there are digits in the highest value.

The resulting code looks like this:

| mylist \= \[170, 45, 75, 90, 802, 24, 2, 66\]print("Original array:", mylist)radixArray \= \[\[\], \[\], \[\], \[\], \[\], \[\], \[\], \[\], \[\], \[\]\] maxVal \= max(mylist)exp \= 1while maxVal // exp \> 0:  while len(mylist) \> 0:    val \= mylist.pop()    radixIndex \= (val // exp) % 10    radixArray\[radixIndex\].append(val)  for bucket in radixArray:    while len(bucket) \> 0:      val \= bucket.pop()      mylist.append(val)  exp \*= 10print(mylist)  |
| :---- |

# **Merge Sort with Python**

The Merge Sort algorithm is a divide-and-conquer algorithm that sorts an array by first breaking it down into smaller arrays, and then building the array back together the correct way so that it is sorted.

**Divide:** The algorithm starts with breaking up the array into smaller and smaller pieces until one such sub-array only consists of one element.

**Conquer:** The algorithm merges the small pieces of the array back together by putting the lowest values first, resulting in a sorted array.

The breaking down and building up of the array to sort the array is done recursively.

In the animation above, each time the bars are pushed down represents a recursive call, splitting the array into smaller pieces. When the bars are lifted up, it means that two sub-arrays have been merged together.

The Merge Sort algorithm can be described like this:

**How it works:**

1. Divide the unsorted array into two sub-arrays, half the size of the original.  
2. Continue to divide the sub-arrays as long as the current piece of the array has more than one element.  
3. Merge two sub-arrays together by always putting the lowest value first.  
4. Keep merging until there are no sub-arrays left.

## **Manual Run Through**

Let's try to do the sorting manually, just to get an even better understanding of how Merge Sort works before actually implementing it in a Python program.

**Step 1:** We start with an unsorted array, and we know that it splits in half until the sub-arrays only consist of one element. The Merge Sort function calls itself two times, once for each half of the array. That means that the first sub-array will split into the smallest pieces first.

`[ 12, 8, 9, 3, 11, 5, 4]`  
`[ 12, 8, 9] [ 3, 11, 5, 4]`  
`[ 12] [ 8, 9] [ 3, 11, 5, 4]`  
`[ 12] [ 8] [ 9] [ 3, 11, 5, 4]`  
---

**Step 2:** The splitting of the first sub-array is finished, and now it is time to merge. 8 and 9 are the first two elements to be merged. 8 is the lowest value, so that comes before 9 in the first merged sub-array.

`[ 12] [ 8, 9] [ 3, 11, 5, 4]`  
---

**Step 3:** The next sub-arrays to be merged is \[ 12\] and \[ 8, 9\]. Values in both arrays are compared from the start. 8 is lower than 12, so 8 comes first, and 9 is also lower than 12\.

`[ 8, 9, 12] [ 3, 11, 5, 4]`  
---

**Step 4:** Now the second big sub-array is split recursively.

`[ 8, 9, 12] [ 3, 11, 5, 4]`  
`[ 8, 9, 12] [ 3, 11] [ 5, 4]`  
`[ 8, 9, 12] [ 3] [ 11] [ 5, 4]`  
---

**Step 5:** 3 and 11 are merged back together in the same order as they are shown because 3 is lower than 11\.

`[ 8, 9, 12] [ 3, 11] [ 5, 4]`  
---

**Step 6:** Sub-array with values 5 and 4 is split, then merged so that 4 comes before 5\.

`[ 8, 9, 12] [ 3, 11] [ 5] [ 4]`  
`[ 8, 9, 12] [ 3, 11] [ 4, 5]`  
---

**Step 7:** The two sub-arrays on the right are merged. Comparisons are done to create elements in the new merged array:

1. 3 is lower than 4  
2. 4 is lower than 11  
3. 5 is lower than 11  
4. 11 is the last remaining value

`[ 8, 9, 12] [ 3, 4, 5, 11]`  
---

**Step 8:** The two last remaining sub-arrays are merged. Let's look at how the comparisons are done in more detail to create the new merged and finished sorted array:

3 is lower than 8:

`Before [ 8, 9, 12] [ 3, 4, 5, 11]`  
`After: [ 3, 8, 9, 12] [ 4, 5, 11]`  
---

**Step 9:** 4 is lower than 8:

`Before [ 3, 8, 9, 12] [ 4, 5, 11]`  
`After: [ 3, 4, 8, 9, 12] [ 5, 11]`  
---

**Step 10:** 5 is lower than 8:

`Before [ 3, 4, 8, 9, 12] [ 5, 11]`  
`After: [ 3, 4, 5, 8, 9, 12] [ 11]`  
---

**Step 11:** 8 and 9 are lower than 11:

`Before [ 3, 4, 5, 8, 9, 12] [ 11]`  
`After: [ 3, 4, 5, 8, 9, 12] [ 11]`  
---

**Step 12:** 11 is lower than 12:

`Before [ 3, 4, 5, 8, 9, 12] [ 11]`  
`After: [ 3, 4, 5, 8, 9, 11, 12]`

The sorting is finished\!

## **Implement Merge Sort in Python**

To implement the Merge Sort algorithm we need:

1. An array with values that needs to be sorted.  
2. A function that takes an array, splits it in two, and calls itself with each half of that array so that the arrays are split again and again recursively, until a sub-array only consist of one value.  
3. Another function that merges the sub-arrays back together in a sorted way.

The resulting code looks like this:

| def mergeSort(arr):  if len(arr) \<= 1:    return arr  mid \= len(arr) // 2  leftHalf \= arr\[:mid\]  rightHalf \= arr\[mid:\]  sortedLeft \= mergeSort(leftHalf)  sortedRight \= mergeSort(rightHalf)  return merge(sortedLeft, sortedRight)def merge(left, right):  result \= \[\]  i \= j \= 0  while i \< len(left) and j \< len(right):    if left\[i\] \< right\[j\]:      result.append(left\[i\])      i \+= 1    else:      result.append(right\[j\])      j \+= 1  result.extend(left\[i:\])  result.extend(right\[j:\])  return resultmylist \= \[3, 7, 6, \-10, 15, 23.5, 55, \-13\]mysortedlist \= mergeSort(mylist)print("Sorted array:", mysortedlist)  |
| :---- |

# File Handling

Import the dataset linked and run the operation to list the first row of the dataset

Program 1 : Display row 23 of the dataset  
Program 2: Perform sorting on Dataset  
Program 3: Search for “23.49,**0.003” In the dataset using a search Linear or binary**  
Program 4: Perform Bubble Sort on dataset  
Program 5: Perform Selection Sort,Quick Sort,Insertion Sort,Counting sort,radix sort,Merge Sort

[Download Dataset](https://www.kaggle.com/datasets/lsind18/chernobyl-data-air-concentration)

| import csvdef main():    with open('data/CHERNAIR.csv', 'r') as file:        reader \= csv.reader(file)        data \= list(reader)    if data:        print("First row of the CSV file:")        print(data\[0\])    else:        print("CSV file is empty.")if \_\_name\_\_ \== "\_\_main\_\_":    main() |
| :---- |

* Sort a list of names read from a CSV file using Quick Sort.

* Create a frequency distribution chart for survey ratings (0–5) using Counting Sort logic.

* Sort a list of phone numbers using Radix Sort.

* Simple Linear Regression with CSV y \= mx \+ c

I 131 (Bq/m3)  
Cs 137 (Bq/m3)

| import csv                         def main():    x\_values \= \[\]  \# I 131 (Bq/m3)    y\_values \= \[\]  \# Cs 137 (Bq/m3)    with open('data/CHERNAIR.csv', 'r') as file:        reader \= csv.reader(file)        data \= list(reader)    if data:        print("Header:", data\[0\])        header \= data\[0\]        \# Find correct column indexes by name        idx\_x \= header.index('I 131 (Bq/m3)')        idx\_y \= header.index('Cs 137 (Bq/m3)')        for row in data\[1:\]:            try:                x \= float(row\[idx\_x\])                y \= float(row\[idx\_y\])                x\_values.append(x)                y\_values.append(y)            except ValueError:                \# Skip rows where values are missing or not numbers                continue        if len(x\_values) \== 0:            print("No valid data found in selected columns.")            return        \# Mean calculation        n \= len(x\_values)        mean\_x \= sum(x\_values) / n        mean\_y \= sum(y\_values) / n        \# Calculate slope (m)        numer \= 0        denom \= 0        for i in range(n):            numer \+= (x\_values\[i\] \- mean\_x) \* (y\_values\[i\] \- mean\_y)            denom \+= (x\_values\[i\] \- mean\_x) \*\* 2        m \= numer / denom        c \= mean\_y \- m \* mean\_x        print("Linear Regression Equation:")        print("Cs 137 \= {:.4f} × I 131 \+ {:.4f}".format(m, c))        \# Predict from user input        x\_input \= float(input("Enter I 131 (Bq/m3) to predict Cs 137: "))        prediction \= m \* x\_input \+ c        print("Predicted Cs 137 (Bq/m3):", round(prediction, 4))    else:        print("CSV file is empty.")if \_\_name\_\_ \== "\_\_main\_\_":    main() |
| :---- |

* Count the number of swaps performed during Bubble Sort.  
    
* Count how many times elements are shifted during Insertion Sort.

## **Project Title: Sorting Algorithm Visualizer (Console-Based)**

### **🎯 Objective:**

To help students understand how sorting works by:

* Implementing multiple sorting algorithms (Bubble, Selection, Insertion, Merge, Quick).

* Comparing the performance visually and by steps.

* Running all algorithms on the same data.

sorting\_project/  
│  
├── main.py                \# Main menu and driver code  
├── bubble\_sort.py         \# Bubble Sort implementation  
├── selection\_sort.py      \# Selection Sort implementation  
├── insertion\_sort.py      \# Insertion Sort implementation  
├── merge\_sort.py          \# Merge Sort implementation  
├── quick\_sort.py          \# Quick Sort implementation  
├── sample\_data.py         \# Sample data for testing  
└── utils.py               \# Helper functions like print\_steps

