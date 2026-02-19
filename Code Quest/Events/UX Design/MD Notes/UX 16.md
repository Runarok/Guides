## 1. Arithmetic in C (Basics)

* Arithmetic in C follows the **same rules as mathematics**.
* Operators:

  * `+` addition
  * `-` subtraction
  * `*` multiplication
  * `/` division
  * `%` modulus
* Key difference from maths:

  * **Result is always stored on the left-hand side**
  * Example: `total = 2 + 3;`

---

## 2. Arithmetic Using Variables

* Operations can be done using:

  * constants
  * variables
  * user input
* Using variables allows **runtime flexibility**.

---

## 3. Increment and Decrement Operators

### Standard form

* `a = a + 1;`
* `a = a - 1;`

### Shorthand form

* `a++` → increment
* `a--` → decrement

---

## 4. Pre-Increment vs Post-Increment

### Pre-increment (`++a`)

* Variable is incremented **before** use.
* Used value is the incremented value.

### Post-increment (`a++`)

* Variable is used **first**, then incremented.

### Risk

* Incorrect usage can cause:

  * infinite loops
  * unreachable code
  * compilation errors

---

## 5. Multiplication and Parentheses

* Multiplication uses `*`
* Parentheses must explicitly include `*`
* Brackets group expressions just like in maths
* C distinguishes:

  * `()` parentheses
  * `{}` braces
  * `[]` brackets

---

## 6. Division and Data Type Accuracy

* Division often produces **fractional results**
* Storing division results in `int`:

  * fractional part is lost
* Correct approach:

  * store division results in `float`
* Integers can be divided and stored in `float`

---

## 7. Logical Operators

* Used for conditional execution
* Operators:

  * `&&` logical AND
  * `||` logical OR
  * `!` logical NOT
* Work exactly like logic gates
* Useful when **multiple conditions** control execution

---

## 8. Assignment Operators

### Simple Assignment

* `a = 10;`

### Compound Assignment

* `a += 10;`
* `a -= 10;`
* `a *= 10;`
* `a /= 10;`
* `a %= 10;`

### Benefits

* Shorter code
* More readable
* Fewer CPU operations
* More efficient in loops and large programs

---

## 9. Performance Implications

* Compound assignments reduce:

  * instruction count
  * assembly code size
* Small changes scale massively in:

  * large codebases
  * tight loops
* Critical in system-level languages like C

---

## 10. Address, Pointer, and Size Operators

### Address-of (`&`)

* Returns memory address of a variable
* Used in `scanf`
* Necessary because arguments are **passed by value**

### Pointer (`*`)

* Used to access value at an address

### Size-of (`sizeof`)

* Returns size (in bytes) of a data type or variable
* Hardware-dependent
* Essential for:

  * dynamic memory allocation
  * portable programs
  * array size calculation

---

## 11. Why `&` Is Required in scanf

* Function arguments are passed **by value**
* Without `&`, input is stored in a copy
* Using `&` ensures:

  * actual variable is modified
  * data persists after function returns

---

## 12. Expressions and Operators

* Every statement contains operators (directly or indirectly)
* Expressions are the **core of computation**
* Incorrect operator use leads to:

  * wrong results
  * hard-to-find bugs

---

## 13. Operator Precedence (BODMAS)

Evaluation order:

1. Parentheses
2. Multiplication / Division / Modulus
3. Addition / Subtraction
4. Assignment

* Same rules as mathematics
* Parentheses override precedence

---

## 14. Associativity

* Determines evaluation order **within the same precedence level**
* Most operators: left to right
* Assignment and ternary: right to left
* Compiler always follows rules — intent is programmer’s responsibility

---

## 15. Quadratic Equation Demo (Concept)

* Uses:

  * arithmetic operators
  * precedence
  * `math.h` for `sqrt`
* Formula:

  * `(-b ± sqrt(b² - 4ac)) / (2a)`
* Error occurs when:

  * discriminant is negative
* Fix requires:

  * condition checking (covered later)

---

## 16. Operator Classification by Operands

* **Unary** → one operand (`a++`)
* **Binary** → two operands (`a + b`)
* **Ternary** → three operands (`condition ? x : y`)
* Helps:

  * debugging
  * correctness checking

---

## 17. Bitwise Operators (Conceptual Importance)

* Operate at **bit level**
* Faster than arithmetic
* Use less power
* Important for:

  * embedded systems
  * battery-powered devices
  * performance-critical code

---

## 18. Complete Evaluation Flow (Mental Model)

1. Parentheses
2. Prefix increment/decrement
3. Postfix increment/decrement
4. Unary operators
5. Cast / address / sizeof
6. Arithmetic (BODMAS)
7. Relational operators
8. Bitwise operators
9. Logical operators
10. Ternary operator
11. Assignment operators
12. Comma operator

---

## 19. Core Things to Remember

* Results are stored on the left
* Data type choice affects accuracy
* Increment operators are powerful but dangerous
* Always respect precedence and associativity
* Use `float` for division results
* Use `&` correctly in input
* Efficient code matters at scale
* Parentheses remove ambiguity — use them

---

