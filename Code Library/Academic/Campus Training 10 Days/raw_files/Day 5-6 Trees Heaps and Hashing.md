# **Hash Table**

A **Hash Table** is a data structure designed for fast access, insertion, and deletion—even when working with large datasets.

- **Why not just use arrays or linked lists?**
    - In a linked list, searching for "Bob" requires checking each node one by one.
    - In an array, if you don't know the index, you must compare each element.
    - In a hash table, you use a hash function to go straight to where "Bob" is stored—superfast!

---

## **Building a Hash Table from Scratch (Python Example)**

### **Step 1: Create an Empty List**

```python
my_list = [None] * 10  # 10 slots for our simple hash table
```

---

### **Step 2: Create a Hash Function**

- The hash function converts a value (like a name) to an index in our table.

```python
def hash_function(value):
    sum_of_chars = 0
    for char in value:
        sum_of_chars += ord(char)
    return sum_of_chars % 10

print("'Bob' has hash code:", hash_function('Bob'))  # Example output: 5
```

---

### **Step 3: Inserting an Element**

```python
def add(name):
    index = hash_function(name)
    my_list[index] = name

add('Bob')
print(my_list)
```
After adding "Bob", the array might look like:
```
[None, None, None, None, None, 'Bob', None, None, None, None]
```

Add more names:
```python
add('Pete')
add('Jones')
add('Lisa')
add('Siri')
print(my_list)
```
Example output:
```
[None, 'Jones', None, 'Lisa', None, 'Bob', None, 'Siri', 'Pete', None]
```

---

### **Step 4: Lookup**

```python
def contains(name):
    index = hash_function(name)
    return my_list[index] == name

print("'Pete' is in the Hash Table:", contains('Pete'))
```

---

### **Step 5: Handling Collisions (Chaining)**

- When two values hash to the same index, we need a way to store both (collision).
- We'll use *chaining* (each bucket is a list).

```python
my_list = [[] for _ in range(10)]  # 10 buckets as lists

def add(name):
    index = hash_function(name)
    my_list[index].append(name)

add('Bob')
add('Pete')
add('Jones')
add('Lisa')
add('Siri')
add('Stuart')
print(my_list)
```
Example result:
```
[[], ['Jones'], [], ['Lisa', 'Stuart'], [], ['Bob'], [], ['Siri'], ['Pete'], []]
```

---

# **Python Trees**

A **tree** is a hierarchical data structure. Each node can have multiple "branches."

- **Use cases:** File systems, databases, priority queues, sorting/searching, routing tables.

### **Types of Trees**

- **Binary Tree:** Each node has up to two children.
- **Binary Search Tree (BST):** Left child < parent < right child.
- **AVL Tree:** Self-balancing BST.

---

## **Python Binary Trees**

### **Simple Binary Tree Example**

```python
class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

# Create nodes and tree structure
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)

# Inorder traversal (Left → Root → Right)
def inorder(node):
    if node is not None:
        inorder(node.left)
        print(node.value)
        inorder(node.right)

print("Inorder traversal of the tree:")
inorder(root)
```

---

### **Types of Binary Trees**

- **Balanced:** Height difference between left/right subtrees is at most 1.
- **Complete:** All levels are fully filled except possibly the last, which is filled left to right.
- **Full:** Every node has 0 or 2 children.
- **Perfect:** All internal nodes have two children, and all leaves are at the same level.

---

## **Binary Tree Traversals**

- **DFS (Depth-First Search):**
    - Pre-order: Root → Left → Right
    - In-order: Left → Root → Right
    - Post-order: Left → Right → Root
- **BFS (Breadth-First Search):** Level by level.

### **Pre-order Traversal (DFS)**
```python
def preOrderTraversal(node):
    if node is None:
        return
    print(node.value, end=", ")
    preOrderTraversal(node.left)
    preOrderTraversal(node.right)
```

### **In-order Traversal (DFS)**
```python
def inOrderTraversal(node):
    if node is None:
        return
    inOrderTraversal(node.left)
    print(node.value, end=", ")
    inOrderTraversal(node.right)
```

### **Post-order Traversal (DFS)**
```python
def postOrderTraversal(node):
    if node is None:
        return
    postOrderTraversal(node.left)
    postOrderTraversal(node.right)
    print(node.value, end=", ")
```

---

# **Binary Search Trees (BST)**

A BST ensures:
- All left descendants < node < all right descendants.
- No duplicates for simplicity.

**Key properties:** Efficient search, insertion, and deletion.

---

## **BST Example with Traversals**

```python
class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

def insert(root, value):
    if root is None:
        return Node(value)
    if value < root.value:
        root.left = insert(root.left, value)
    else:
        root.right = insert(root.right, value)
    return root

def inorder(root):
    if root:
        inorder(root.left)
        print(root.value, end=" ")

def preorder(root):
    if root:
        print(root.value, end=" ")
        preorder(root.left)
        preorder(root.right)

def postorder(root):
    if root:
        postorder(root.left)
        postorder(root.right)
        print(root.value, end=" ")

# Create BST
root = None
values = [50, 30, 70, 20, 40, 60, 80]
for val in values:
    root = insert(root, val)

print("Inorder Traversal:")
inorder(root)
print("\nPreorder Traversal:")
preorder(root)
print("\nPostorder Traversal:")
postorder(root)
```

---

## **Search for a Value in a BST**

```python
def search(node, target):
    if node is None:
        return None
    elif node.value == target:
        return node
    elif target < node.value:
        return search(node.left, target)
    else:
        return search(node.right, target)

result = search(root, 13)
if result:
    print(f"Found the node with value: {result.value}")
else:
    print("Value not found in the BST.")
```

---

## **Insert a Node in a BST**

```python
def insert(node, data):
    if node is None:
        return Node(data)
    else:
        if data < node.value:
            node.left = insert(node.left, data)
        elif data > node.value:
            node.right = insert(node.right, data)
    return node

# Example: insert(root, 10)
```

---

## **Find the Minimum Value in a BST Subtree**

```python
def minValueNode(node):
    current = node
    while current.left is not None:
        current = current.left
    return current

print("\nLowest value:", minValueNode(root).value)
```

---

**Summary:**  
- **Hash Tables:** Near-constant time insertion/search using a hash function and chaining for collisions.
- **Trees:** Hierarchical, non-linear data structure.  
    - **Binary Trees**: Up to two children per node.
    - **BSTs**: Left < Root < Right; supports fast search, insertion, deletion.
    - **Traversals:** Pre-order, In-order, Post-order (DFS), and BFS.

[image1]: <data:image/png;base64,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>