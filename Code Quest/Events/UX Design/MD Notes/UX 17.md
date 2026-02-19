### 1. What “Decision Making” Means in Programming

* Programs don’t always execute linearly.
* Decision making allows a program to **choose different execution paths** based on input or conditions.
* Internally, this is always driven by **boolean evaluations** (true / false).
* Real-world systems (GPS, camera modes, error handling) are just complex versions of the same idea.

---

### 2. Importance of Planning (Flowcharts & Logic)

* As programs grow, logic branches increase rapidly.
* Without planning, code becomes:

  * Hard to follow
  * Error-prone
  * Difficult to debug
* **Flowcharts** help:

  * Visualize control flow
  * Reduce ambiguity
  * Prevent tangled logic, especially with many conditions

---

### 3. Boolean Conditions (Foundation of Decisions)

* Every decision depends on a condition that evaluates to **true or false**.
* Comparison operators:

  * `==`, `!=`, `<`, `>`, `<=`, `>=`
* These comparisons are **absolute**, not partial.
* Logical operators allow combining conditions:

  * `&&` (AND)
  * `||` (OR)
  * `!` (NOT)
* Operator precedence applies — grouping matters.

---

### 4. `if` Statement

* Executes code **only when a condition is true**.
* If the condition is false, execution continues normally.
* Curly braces `{}` are optional for single statements, but recommended for clarity.
* Common mistake:

  * Using `=` instead of `==` (assignment vs comparison)

---

### 5. `if–else` Statement

* Provides **two mutually exclusive execution paths**:

  * One for true
  * One for false
* Helps remove ambiguity by explicitly handling both outcomes.
* Improves readability and predictability.

---

### 6. `else if` Ladder

* Used when **multiple mutually exclusive conditions** exist.
* Conditions are evaluated **top to bottom**.
* Once a condition is satisfied:

  * Remaining `else if` and `else` blocks are skipped.
* Best for:

  * Range-based checks (e.g., grading systems)
* If the ladder grows too long, consider `switch`.

---

### 7. Nested `if` Statements

* An `if` inside another `if` or `else`.
* Creates **hierarchical decision logic**.
* More powerful, but:

  * Easier to lose track of scope
  * Can lead to deeply nested, unreadable code
* Use carefully and consistently format your code.

---

### 8. `switch` Statement

* Used when selecting **one path from many discrete options**.
* Works like a multi-branch selection tree.
* Rules:

  * Expression must evaluate to **int or char**
  * `case` labels must be **constant values**
  * No duplicate cases
* `break` is essential:

  * Without it, execution “falls through” to the next cases
* `default` handles unexpected values and ensures safe exit.

---

### 9. When to Use `switch` vs `if–else`

* Use `switch` when:

  * Comparing a single variable against fixed values
  * Logic is menu-like (e.g., USSD menus)
* Use `if–else` when:

  * Conditions involve ranges
  * Complex logical expressions are needed

---

### 10. Conditional (Ternary) Operator `?:`

* Compact alternative to simple `if–else`.
* Syntax:

  ```
  condition ? value_if_true : value_if_false
  ```
* Useful for:

  * Simple assignments
  * Short, readable decisions
* Limitations:

  * Becomes unreadable when nested
  * Not suitable for complex logic
* Both outcomes must be of the **same type**.

---

### 11. `goto` Statement

* Transfers control unconditionally to a labeled section.
* Strongly discouraged because it:

  * Breaks logical flow
  * Creates “spaghetti code”
  * Makes debugging difficult
* Not a true decision structure on its own.
* Should be avoided in structured programming.

---

### 12. General Best Practices

* Always prioritize **readability over cleverness**.
* Avoid deeply nested logic where simpler structures exist.
* Use:

  * `if` for conditional execution
  * `if–else` for binary decisions
  * `else if` for ordered conditions
  * `switch` for discrete selections
  * ternary operator for simple assignments only
* Plan before coding when logic becomes non-trivial.

---

