## 1. Repetition in Programming — Core Idea

* Repetition allows a program to execute the same block of code multiple times.
* Computers excel at repetition because they execute instructions consistently.
* Repetition is implemented using:

  1. `while` / `do–while` loops
  2. `for` loops
  3. Recursion

---

## 2. While Loop

### 2.1 Concept

* Repeats a block of code as long as a condition remains true.
* Condition is checked **before** each iteration.
* May execute zero or more times.

### 2.2 Key Characteristics

* Controlled by a boolean condition.
* Uses a control variable.
* Control variable must be modified inside the loop.

### 2.3 Execution Flow

1. Evaluate condition
2. If true → execute loop body
3. Modify control variable
4. Re-evaluate condition
5. Exit when condition becomes false

### 2.4 Common Uses

* Unknown number of iterations
* Input validation
* Event-driven repetition

---

## 3. Do–While Loop

### 3.1 Concept

* Executes the loop body first, then evaluates the condition.
* Guaranteed to run at least once.

### 3.2 Difference from While Loop

* `while`: entry-controlled loop
* `do–while`: exit-controlled loop

### 3.3 When to Use

* When the condition depends on user input
* When the condition must be established after execution

---

## 4. Common Loop Errors

### 4.1 Unreachable Loop

* Condition is never true.
* Loop body never executes.

### 4.2 Infinite Loop

* Condition never becomes false.
* Caused by:

  * Incorrect update of control variable
  * Missing update

### 4.3 Uninitialized Control Variables

* Causes unpredictable behavior.
* Code may compile but behave inconsistently.

### 4.4 Rules to Remember

* Condition must be satisfiable.
* Condition must eventually become false.
* Control variables must be initialized.
* Condition must clearly define continuation and termination.

---

## 5. For Loop

### 5.1 Concept

* Used when the number of iterations is known in advance.
* Combines initialization, condition, and update in one statement.

### 5.2 Execution Order

1. Initialization (once)
2. Condition check
3. Execute loop body
4. Increment/decrement
5. Repeat condition check

### 5.3 Advantages

* Cleaner and more readable
* Lower risk of infinite loops
* Ideal for counting and traversal

### 5.4 Typical Use Cases

* Fixed iteration counts
* Array traversal
* Multiplication tables

---

## 6. While vs For Loop

| Aspect          | While Loop         | For Loop             |
| --------------- | ------------------ | -------------------- |
| Iteration count | Unknown            | Known                |
| Control clarity | Distributed        | Centralized          |
| Error risk      | Higher             | Lower                |
| Best use        | Input-driven logic | Counting / traversal |

---

## 7. Recursion

### 7.1 Concept

* A function calls itself to solve a problem.
* Each call works on a smaller version of the problem.

### 7.2 Essential Components

1. Base Case

   * Stops recursion
   * Solved without further recursive calls
2. Recursive Case

   * Reduces problem size
   * Moves toward base case

### 7.3 Execution Behavior

* Function calls stack until base case is reached.
* Results are resolved in reverse order.

---

## 8. Example: Factorial

* Recursive definition:

  * `n! = 1` if `n = 0` (base case)
  * `n! = n × (n−1)!` if `n > 0` (recursive case)
* Demonstrates problem reduction and backtracking.

---

## 9. Applications of Recursion

* Mathematical computations
* Divide-and-conquer algorithms (e.g., merge sort)
* Data structures (linked lists, trees)
* Artificial intelligence problems
* Computer graphics (fractals)
* Classical puzzles (Towers of Hanoi)

---

## 10. Limitations of Recursion

* High memory usage due to call stack
* Slower than iteration in many cases
* Repeated computation of the same subproblems

---

## 11. Fibonacci and Algorithmic Complexity

* Naive recursive Fibonacci recalculates values repeatedly.
* Time complexity grows exponentially.
* Performance degrades rapidly for large inputs.
* Highlights why recursion must be used carefully.

---

## 12. Design Rules for Recursion

1. Always define a base case.
2. Each recursive call must move closer to the base case.
3. Assume recursive calls work correctly (inductive reasoning).
4. Avoid duplicate computation.

---

## 13. Final Takeaways

* Use **while loops** for unpredictable repetition.
* Use **do–while loops** when execution must occur at least once.
* Use **for loops** when iteration count is known.
* Always initialize and update control variables.
* Infinite loops are valid only when intentional.
* Recursion is powerful but costly — use it deliberately.
* Prefer iteration when performance is critical.
* Clear termination logic matters more than syntax.

---
