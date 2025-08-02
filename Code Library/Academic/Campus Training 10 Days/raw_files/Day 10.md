# Live Coding

---

### **Implement a `Stack` class with `push()` and `pop()` using a list.**
**Concepts:** Encapsulation, stack behavior

```python
class Stack:
    def __init__(self):
        self.items = []

    def push(self, value):
        self.items.append(value)

    def pop(self):
        if not self.items:
            return "Stack is empty"
        return self.items.pop()
```

---

### **Create a base class `Animal` and a subclass `Dog` that overrides `speak()`.**
**Concepts:** Inheritance, method override

```python
class Animal:
    def speak(self):
        return "Some sound"

class Dog(Animal):
    def speak(self):
        return "Woof!"
```

---

### **Make a class `Student` with marks in 3 subjects. Add a method to return the average.**
**Concepts:** Class, list usage, average logic

```python
class Student:
    def __init__(self, marks):
        self.marks = marks  # List of 3 marks

    def average(self):
        return sum(self.marks) / len(self.marks)
```

---

### **Create a `Rectangle` class with `area()` and `perimeter()` methods.**
**Concepts:** OOP, method logic

```python
class Rectangle:
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def area(self):
        return self.length * self.width

    def perimeter(self):
        return 2 * (self.length + self.width)
```

---

### **Create a class `Book` with title and author. Accept multiple books and print all authors.**
**Concepts:** Class list, object attributes, loop

```python
class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author

books = [
    Book("Book1", "Author1"),
    Book("Book2", "Author2"),
    Book("Book3", "Author1")
]
for book in books:
    print(book.author)
```

---

### **Create a `Student` class with name, roll, and marks. Add a method to display details.**
**Concepts:** Class, `__init__`, basic method

```python
class Student:
    def __init__(self, name, roll, marks):
        self.name = name
        self.roll = roll
        self.marks = marks

    def display(self):
        print(f"Name: {self.name}, Roll: {self.roll}, Marks: {self.marks}")
```

---

### **Create a class `User` with a method to check if a username is already taken (from a list).**
**Concepts:** Class + set membership or list search

```python
class User:
    def __init__(self, usernames):
        self.usernames = set(usernames)

    def is_taken(self, username):
        return username in self.usernames
```

---

### **Create a class `Shape` and subclasses `Circle`, `Square`. Add `area()` method to each.**
**Concepts:** Inheritance, method implementation

```python
import math
class Shape:
    def area(self):
        pass

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
    def area(self):
        return math.pi * self.radius ** 2

class Square(Shape):
    def __init__(self, side):
        self.side = side
    def area(self):
        return self.side * self.side
```

---

### **Create a class `SimpleLinkedList` with `append()` and `print_list()` methods.**
**Concepts:** Node class, linked list basics

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class SimpleLinkedList:
    def __init__(self):
        self.head = None

    def append(self, value):
        new_node = Node(value)
        if not self.head:
            self.head = new_node
            return
        current = self.head
        while current.next:
            current = current.next
        current.next = new_node

    def print_list(self):
        current = self.head
        while current:
            print(current.data, end=" -> ")
            current = current.next
        print("None")
```

---

### **Create a class `Counter` with a method to count vowels in a string.**
**Concepts:** Encapsulation, method logic, string ops

```python
class Counter:
    def count_vowels(self, text):
        return sum(1 for c in text.lower() if c in "aeiou")
```

---

### **Create a class `Cart` that allows adding items to a list and shows the total count.**
**Concepts:** List in class, method call

```python
class Cart:
    def __init__(self):
        self.items = []

    def add(self, item):
        self.items.append(item)

    def total_count(self):
        return len(self.items)
```

---

### **Implement a `Queue` class with `enqueue()` and `dequeue()`.**
**Concepts:** Queue using list or `collections.deque`

```python
class Queue:
    def __init__(self):
        self.items = []

    def enqueue(self, value):
        self.items.append(value)

    def dequeue(self):
        if not self.items:
            return "Queue is empty"
        return self.items.pop(0)
```

---

### **Create a class `Vehicle` with method `fuel_type()`. Subclass `ElectricCar` returns "Electric".**
**Concepts:** Inheritance, polymorphism

```python
class Vehicle:
    def fuel_type(self):
        return "Unknown"

class ElectricCar(Vehicle):
    def fuel_type(self):
        return "Electric"
```

---

### **Create a base class `Employee`. Subclass `Manager` adds bonus to salary.**
**Concepts:** Inheritance, constructor override

```python
class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

class Manager(Employee):
    def __init__(self, name, salary, bonus):
        super().__init__(name, salary)
        self.bonus = bonus

    def total_salary(self):
        return self.salary + self.bonus
```

---

### **Create class `EvenOddSorter` to separate even and odd numbers in a list.**
**Concepts:** List, conditional filtering

```python
class EvenOddSorter:
    def __init__(self, nums):
        self.nums = nums

    def sort_even_odd(self):
        evens = [x for x in self.nums if x % 2 == 0]
        odds = [x for x in self.nums if x % 2 != 0]
        return evens, odds
