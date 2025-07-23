# Algorithms Programs use the Day 7 last program as base

Course to Consider after Training   
[CS50X](https://pll.harvard.edu/course/cs50-introduction-computer-science) Harvard  
It's free do check it out covers all I covered and more….

[CS50 2023](https://www.youtube.com/watch?v=LfaMVlDaQ24) Lecture check out Lecture 4 Algorithms

[Download Dataset](https://www.kaggle.com/datasets/lsind18/chernobyl-data-air-concentration)

| import csvdef main():    with open('data/CHERNAIR.csv', 'r') as file:        reader \= csv.reader(file)        data \= list(reader)    if data:        print("First row of the CSV file:")        print(data\[0\])    else:        print("CSV file is empty.")if \_\_name\_\_ \== "\_\_main\_\_":    main() |
| :---- |

Here's the same content **formatted cleanly for pasting into Google Docs**, using proper headings, indentation, and list formatting:

---

Solve the following questions:

**Google | 2022 | Round 2 (Technical)**

**Q1.**  
 Given a large list of 1 million integers, some repeated, design and implement a sorting function that is memory-efficient and fast.

**Amazon | 2023 | Online Assessment Round**

**Q2.**  
 You are given a list of product prices. Implement Quick Sort to sort them in ascending order.  
 Also, print the list after each partition step.

#### **Microsoft | 2021 | Technical Phone Screen**

**Q3.**  
 Sort a list of employee records (name and ID) by name using Insertion Sort.  
 If names are equal, use ID as a tie-breaker.

#### **TCS Digital | 2023 | Coding Round**

**Q4.**  
 Write a program to sort N integers using Bubble Sort and count the number of swaps done.  
 Print the sorted list and swap count.

#### **Infosys | 2022 | System Engineer Role**

**Q5.**  
 Write a function that sorts an array using Selection Sort.  
 Print the index of the minimum value found in each iteration.

#### **Capgemini | 2021 | Tech Round**

**Q6.**  
 Implement Merge Sort to sort a list of floating-point numbers.  
 Also return how many total recursive calls were made.

#### **Zoho | 2020 | Onsite Coding Round**

**Q7.**  
 Given a list of student marks, sort them in descending order using Quick Sort.  
 Also, calculate the median of the sorted list.

#### **Accenture | 2023 | Final Round**

**Q8.**  
 Using Counting Sort, sort a list of 0–99 scores and find the most frequently occurring score.  
 Return the sorted list and the mode.

#### **IBM | 2022 | Coding Round**

**Q9.**  
 Implement Radix Sort on a list of 6-digit zip codes.  
 Print the list after sorting by each digit place.

#### **Wipro | 2023 | Campus Placement (Round 1\)**

**Q10.**  
 You’re given a string of lowercase words. Sort them alphabetically using Selection Sort.  
 Don’t use Python's built-in `sort()` or `sorted()` functions.

# 

# Graph Algorithms

Graph is a non-linear data structure like tree data structure. The limitation of tree is, it can only represent hierarchical data. For situations where nodes or vertices are randomly connected with each other other, we use Graph. Example situations where we use graph data structure are, a social network, a computer network, a network of locations used in GPS and many more examples where different nodes or vertices are connected without any hierarchic or constraint on structure.

A **graph** is a non-linear data structure composed of:

* **Vertices (V)**: the nodes.

* **Edges (E)**: the connections between nodes.

Graphs model complex, non-hierarchical networks—like social networks, GPS maps, or computer networks—unlike trees which are strictly hierarchical

## **Adjacency List**

Efficient for **sparse graphs**. Stores, for each vertex, a list of its neighbouring vertices.

from collections import defaultdict

| class GraphAL:    def \_\_init\_\_(self):         self.adj \= defaultdict(list)    def add\_edge(self, u, v, directed=False):        self.adj\[u\].append(v)        if not directed:            self.adj\[v\].append(u)    def \_\_str\_\_(self):        return "\\n".join(f"{u}: {nbrs}" for u, nbrs in self.adj.items())\# Exampleg \= GraphAL()g.add\_edge(0, 1)g.add\_edge(0, 2)g.add\_edge(1, 2)print(g) |
| :---- |

## **Adjacency Matrix**

Good for **dense graphs**. Uses a V×V matrix `M` where `M[u][v] = 1` if an edge exists.

class GraphAM:

|     def \_\_init\_\_(self, V):        self.V \= V        self.M \= \[\[0\]\*V for \_ in range(V)\]    def add\_edge(self, u, v, directed=False):        self.M\[u\]\[v\] \= 1        if not directed:            self.M\[v\]\[u\] \= 1    def has\_edge(self, u, v):        return bool(self.M\[u\]\[v\])\# Exampleg2 \= GraphAM(3)g2.add\_edge(0,1)g2.add\_edge(0,2)g2.add\_edge(1,2)print(g2.M) |
| :---- |

## **Incidence Matrix**

Less common. Uses a V×E matrix where rows \= vertices, columns \= edges:

| class GraphIncidence:    def \_\_init\_\_(self, V, E):        self.mat \= \[\[0\]\*E for \_ in range(V)\]    def add\_edge(self, u, v, idx):        self.mat\[u\]\[idx\] \= 1        self.mat\[v\]\[idx\] \= 1\# Exampleg3 \= GraphIncidence(3, 3)g3.add\_edge(0,1,0)g3.add\_edge(1,2,1)g3.add\_edge(2,0,2)print(g3.mat) |
| :---- |

## Breadth First Search or BFS for a Graph

Given a **undirected graph** represented by an adjacency list **`adj`**, where each `adj[i]` represents the list of vertices connected to vertex `i`. Perform a **Breadth First Search (BFS)** traversal starting from vertex `0`, visiting vertices from left to right according to the adjacency list, and return a list containing the BFS traversal of the graph.

## **BFS Algorithm (Pseudocode)**

1. Mark start node as **visited**, enqueue it.

2. While the queue isn’t empty:

   * Dequeue node `u`

   * For each neighbor `w` of `u`:

     * If `w` isn’t visited, mark **visited**, enqueue `w`

3. Continue until all reachable nodes are processed 

**Time Complexity:** O(V + E)  
**Space Complexity:** O(V) for queue \+ visited set 

| from collections import deque, defaultdictdef bfs(graph, start):    visited \= set(\[start\])    queue \= deque(\[start\])    order \= \[\]    while queue:        u \= queue.popleft()        order.append(u)        for w in graph\[u\]:            if w not in visited:                visited.add(w)                queue.append(w)    return order\# 📌 Example graph\#   0\#  / \\\# 1   2\#     |\#     3graph \= defaultdict(list)edges \= \[(0,1),(0,2),(2,3)\]for u, v in edges:    graph\[u\].append(v)    graph\[v\].append(u)  \# comment out for directedprint(bfs(graph, 0))  \# Output: \[0, 1, 2, 3\] |
| :---- |

## Depth-First Search (DFS)

DFS is a graph traversal technique that explores as far as possible along each branch before backtracking. It uses recursion (or a stack) and dives deep into one neighbor before trying others.

| from collections import defaultdictdef dfs(graph, node, visited):    if node not in visited:        print(node, end=" ")        visited.add(node)        for neighbor in graph\[node\]:            dfs(graph, neighbor, visited)\# Example graphgraph \= defaultdict(list)edges \= \[(0, 1), (0, 2), (1, 3), (1, 4), (2, 5)\]for u, v in edges:    graph\[u\].append(v)    graph\[v\].append(u)visited \= set()dfs(graph, 0, visited) |
| :---- |

## Rotten Oranges (Minimum Time)

Given a matrix of dimension **mxn**, where each cell in the matrix can have values **0, 1 or 2** which has the following meaning:  

* 0: Empty cell  
* 1: Cells have fresh oranges  
* 2: Cells have rotten oranges

The task is to find the minimum time required so that all the oranges become rotten. A rotten orange at index **(i,j)** can rot other fresh oranges which are its neighbors **(up, down, left, and right)**.

**Note :** If it is impossible to rot every orange then simply return **\-1**.

