# 1. What an Algorithm Really Is

### Core idea

An **algorithm** is a **finite, step-by-step procedure** for solving a **well-specified problem**.

Key words that matter:

* **Finite** → must terminate
* **Step-by-step** → clarity and determinism
* **Well-specified** → no ambiguity

If the problem is vague, no algorithm—no matter how clever—can save you.

---

# 2. Why Studying Algorithms Matters (Even Today)

Even if:

* Computers were infinitely fast
* Memory was unlimited

We would **still** study algorithms because we must prove that a solution:

1. Exists
2. Is correct
3. Terminates
4. Is optimal

In the real world:

* Hardware **is limited**
* Users are **impatient**
* Efficiency **directly affects business**

> 88% of users abandon slow apps — optimization is not optional.

---

# 3. Algorithms vs Code (Critical Distinction)

| Algorithms              | Code                    |
| ----------------------- | ----------------------- |
| Logic                   | Implementation          |
| Language-independent    | Language-specific       |
| Focuses on *what & how* | Focuses on *syntax*     |
| Enduring                | Changes with technology |

Good developers write **code**.
Great developers design **algorithms**.

---

# 4. Structure of an Algorithm

Every algorithm has **three parts**:

### 1. Input

* Data the algorithm operates on

### 2. Process

* Ordered steps applied to input

### 3. Output

* Result produced by the process

If any of these are unclear, the algorithm is flawed.

---

# 5. Why Efficiency Is Everything

Two algorithms can:

* Solve the **same problem**
* Produce the **same output**
* But differ wildly in performance

Efficiency determines:

* Speed
* Scalability
* User experience
* Cost

This is where **algorithm complexity** enters.

---

# 6. Algorithm Complexity (Plain English)

**Algorithm complexity** estimates:

> How the number of steps grows as input size grows

We care about:

* **Growth rate**, not exact step count
* Behavior as input becomes large

Why?

* Hardware differs
* Platforms differ
* Growth trends don’t

---

# 7. Big-O Notation (The Language of Efficiency)

### What Big-O does

* Describes **upper bound** of growth
* Ignores constants and low-order terms
* Allows fair comparison across machines

### Why constants are dropped

* `O(2n)` and `O(100n)` grow the same way
* Growth rate matters more than exact counts

---

# 8. Major Time Complexities (Fast → Slow)

## 1. **O(1) — Constant Time**

* Same number of steps, always

Example:

* Accessing an array element by index

Best possible performance.

---

## 2. **O(log n) — Logarithmic Time**

* Input size is repeatedly halved

Example:

* Binary search

Extremely efficient and scalable.

---

## 3. **O(n) — Linear Time**

* Steps grow directly with input size

Example:

* Simple loop over a list

Acceptable for moderate data sizes.

---

## 4. **O(n log n) — Linearithmic Time**

* Common in efficient sorting algorithms

Example:

* Merge sort, quicksort (average case)

Often the **best practical balance**.

---

## 5. **O(n²) — Quadratic Time**

* Nested loops over input

Example:

* Bubble sort

Becomes slow very quickly as input grows.

---

## 6. **O(2ⁿ) / O(n!) — Exponential / Factorial Time**

* Growth explodes

Example:

* Brute-force Traveling Salesman Problem

Impractical beyond small inputs.

---

# 9. Why This Classification Matters

Imagine:

* 1,000 inputs

| Complexity | Approx. Steps |
| ---------- | ------------- |
| O(1)       | 1             |
| O(log n)   | ~10           |
| O(n)       | 1,000         |
| O(n log n) | ~10,000       |
| O(n²)      | 1,000,000     |
| O(2ⁿ)      | Impossible    |

Same problem. Vastly different realities.

---

# 10. Algorithm Design Is a Skill

Designing algorithms means:

* Choosing the right strategy
* Balancing time vs memory
* Thinking beyond “it works”

That’s why:

* Algorithms separate engineers from coders
* Optimization expertise is highly paid
* Interview processes obsess over it

---

# 11. Final Mental Model

Think of algorithms as:

* **Blueprints of logic**
* **Contracts of correctness**
* **Engines of performance**

Code is just the vehicle.

---