```

---

# Judge Walkthrough

---

### **1920. Build Array from Permutation**

```python
def buildArray(nums):
    return [nums[nums[i]] for i in range(len(nums))]
# Example: buildArray([0,2,1,5,3,4]) -> [0,1,2,4,5,3]
```

---

### **2942. Find Words Containing Character**

```python
def findWordsContaining(words, x):
    return [i for i, word in enumerate(words) if x in word]
# Example: findWordsContaining(["leet","code"], "e") -> [0,1]
```

---

### **1929. Concatenation of Array**

```python
def getConcatenation(nums):
    return nums + nums
# Example: getConcatenation([1,2,1]) -> [1,2,1,1,2,1]
```

---

### **2011. Final Value of Variable After Performing Operations**

```python
def finalValueAfterOperations(operations):
    x = 0
    for op in operations:
        if "+" in op:
            x += 1
        else:
            x -= 1
    return x
# Example: finalValueAfterOperations(["--X","X++","X++"]) -> 1
```

---

### **3467. Find the Maximum Length of a Good Subsequence I**

```python
def maximumLength(nums):
    from collections import Counter
    c = Counter(nums)
    res = 0
    for v in c.values():
        res = max(res, v)
    return res
# Example: maximumLength([1,2,3,3,2,2]) -> 3
```

---

### **3190. Build Array Where You Can Find The Maximum Exactly K Comparisons**

```python
def constructArray(n, k):
    res = []
    l, r = 1, n
    for i in range(n):
        if k > 1:
            if i % 2 == 0:
                res.append(l)
                l += 1
            else:
                res.append(r)
                r -= 1
            k -= 1
        else:
            res.append(l)
            l += 1
    return res
# Example: constructArray(3,2) -> [1,3,2]
```

---

### **1470. Shuffle the Array**

```python
def shuffle(nums, n):
    return [nums[i//2 + n*(i%2)] for i in range(2*n)]
# Example: shuffle([2,5,1,3,4,7],3) -> [2,3,5,4,1,7]
```

---

### **26. Remove Duplicates from Sorted Array**

```python
def removeDuplicates(nums):
    if not nums: return 0
    i = 0
    for j in range(1, len(nums)):
        if nums[j] != nums[i]:
            i += 1
            nums[i] = nums[j]
    return i+1
# Example: nums = [1,1,2]; removeDuplicates(nums) -> 2 (nums[:2] = [1,2])
```

---

### **3829. Maximum Length Substring With Two Occurrences**

```python
def maximumLengthSubstring(s):
    maxlen = 0
    for i in range(len(s)):
        count = {}
        for j in range(i, len(s)):
            count[s[j]] = count.get(s[j], 0) + 1
            if count[s[j]] > 2:
                break
            maxlen = max(maxlen, j - i + 1)
    return maxlen
# Example: maximumLengthSubstring("aabbcc") -> 6
```

---

### **1684. Count the Number of Consistent Strings**

```python
def countConsistentStrings(allowed, words):
    allowed = set(allowed)
    return sum(all(c in allowed for c in word) for word in words)
# Example: countConsistentStrings("ab", ["ad","bd","aaab","baa","badab"]) -> 2
```

---

### **1431. Kids With the Greatest Number of Candies**

```python
def kidsWithCandies(candies, extraCandies):
    max_candies = max(candies)
    return [c + extraCandies >= max_candies for c in candies]
# Example: kidsWithCandies([2,3,5,1,3], 3) -> [True,True,True,False,True]
```

---

### **2798. Number of Employees Who Met the Target**

```python
def numberOfEmployeesWhoMetTarget(hours, target):
    return sum(h >= target for h in hours)
# Example: numberOfEmployeesWhoMetTarget([0,1,2,3,4],2) -> 3
```

---

### **2574. Left and Right Sum Differences**

```python
def leftRightDifference(nums):
    n = len(nums)
    left, right, answer = [0]*n, [0]*n, [0]*n
    for i in range(1, n):
        left[i] = left[i-1] + nums[i-1]
    for i in range(n-2, -1, -1):
        right[i] = right[i+1] + nums[i+1]
    for i in range(n):
        answer[i] = abs(left[i] - right[i])
    return answer
# Example: leftRightDifference([10,4,8,3]) -> [15,1,11,22]
```

---

### **2824. Count Pairs Whose Sum is Less than Target**

```python
def countPairs(nums, target):
    count = 0
    for i in range(len(nums)):
        for j in range(i+1, len(nums)):
            if nums[i] + nums[j] < target:
                count += 1
    return count
# Example: countPairs([1,2,3,4], 5) -> 4
```

---

### **35. Search Insert Position**

```python
def searchInsert(nums, target):
    left, right = 0, len(nums)-1
    while left <= right:
        mid = (left + right)//2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return left
# Example: searchInsert([1,3,5,6], 5) -> 2
```