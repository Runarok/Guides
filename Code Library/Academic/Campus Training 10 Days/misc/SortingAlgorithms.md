# Types of Sorting Algorithms

Sorting algorithms are vital in computer science for organizing data. They can be classified based on their approach, stability, complexity, and the types of data they handle. Below is a comprehensive overview, with links to example implementations in the [`./Examples`](./Examples) folder.

---

## 1. Comparison-Based Sorting Algorithms

These algorithms sort by comparing elements to one another.

- [**Bubble Sort**](./Examples/BubbleSort.py)  
  Repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. Simple but inefficient for large lists.

- [**Selection Sort**](./Examples/SelectionSort.py)  
  Finds the minimum (or maximum) element from the unsorted section and moves it to the sorted section. Minimizes swaps, but still O(n²) time.

- [**Insertion Sort**](./Examples/InsertionSort.py)  
  Builds the sorted array one item at a time by inserting each element into its correct position. Efficient for small or nearly sorted data.

- [**Merge Sort**](./Examples/MergeSort.py)  
  Uses divide-and-conquer: splits the array into halves, sorts each recursively, and merges the results. Stable and efficient for large data sets.

- [**Quick Sort**](./Examples/QuickSort.py)  
  Divide-and-conquer approach by selecting a 'pivot' and partitioning the array. Very fast in practice, but not stable.

- [**Heap Sort**](./Examples/HeapSort.py)  
  Converts the array to a heap structure, and repeatedly extracts the max/min. Good for large data sets, but not stable.

- [**Shell Sort**](./Examples/ShellSort.py)  
  Generalization of insertion sort that allows exchange of items far apart. Performance depends on gap sequence used.

- [**Tim Sort**](./Examples/TimSort.py)  
  Hybrid of merge and insertion sorts; stable and efficient. Used in Python and Java standard libraries.

---

## 2. Non-Comparison-Based Sorting Algorithms

These do not rely on comparisons, often achieving better than O(n log n) time for specific data types.

- [**Counting Sort**](./Examples/CountingSort.py)  
  Counts occurrences of each unique element. Only works for small integer ranges, but is very fast and stable.

- [**Radix Sort**](./Examples/RadixSort.py)  
  Processes digits of numbers from least significant to most. Useful for integers and strings.

- [**Bucket Sort**](./Examples/BucketSort.py)  
  Distributes elements into buckets, sorts buckets individually (often with insertion sort), and concatenates the results.

---

## 3. Distribution-Based Sorting

These algorithms are tailored for specific key distributions.

- [**Pigeonhole Sort**](./Examples/PigeonholeSort.py)  
  Similar to counting sort, but uses a pigeonhole structure to place elements directly. Efficient when the range of keys is not significantly greater than the number of elements.

---

## 4. Other Specialized Algorithms

- [**Comb Sort**](./Examples/CombSort.py)  
  Improves on bubble sort by eliminating turtles (small values near the end), using a gap sequence.

- [**Cocktail Shaker Sort**](./Examples/CocktailShakerSort.py)  
  Bidirectional bubble sort; passes through the list in both directions.

- [**Gnome Sort**](./Examples/GnomeSort.py)  
  Similar to insertion sort but swaps elements until they are in order.

- [**Cycle Sort**](./Examples/CycleSort.py)  
  Minimizes the number of writes; ideal when memory writes are expensive.

---

## 5. Parallel and External Sorting

- [**External Sort**](./Examples/ExternalSort.py)  
  Designed for massive data sets that do not fit into memory. Often uses variations of merge sort.

- [**Parallel Sort**](./Examples/ParallelSort.py)  
  Utilizes multiple processors or cores to perform sorting simultaneously for large-scale or real-time applications.

---

## 6. Stable vs. Unstable Sorting Algorithms

- **Stable Sorting Algorithms**: Maintain relative order of equal elements.  
  ./Examples: Merge Sort, Bubble Sort, Insertion Sort, Tim Sort, Counting Sort, Radix Sort, Bucket Sort.

- **Unstable Sorting Algorithms**: Do not guarantee relative order.  
  ./Examples: Quick Sort, Heap Sort, Selection Sort, Shell Sort, Cycle Sort, Comb Sort.

---

## 7. Time & Space Complexity Summary

| Algorithm           | Best      | Average   | Worst     | Space    | Stable? | Type           |
|---------------------|-----------|-----------|-----------|----------|---------|----------------|
| Bubble Sort         | O(n)      | O(n²)     | O(n²)     | O(1)     | Yes     | Comparison     |
| Insertion Sort      | O(n)      | O(n²)     | O(n²)     | O(1)     | Yes     | Comparison     |
| Selection Sort      | O(n²)     | O(n²)     | O(n²)     | O(1)     | No      | Comparison     |
| Merge Sort          | O(n log n)| O(n log n)| O(n log n)| O(n)     | Yes     | Comparison     |
| Quick Sort          | O(n log n)| O(n log n)| O(n²)     | O(log n) | No      | Comparison     |
| Heap Sort           | O(n log n)| O(n log n)| O(n log n)| O(1)     | No      | Comparison     |
| Shell Sort          | O(n log n)| O(n log n)| O(n²)     | O(1)     | No      | Comparison     |
| Tim Sort            | O(n)      | O(n log n)| O(n log n)| O(n)     | Yes     | Hybrid         |
| Counting Sort       | O(n+k)    | O(n+k)    | O(n+k)    | O(k)     | Yes     | Non-Comparison |
| Radix Sort          | O(nk)     | O(nk)     | O(nk)     | O(n+k)   | Yes     | Non-Comparison |
| Bucket Sort         | O(n+k)    | O(n+k)    | O(n²)     | O(n)     | Yes     | Non-Comparison |
| Pigeonhole Sort     | O(n + r)  | O(n + r)  | O(n + r)  | O(n + r) | Yes     | Distribution   |

> **n**: number of items  
> **k**: range of input  
> **r**: range of keys

---

## References

- [Sorting Algorithm - Wikipedia](https://en.wikipedia.org/wiki/Sorting_algorithm)
- [Stable vs. Unstable Sorting](https://www.geeksforgeeks.org/stability-in-sorting-algorithms/)
- [Big-O Cheat Sheet](https://www.bigocheatsheet.com/)

---

## See Also

- [Comparison of Sorting Algorithms (Wikipedia)](https://en.wikipedia.org/wiki/Comparison_of_sorting_algorithms)

---

*For example code, see the linked files in the `./Examples` folder. To add more algorithms, create a new file and add its link above.*
