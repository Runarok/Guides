# 1. Problem Formulation in Computer Science

## Why problem formulation matters

* Before writing code, you must know **why** the program exists
* Prevents:

  * Missing requirements
  * Incomplete solutions
  * Poor design decisions

### Problem formulation

* Translating a **real-world need** into a **computationally solvable form**
* The programmer’s responsibility is to:

  * Clarify ambiguity
  * Identify constraints
  * Define goals precisely

---

# 2. What Is a Computing Problem?

* In computer science, a **problem** is:

  * A task or a set of related tasks
  * That may be solvable by a computer

### Key requirement

* Problems must be **explicitly stated**
* Computers cannot handle:

  * Vague questions
  * Emotional concepts
  * Ambiguous goals
    (e.g., “What is joy?”)

---

# 3. Thinking Computationally

A computer scientist must:

* Break problems into smaller parts
* Identify what **can** and **cannot** be computed
* Decide if a problem is:

  * Solvable
  * Partially solvable
  * Unsolvable

---

# 4. Five Main Types of Computational Problems

## 4.1 Decision Problems

* Output is **YES or NO**
* Tests whether a property holds

### Example

* Is `X + Y = Z`?

### Properties

* Closely related to function problems
* Problems can be:

  * **Decidable**
  * **Partially decidable**
  * **Undecidable**

Undecidable problems may **run forever** without producing an answer.

---

## 4.2 Search Problems

* Goal: **find a solution**, not just confirm existence
* Always associated with a decision problem

### Defined by:

* Set of states
* Start state
* Goal state
* Successor function
* Goal test function

### Example

* Searching for a number in a list

Search problems:

* Answer **where / how**
* Not just **whether**

---

## 4.3 Counting Problems

* Goal: **count the number of valid solutions**

### Example

* Number of perfect matchings in a graph

### Challenges

* Brute-force search becomes impractical
* Requires clever algorithms
  (e.g., Edmonds’ algorithm)

---

## 4.4 Optimization Problems

* Goal: find the **best solution**
* “Best” = **minimum cost / weight / time / distance**

### Weight

* Represents resource usage

### Examples

* Route planning (maps)
* Airline scheduling
* **Dijkstra's shortest path**

### Types

* Continuous optimization
* Discrete optimization

---

## 4.5 Function Problems

* Every input has a corresponding output
* Output is **not just YES/NO**

### Example

* Mathematical functions (x / y)

### Relationship

* Every function problem → decision problem
* Decision problem = graph of the function

---

# 5. General Characteristics of Computational Problems

* Defined by:

  * A **task**
  * A set of **input instances**
* Same task, different inputs
* Example:

  * Addition is always the same process
  * Only numbers change

---

# 6. Tractable vs Intractable Problems

## Tractable Problems

* Solvable:

  * Algorithmically
  * In **reasonable (polynomial) time**

## Intractable Problems

* Solvable only with:

  * Exponential or worse time complexity
* Impractical for large inputs

### Examples

* Traveling Salesman Problem (TSP)
* School timetabling

---

## Traveling Salesman Problem (TSP)

* Find shortest route visiting all cities once
* Cost = distance + time + resources

### Reality

* Exact solutions possible only for limited sizes
* Record (2006): ~85,900 cities

### Real-world use

* PCB drilling paths
* Manufacturing optimization

---

# 7. Approximate & Heuristic Solutions

## Suboptimal Solutions

* Not perfect
* Good enough
* Solvable in reasonable time

## Heuristic Algorithms

* Use:

  * Experience
  * Rules of thumb
  * Judgment
* Avoid exhaustive search

### Example

* Always pick cheapest next route (greedy approach)

---

# 8. Polynomial Time vs Exponential Time

* **Polynomial time (P)**:

  * Considered “fast”
  * Scales reasonably with input size

* **Exponential time**:

  * Grows too quickly
  * Becomes unusable

---

# 9. Unsolvable / Undecidable Problems

## Definition

* No algorithm can solve the problem for all inputs

### Famous example

* **Halting Problem**

### Question

> Given a program and input, can we know if it will halt or run forever without running it?

### Result

* Proven undecidable by **Alan Turing**

---

# 10. Mathematics and Computer Science

## Why math is essential

* Computer science is built on:

  * Set theory
  * Graph theory
  * Probability
  * Number theory

### Mathematics as a language

* Precise
* Unambiguous
* Universal

Computer science is often considered a **subset of mathematical sciences**.

---

# 11. Mathematical Modeling

## Definition

* Translating real-world problems into mathematical form
* Enables:

  * Prediction
  * Simulation
  * Optimization

### Benefits

* Reveals hidden relationships
* Allows controlled experimentation

---

## Types of Models

### Mechanistic Models

* Based on physical laws
* Detailed, theory-heavy

### Empirical Models

* Based on observed data
* Respond to changing conditions

### Stochastic Models

* Probabilistic
* Predict distributions

### Deterministic Models

* Same input → same output always

---

# 12. Dining Philosophers Problem

* Classic synchronization problem
* Models:

  * Resource sharing
  * Deadlock prevention

### Real-world analogy

* **Multithreading**
* CPU time sharing
* Device access coordination

---

# 13. Writing Problems Clearly

A well-formulated problem must be:

1. **Precise** (unambiguous)
2. Have a **clear initial state**
3. Have a **clear goal state**
4. Define **rules & constraints**
5. Include **all components**

---

## Example: Water Jug Problem

* Jugs: 4L and 3L
* Goal: exactly 2L in 4L jug
* No measuring markers
* Clearly defined states & rules

---

# 14. Final Takeaways

* Not all problems are computable
* Not all solvable problems are practical
* Problem formulation determines:

  * Algorithm choice
  * Feasibility
  * Performance
* Mathematics provides the structure
* Heuristics make the impossible workable

---
