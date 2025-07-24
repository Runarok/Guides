# Algorithms Programs (Day 7 & Beyond)

---

## 📚 **Further Learning – Recommended Course**

- [Harvard CS50X](https://pll.harvard.edu/course/cs50-introduction-computer-science): Free, comprehensive, covers algorithms, data structures, and more.
- [CS50 2023 YouTube Lecture 4: Algorithms](https://www.youtube.com/watch?v=LfaMVlDaQ24): Algorithms explained with real-world context.
- [Download Chernobyl Dataset](https://www.kaggle.com/datasets/lsind18/chernobyl-data-air-concentration)

---

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

## 📝 **Solve the Following Real Interview Questions**

---

### **Google | 2022 | Round 2 (Technical)**
**Q1.**  
Given a large list of 1 million integers (some repeated), design and implement a sorting function that is memory-efficient and fast.

---

### **Amazon | 2023 | Online Assessment**
**Q2.**  
You are given a list of product prices. Implement Quick Sort to sort them in ascending order.  
Also, print the list after each partition step.

---

### **Microsoft | 2021 | Technical Phone Screen**
**Q3.**  
Sort a list of employee records (name and ID) by name using Insertion Sort.  
If names are equal, use ID as a tie-breaker.

---

### **TCS Digital | 2023 | Coding Round**
**Q4.**  
Write a program to sort N integers using Bubble Sort and count the number of swaps.  
Print the sorted list and swap count.

---

### **Infosys | 2022 | System Engineer Role**
**Q5.**  
Write a function that sorts an array using Selection Sort.  
Print the index of the minimum value found in each iteration.

---

### **Capgemini | 2021 | Tech Round**
**Q6.**  
Implement Merge Sort to sort a list of floating-point numbers.  
Return how many total recursive calls were made.

---

### **Zoho | 2020 | Onsite Coding Round**
**Q7.**  
Given a list of student marks, sort them in descending order using Quick Sort.  
Also, calculate the median of the sorted list.

---

### **Accenture | 2023 | Final Round**
**Q8.**  
Using Counting Sort, sort a list of 0–99 scores and find the most frequently occurring score.  
Return the sorted list and the mode.

---

### **IBM | 2022 | Coding Round**
**Q9.**  
Implement Radix Sort on a list of 6-digit zip codes.  
Print the list after sorting by each digit place.

---

### **Wipro | 2023 | Campus Placement**
**Q10.**  
You’re given a string of lowercase words. Sort them alphabetically using Selection Sort.  
Don’t use Python's built-in `sort()` or `sorted()` functions.

---

# Graph Algorithms

A **graph** is a non-linear data structure made of:

- **Vertices (nodes)**
- **Edges (connections)**

Graphs are used to represent complex relationships (e.g., social networks, GPS maps, computer networks).

---

## Adjacency List (Efficient for Sparse Graphs)

```python
from collections import defaultdict

class GraphAL:
    def __init__(self): 
        self.adj = defaultdict(list)

    def add_edge(self, u, v, directed=False):
        self.adj[u].append(v)
        if not directed:
            self.adj[v].append(u)

    def __str__(self):
        return "\n".join(f"{u}: {nbrs}" for u, nbrs in self.adj.items())

# Example
g = GraphAL()
g.add_edge(0, 1)
g.add_edge(0, 2)
g.add_edge(1, 2)
print(g)
```

---

## Adjacency Matrix (Good for Dense Graphs)

```python
class GraphAM:
    def __init__(self, V):
        self.V = V
        self.M = [[0]*V for _ in range(V)]

    def add_edge(self, u, v, directed=False):
        self.M[u][v] = 1
        if not directed:
            self.M[v][u] = 1

    def has_edge(self, u, v):
        return bool(self.M[u][v])

# Example
g2 = GraphAM(3)
g2.add_edge(0,1)
g2.add_edge(0,2)
g2.add_edge(1,2)
print(g2.M)
```

---

## Incidence Matrix (Rarely Used)

```python
class GraphIncidence:
    def __init__(self, V, E):
        self.mat = [[0]*E for _ in range(V)]

    def add_edge(self, u, v, idx):
        self.mat[u][idx] = 1
        self.mat[v][idx] = 1

# Example
g3 = GraphIncidence(3, 3)
g3.add_edge(0,1,0)
g3.add_edge(1,2,1)
g3.add_edge(2,0,2)
print(g3.mat)
```

---

## Breadth First Search (BFS) for a Graph

**BFS** explores all neighbors at the current depth before moving to the next level.

```python
from collections import deque, defaultdict

def bfs(graph, start):
    visited = set([start])
    queue = deque([start])
    order = []

    while queue:
        u = queue.popleft()
        order.append(u)
        for w in graph[u]:
            if w not in visited:
                visited.add(w)
                queue.append(w)
    return order

# Example:
#   0
#  / \
# 1   2
#     |
#     3

graph = defaultdict(list)
edges = [(0,1),(0,2),(2,3)]
for u, v in edges:
    graph[u].append(v)
    graph[v].append(u)  # comment out for directed

print(bfs(graph, 0))  # Output: [0, 1, 2, 3]
```

---

## Depth-First Search (DFS)

**DFS** explores as far as possible along each branch before backtracking.

```python
from collections import defaultdict

def dfs(graph, node, visited):
    if node not in visited:
        print(node, end=" ")
        visited.add(node)
        for neighbor in graph[node]:
            dfs(graph, neighbor, visited)

# Example
graph = defaultdict(list)
edges = [(0, 1), (0, 2), (1, 3), (1, 4), (2, 5)]
for u, v in edges:
    graph[u].append(v)
    graph[v].append(u)

visited = set()
dfs(graph, 0, visited)
```

---

## Rotten Oranges (Minimum Time – BFS Grid Example)

Given a grid (matrix) where:

- 0: empty cell
- 1: fresh orange
- 2: rotten orange

Find the **minimum time** required so all oranges rot. If not possible, return -1.

```python
from collections import deque

# Step 1: Hardcoded matrix
matrix = [
    [0, 1, 0, 1],
    [1, 2, 1, 1],
    [1, 1, 1, 0],
    [1, 0, 1, 1],
    [1, 1, 1, 1]
]

print("Input Matrix:")
for row in matrix:
    print(row)

rows = len(matrix)
cols = len(matrix[0])
fresh = 0
queue = deque()  # Store (row, col, time)

for r in range(rows):
    for c in range(cols):
        if matrix[r][c] == 2:
            queue.append((r, c, 0))
        elif matrix[r][c] == 1:
            fresh += 1

directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
time_taken = 0

while queue:
    r, c, t = queue.popleft()
    time_taken = max(time_taken, t)

    for dr, dc in directions:
        nr, nc = r + dr, c + dc
        if 0 <= nr < rows and 0 <= nc < cols and matrix[nr][nc] == 1:
            matrix[nr][nc] = 2  # Rot the orange
            fresh -= 1
            queue.append((nr, nc, t + 1))

print("\nFinal Matrix:")
for row in matrix:
    print(row)

if fresh == 0:
    print(f"\nAll oranges rotted in {time_taken} minutes.")
else:
    print("\nSome fresh oranges could not be rotted. Result: -1")
```

---

## Water Jug Problem Using BFS

Given jug sizes `m` and `n`, and target `d`, find **minimum operations** to measure `d` liters.

Allowed:
- Fill any jug
- Empty any jug
- Pour water from one jug to another

**Example:**  
m = 3, n = 5, d = 4  
Output: 6

**Example:**  
m = 8, n = 56, d = 46  
Output: -1

---

## Dijkstra's Algorithm (Shortest Path)

Given weighted undirected graph (edge list), find shortest paths from `src` to all others.

```python
import heapq

def dijkstra(V, edges, src):
    adj = [[] for _ in range(V)]
    for u, v, w in edges:
        adj[u].append((v, w))
        adj[v].append((u, w))

    dist = [float('inf')] * V
    dist[src] = 0
    pq = [(0, src)]

    while pq:
        d, u = heapq.heappop(pq)
        for v, w in adj[u]:
            if dist[v] > d + w:
                dist[v] = d + w
                heapq.heappush(pq, (dist[v], v))
    return dist

V = 5
edges = [[0, 1, 4], [0, 2, 8], [1, 4, 6], [2, 3, 2], [3, 4, 10]]
print(dijkstra(V, edges, 0))
```

---

## Dynamic Programming (DP)

- DP is an optimization over plain recursion.
- Store results of subproblems to avoid repeated computation.
- Usually transforms exponential time to polynomial time.

---

## Bellman–Ford Algorithm

Find shortest paths from `src` in a weighted graph, even with negative weights. Detects negative cycles.

```python
def bellman_ford(V, edges, src):
    dist = [float('inf')] * V
    dist[src] = 0

    for i in range(V - 1):
        for u, v, wt in edges:
            if dist[u] + wt < dist[v]:
                dist[v] = dist[u] + wt

    # Negative cycle check
    for u, v, wt in edges:
        if dist[u] + wt < dist[v]:
            return [-1]  # Negative cycle

    return dist

# Example graph with 5 vertices
V = 5
edges = [
    [0, 1, 6],
    [0, 2, 7],
    [1, 2, 8],
    [1, 3, 5],
    [1, 4, -4],
    [2, 3, -3],
    [2, 4, 9],
    [3, 1, -2],
    [4, 3, 7]
]

src = 0
print(bellman_ford(V, edges, src))
```

---

## Greedy Algorithms

- Make locally optimal decisions at each step.
- Not always globally optimal (e.g., coin change, 0/1 knapsack).

---

### Fractional Knapsack Problem

Given `val[]` (values), `wt[]` (weights), and `capacity`, maximize value. Can take fractions.

```python
def fractional_knapsack(val, wt, capacity):
    items = sorted(zip(val, wt), key=lambda x: x[0]/x[1], reverse=True)
    total = 0

    for v, w in items:
        if capacity >= w:
            total += v
            capacity -= w
        else:
            total += v * (capacity / w)
            break

    return total

# Example
val = [60, 100, 120]
wt = [10, 20, 30]
capacity = 50

print(fractional_knapsack(val, wt, capacity))
```

---