# **Hash Table**

A Hash Table is a data structure designed to be fast to work with.

The reason Hash Tables are sometimes preferred instead of arrays or linked lists is because searching for, adding, and deleting data can be done really quickly, even for large amounts of data.

In a [Linked List](https://www.w3schools.com/python/python_dsa_linkedlists.asp), finding a person "Bob" takes time because we would have to go from one node to the next, checking each node, until the node with "Bob" is found.

And finding "Bob" in an [list/array](https://www.w3schools.com/python/python_dsa_lists.asp) could be fast if we knew the index, but when we only know the name "Bob", we need to compare each element and that takes time.

With a Hash Table however, finding "Bob" is done really fast because there is a way to go directly to where "Bob" is stored, using something called a hash function.

## **Building A Hash Table from Scratch**

To get the idea of what a Hash Table is, let's try to build one from scratch, to store unique first names inside it.

We will build the Hash Table in 5 steps:

1. Create an empty list (it can also be a dictionary or a set).  
2. Create a hash function.  
3. Inserting an element using a hash function.  
4. Looking up an element using a hash function.  
5. Handling collisions.

## 

### **Step 1: Create an Empty List**

To keep it simple, let's create a list with 10 empty elements.

| my\_list \= \[None, None, None, None, None, None, None, None, None, None\] My\_list \= \[None\] \* 10 |
| :---- |
|  |

### **Step 2: Create a Hash Function**

Now comes the special way we interact with Hash Tables.

We want to store a name directly into its right place in the array, and this is where the **hash function** comes in.

A hash function can be made in many ways, it is up to the creator of the Hash Table. A common way is to find a way to convert the value into a number that equals one of the Hash Table's index numbers, in this case a number from 0 to 9\.

In our example we will use the Unicode number of each character, summarize them and do a modulo 10 operation to get index numbers 0-9.

## **How a Hash Function Works**

1\. Take each letter in the name and find its Unicode number  
(This is just the number your computer uses to represent a letter.)

2\. Add all those numbers together.

3\. Then do modulo 10 (divide by 10 and take the remainder).  
This gives us a number between 0 and 9 — perfect for our 10-slot table\!

🔢 Example:  
Let’s say we want to add the name "Tom":

    Unicode of 'T' \= 84  
    Unicode of 'o' \= 111  
    Unicode of 'm' \= 109  
    Total \= 84 \+ 111 \+ 109 \= 304  
    304 % 10 \= 4

So "Tom" will be stored at index 4 in our hash table\!

| def hash\_function(value):  sum\_of\_chars \= 0  for char in value:    sum\_of\_chars \+= ord(char)  return sum\_of\_chars % 10print("'Bob' has hash code:", hash\_function('Bob')) |
| :---- |

The character `B` has Unicode number `66`, `o` has `111`, and `b` has `98`. Adding those together we get `275`. Modulo 10 of `275` is `5`, so `"Bob"` should be stored at index `5`.

The number returned by the hash function is called the **hash code**.

**Unicode number:** Everything in our computers are stored as numbers, and the Unicode code number is a unique number that exist for every character. For example, the character `A` has Unicode number `65`.

See [this page](https://www.w3schools.com/charsets/ref_utf_basic_latin.asp) for more information about how characters are represented as numbers.

**Modulo:** A modulo operation divides a number with another number, and gives us the resulting remainder. So for example, `7 % 3` will give us the remainder `1`. (Dividing 7 apples between 3 people, means that each person gets 2 apples, with 1 apple to spare.)

In Python and most programming languages, the modolo operator is written as `%`.

### **Step 3: Inserting an Element**

According to our hash function, "Bob" should be stored at index 5\.

Lets create a function that add items to our hash table:

| def add(name):  index \= hash\_function(name)  my\_list\[index\] \= nameadd('Bob')print(my\_list)  |
| :---- |

After storing "Bob" at index 5, our array now looks like this:

| my\_list \= \[None, None, None, None, None, 'Bob', None, None, None, None\]  |
| :---- |

We can use the same functions to store "Pete", "Jones", "Lisa", and "Siri" as well.

| add('Pete')add('Jones')add('Lisa')add('Siri')print(my\_list)  |
| :---- |

After using the hash function to store those names in the correct position, our array looks like this:

| my\_list \= \[None, 'Jones', None, 'Lisa', None, 'Bob', None, 'Siri', 'Pete', None\] |
| :---- |

### **Step 4: Looking up a name**

Now that we have a super basic Hash Table, let's see how we can look up a name from it.

To find "Pete" in the Hash Table, we give the name "Pete" to our hash function. The hash function returns `8`, meaning that "Pete" is stored at index 8\.

| def contains(name):  index \= hash\_function(name)  return my\_list\[index\] \== nameprint("'Pete' is in the Hash Table:", contains('Pete'))  |
| :---- |

Because we do not have to check element by element to find out if "Pete" is in there, we can just use the hash function to go straight to the right element\!

### **Step 5: Handling collisions**

Let's also add "Stuart" to our Hash Table.

We give "Stuart" to our hash function, which returns `3`, meaning "Stuart" should be stored at index 3\.

Trying to store "Stuart" in index 3, creates what is called a **collision**, because "Lisa" is already stored at index 3\.

To fix the collision, we can make room for more elements in the same bucket. Solving the collision problem in this way is called **chaining**, and means giving room for more elements in the same bucket.

Start by creating a new list with the same size as the original list, but with empty buckets:

| my\_list \= \[  \[\],  \[\],  \[\],  \[\],  \[\],  \[\],  \[\],  \[\],  \[\],  \[\]\]  |
| :---- |

Rewrite the `add()` function, and add the same names as before:

| def add(name):  index \= hash\_function(name)  my\_list\[index\].append(name)add('Bob')add('Pete')add('Jones')add('Lisa')add('Siri')add('Stuart')print(my\_list)  |
| :---- |

After implementing each bucket as a list, "Stuart" can also be stored at index 3, and our Hash Set now looks like this:

| my\_list \= \[  \[None\],  \['Jones'\],  \[None\],  \['Lisa', 'Stuart'\],  \[None\],  \['Bob'\],  \[None\],  \['Siri'\],  \['Pete'\],  \[None\]\]  |
| :---- |

Searching for "Stuart" now takes a little bit longer time, because we also find "Lisa" in the same bucket, but still much faster than searching the entire Hash Table.

# **Python Trees**

A tree is a hierarchical data structure consisting of nodes connected by edges. Each node contains a value and references to its child nodes.

## **Trees**

The Tree data structure is similar to [Linked Lists](https://www.w3schools.com/python/python_dsa_linkedlists.asp) in that each node contains data and can be linked to other nodes.

We have previously covered data structures like Arrays, Linked Lists, Stacks, and Queues. These are all linear structures, which means that each element follows directly after another in a sequence. Trees however, are different. In a Tree, a single element can have multiple 'next' elements, allowing the data structure to branch out in various directions.

The data structure is called a "tree" because it looks like a tree's structure.

![][image1]

The Tree data structure can be useful in many cases:

* Hierarchical Data: File systems, organizational models, etc.  
* Databases: Used for quick data retrieval.  
* Routing Tables: Used for routing data in network algorithms.  
* Sorting/Searching: Used for sorting data and searching for data.  
* Priority Queues: Priority queue data structures are commonly implemented using trees, such as binary heaps.

## **Types of Trees**  Trees are essential data structures used to model hierarchical relationships. Key types include:

* Binary Tree: Each node has up to two children—left and right. It forms the base for other tree types.

* Binary Search Tree (BST): A Binary Tree where the left child holds a smaller value and the right a larger one.

* AVL Tree: A self-balancing BST where the height difference between left and right subtrees of any node is at most one, maintained using rotations during insertions and deletions.

## **Trees vs Arrays and Linked Lists**

* **Arrays** allow fast direct access (e.g., element 700), but insertions and deletions are slow due to memory shifts.

* **Linked Lists** make insertions and deletions easy (no shifting), but accessing elements is slower as you must traverse the list.

* **Trees** (like Binary Trees, BSTs, and AVL Trees) combine the strengths of both: fast access and efficient insertions/deletions without shifting memory.

# **Python Binary Trees**

A tree is a hierarchical data structure consisting of nodes connected by edges. Each node contains a value and references to its child nodes.

## Simple Binary Tree:

| \# Each node in the treeclass Node:    def \_\_init\_\_(self, value):        self.value \= value        self.left \= None        self.right \= None\# Making the treeroot \= Node(1)         \#     1root.left \= Node(2)    \#    / \\root.right \= Node(3)   \#   2   3root.left.left \= Node(4)   \#  /root.left.right \= Node(5)  \# 4   5\# Inorder \= Left → Root → Rightdef inorder(node):    if node is not None:        inorder(node.left)        print(node.value)        inorder(node.right)\# Let's see the tree valuesprint("Inorder traversal of the tree:")inorder(root) |
| :---- |

## **Types of Binary Trees**

Binary Trees come in several variants that help understand different structures:

* **Balanced Binary Tree**: For every node, the height difference between left and right subtrees is at most 1\.

* **Complete Binary Tree**: All levels are fully filled except possibly the last, which is filled left to right. Always balanced.

* **Full Binary Tree**: Every node has either 0 or 2 children.

* **Perfect Binary Tree**: All internal nodes have two children, and all leaves are at the same level. It's also full, balanced, and complete.

## 

## **Binary Tree Traversal**

Traversal means visiting every node in a tree one at a time.

Unlike arrays and linked lists (which are linear and have only one way to traverse), trees are non-linear and offer multiple traversal methods:

* **Breadth-First Search (BFS)**: Visits all nodes level by level (sideways).

* **Depth-First Search (DFS)**: Explores branches deeply before moving sideways.

DFS has three types:

* **Pre-order**

* **In-order**

* **Post-order**

## **Pre-order Traversal (DFS)**

In Pre-order Traversal, each node is visited **before** its subtrees:

1. Visit the root

2. Traverse the left subtree

3. Traverse the right subtree

It’s useful for copying trees and prefix expressions.

| def preOrderTraversal(node):  if node is None:    return  print(node.data, end=", ")  preOrderTraversal(node.left)  preOrderTraversal(node.right) |
| :---- |

The first node printed is **R**, as Pre-order visits the current node first. Then it recursively traverses the left subtree (**A**, then **C**), followed by the right.

When a node has no child (like C's left), `None` is returned. After both of C’s children return `None`, the function backtracks to visit **D** (A's right child), and continues similarly with R’s right subtree.

## **In-order Traversal of Binary Trees**

In-order Traversal is a type of Depth First Search, where each node is visited in a certain order.

In-order Traversal does a recursive In-order Traversal of the left subtree, visits the root node, and finally, does a recursive In-order Traversal of the right subtree. This traversal is mainly used for Binary Search Trees where it returns values in ascending order.

What makes this traversal "in" order, is that the node is visited in between the recursive function calls. The node is visited after the In-order Traversal of the left subtree, and before the In-order Traversal of the right subtree.

This is how the code for In-order Traversal looks like:

| def inOrderTraversal(node):  if node is None:    return  inOrderTraversal(node.left)  print(node.data, end=", ")  inOrderTraversal(node.right)  |
| :---- |

`inOrderTraversal()` keeps calling itself on the left child until it hits `None`. This first happens with node **C**'s left child.

Then **C** is printed, followed by a call to its right child, which is also `None`. The function then backtracks, printing **A**, **D**, **R**, and so on.

## **Post-order Traversal of Binary Trees**

Post-order Traversal is a type of Depth First Search, where each node is visited in a certain order..

Post-order Traversal works by recursively doing a Post-order Traversal of the left subtree and the right subtree, followed by a visit to the root node. It is used for deleting a tree, post-fix notation of an expression tree, etc.

What makes this traversal "post" is that visiting a node is done "after" the left and right child nodes are called recursively.

This is how the code for Post-order Traversal looks like:

| def postOrderTraversal(node):  if node is None:    return  postOrderTraversal(node.left)  postOrderTraversal(node.right)  print(node.data, end=", ")  |
| :---- |

`postOrderTraversal()` first recursively traverses the left subtree, then the right. For node **C**, both children return `None`, so **C** is printed **after** them—hence "post"-order.

The function then backtracks, printing **D**, then **A**, and continues until all nodes are visited.

# **Binary Search Trees**

A Binary Search Tree (BST) is a type of [Binary Tree data structure](https://www.w3schools.com/python/python_dsa_binarytrees.asp), where the following properties must be true for any node "X" in the tree:

* The X node's left child and all of its descendants (children, children's children, and so on) have lower values than X's value.  
* The right child, and all its descendants have higher values than X's value.  
* Left and right subtrees must also be Binary Search Trees.

These properties make searching, adding, and deleting values in a Binary Search Tree (BST) faster than in a regular binary tree.

To keep things simple, we'll assume all values in the BST are unique.

* **Size**: The total number of nodes in the tree (n).

* **Subtree**: A node and all its descendants, with the node acting as a local root.

* **Descendants**: All child nodes of a node, and their children, recursively.

* **Height**: The number of edges on the longest path from a node to any leaf.

* **In-order Successor**: The next node in in-order traversal. For example, in a BST where node 13 comes before node 14, node 14 is the in-order successor of node 13\.

## **Traversal of a Binary Search Tree**

Just to confirm that we actually have a Binary Search Tree data structure in front of us, we can check if the properties at the top of this page are true. So for every node in the figure above, check if all the values to the left of the node are lower, and that all values to the right are higher.

Another way to check if a Binary Tree is BST, is to do an in-order traversal (like we did on the previous page) and check if the resulting list of values are in an increasing order.

The code below is an implementation of the Binary Search Tree in the figure above, with traversal.

### **Binary Search Tree Traversal:**

| \# Define a Node class for the BSTclass Node:    def \_\_init\_\_(self, value):        self.value \= value        self.left \= None        self.right \= None\# Function to insert a value into the BSTdef insert(root, value):    if root is None:        return Node(value)        if value \< root.value:        root.left \= insert(root.left, value)    else:        root.right \= insert(root.right, value)        return root\# Inorder Traversal (Left → Root → Right)def inorder(root):    if root:        inorder(root.left)        print(root.value, end=" ")\# Preorder Traversal (Root → Left → Right)def preorder(root):    if root:        print(root.value, end=" ")        preorder(root.left)        preorder(root.right)\# Postorder Traversal (Left → Right → Root)def postorder(root):    if root:        postorder(root.left)        postorder(root.right)        print(root.value, end=" ")\# \------------------------\# Create BST and test\# \------------------------\# Let's build this BST:\#        50\#       /  \\\#     30    70\#    / \\    / \\\#  20  40  60  80root \= Nonevalues \= \[50, 30, 70, 20, 40, 60, 80\]for val in values:    root \= insert(root, val)print("Inorder Traversal:")inorder(root)  \# Output: 20 30 40 50 60 70 80print("\\nPreorder Traversal:")preorder(root)  \# Output: 50 30 20 40 70 60 80print("\\nPostorder Traversal:")postorder(root)  \# Output: 20 40 30 60 80 70 50 |
| :---- |

## **Search for a Value in a BST**

Searching for a value in a BST is very similar to how we found a value using [Binary Search](https://www.w3schools.com/python/python_dsa_binarysearch.asp) on an array.

For Binary Search to work, the array must be sorted already, and searching for a value in an array can then be done really fast.

Similarly, searching for a value in a BST can also be done really fast because of how the nodes are placed.

**How it works:**

1. Start at the root node.  
2. If this is the value we are looking for, return.  
3. If the value we are looking for is higher, continue searching in the right subtree.  
4. If the value we are looking for is lower, continue searching in the left subtree.  
5. If the subtree we want to search does not exist, depending on the programming language, return `None`, or `NULL`, or something similar, to indicate that the value is not inside the BST.

**Search the Tree for the value "13"**

| def search(node, target):  if node is None:    return None  elif node.data \== target:    return node  elif target \< node.data:    return search(node.left, target)  else:    return search(node.right, target)\# Search for a valueresult \= search(root, 13)if result:  print(f"Found the node with value: {result.data}")else:  print("Value not found in the BST.") |
| :---- |

The time complexity for searching a BST for a value is `O(h)`, where `h` is the height of the tree.

For a BST with most nodes on the right side for example, the height of the tree becomes larger than it needs to be, and the worst case search will take longer. Such trees are called unbalanced.

Both Binary Search Trees above have the same nodes, and in-order traversal of both trees gives us the same result but the height is very different. It takes longer time to search the unbalanced tree above because it is higher.

We will use the next page to describe a type of Binary Tree called AVL Trees. AVL trees are self-balancing, which means that the height of the tree is kept to a minimum so that operations like search, insertion and deletion take less time.

## **Insert a Node in a BST**

Inserting a node in a BST is similar to searching for a value.

**How it works:**

1. Start at the root node.  
2. Compare each node:  
   * Is the value lower? Go left.  
   * Is the value higher? Go right.  
3. Continue to compare nodes with the new value until there is no right or left to compare with. That is where the new node is inserted.

Inserting nodes as described above means that an inserted node will always become a new leaf node.

All nodes in the BST are unique, so in case we find the same value as the one we want to insert, we do nothing.

This is how node insertion in BST can be implemented:

**Inserting a node in a BST:**

| def insert(node, data):  if node is None:    return TreeNode(data)  else:    if data \< node.data:      node.left \= insert(node.left, data)    elif data \> node.data:      node.right \= insert(node.right, data)  return node\# Inserting new value into the BSTinsert(root, 10) |
| :---- |

## **Find The Lowest Value in a BST Subtree**

The next section will explain how we can delete a node in a BST, but to do that we need a function that finds the lowest value in a node's subtree.

**How it works:**

1. Start at the root node of the subtree.  
2. Go left as far as possible.  
3. The node you end up in is the node with the lowest value in that BST subtree.

This is how a function for finding the lowest value in the subtree of a BST node looks like:

Find the lowest value in a BST subtree

| def minValueNode(node):  current \= node  while current.left is not None:    current \= current.left  return current\# Find Lowestprint("\\nLowest value:",minValueNode(root).data) |
| :---- |

[image1]: <data:image/png;base64,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>