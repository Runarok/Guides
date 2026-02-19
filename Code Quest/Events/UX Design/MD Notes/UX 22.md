## 1. What a Structure Is

* A **structure (`struct`)** is a **composite data type** in C.
* It groups **different data types** under one name.
* Members are stored in **contiguous memory**.
* Represents a **record** (related fields grouped together).
* Access members using the **dot (`.`) operator**.
* Structure variables:

  * can be passed to functions
  * can be returned from functions
  * behave like ordinary variables

---

## 2. Structures vs Arrays

* **Arrays**

  * Store multiple values of the **same type**
* **Structures**

  * Store multiple values of **different types**
* Both use contiguous memory
* Arrays model collections
* Structures model **real-world records**

---

## 3. Structure Memory Behavior

* Memory allocated = sum of sizes of all members (plus padding)
* All members exist **at the same time**
* Each member has its own address
* Efficient for representing grouped data like:

  * student records
  * employee details
  * sensor data

---

## 4. Accessing Structure Members

* Use dot notation:

  * `variable.member`
* If accessed via pointer:

  * `pointer->member`
* Each member behaves like an independent variable

---

## 5. Passing Structures to Functions

* Can be passed:

  * by value (copy)
  * by reference (pointer)
* Passing by reference is preferred for:

  * performance
  * large structures
* Supports comparisons and assignments

---

## 6. What a Union Is

* A **union** is a composite data type similar to a structure.
* All members share the **same memory location**.
* Only **one member is valid at a time**.
* Size of a union = size of its **largest member**.

---

## 7. Structures vs Unions (Key Difference)

* **Structure**

  * All members exist simultaneously
  * More memory usage
* **Union**

  * Members overwrite each other
  * Memory-efficient
* Use unions when a value can take **only one form at a time**

---

## 8. Why Use Unions

* Save memory
* Ideal when:

  * data can be multiple types, but never simultaneously
* Common in:

  * embedded systems
  * low-level programming
  * protocol parsing

---

## 9. Type Casting (Concept)

* **Type casting** converts one data type into another.
* Ensures operations are performed correctly.
* Prevents unnecessary memory usage.
* Required when data types are **not naturally compatible**.

---

## 10. Type Promotion and Demotion

* **Promotion**

  * Smaller type → larger type
  * Safe (no data loss)
* **Demotion**

  * Larger type → smaller type
  * Risk of data loss
* Compiler follows a **data type hierarchy**

---

## 11. Explicit Type Casting

* Done **manually** by the programmer.
* Syntax:

  * `(type) expression`
* Used when:

  * demotion is required
  * precision loss is acceptable
* Fractional parts are discarded when casting to `int`

---

## 12. Correct Rounding Using Type Casting

* Add `0.5` **before casting** to `int`
* Parentheses are critical
* Prevents incorrect truncation
* Operator precedence matters

---

## 13. Implicit Type Conversion

* Done **automatically** by the compiler.
* Happens when:

  * data types are compatible
* Lower types are promoted to higher types
* No casting operator needed
* Occurs during compilation

---

## 14. Rules of Implicit Conversion

* `char` and `short` → `int`
* Float hierarchy applies:

  * `long double` > `double` > `float`
* Signed vs unsigned handled carefully
* Final result is converted to:

  * type of the left-hand side variable

---

## 15. When Implicit Conversion Is Blocked

* If conversion may cause data loss:

  * compiler issues a warning
* Programmer must use **explicit casting**
* Protects accuracy by default

---

## 16. Built-in Type Conversion Functions

* Provided via `stdlib.h`
* Mainly used for **string ↔ numeric** conversion

---

## 17. String to Number Functions

* `atof()` → string to `double`
* `atoi()` → string to `int`
* `atol()` → string to `long`
* Return `0` if conversion fails
* No error reporting beyond return value

---

## 18. Number to String Functions

* `itoa()` → int to string
* `ltoa()` → long to string
* Require:

  * destination buffer
  * numerical base
* Buffer size must be sufficient
* Return pointer to null-terminated string

---

## 19. Typedef (Type Alias)

* `typedef` creates an **alias** for an existing type
* Does **not** create a new data type
* Used to simplify:

  * complex structures
  * unions
  * pointer-heavy code
* Improves readability and maintainability

---

## 20. Typedef vs #define

* `typedef`

  * handled by compiler
  * type-safe
  * scoped
* `#define`

  * handled by preprocessor
  * text substitution
  * no type checking
* Prefer `typedef` for data types

---

## 21. Structures + Typedef (Common Pattern)

* Used together to:

  * simplify syntax
  * hide implementation details
  * make APIs cleaner
* Very common in professional C codebases

---

## 22. Demo Program Key Concepts

* Structure definition using `typedef`
* Structure arrays for multiple records
* Function prototypes for scope visibility
* Constants used for array size safety
* Loop-based input and output
* Compound `printf` usage
* Clearing screen before output for clarity

---

## 23. Core Things to Remember (Checklist)

* Structures group **heterogeneous data**
* Unions share memory, only one member valid
* Structures consume more memory than unions
* Type casting controls precision and memory
* Explicit casting can cause data loss
* Implicit conversion is compiler-driven
* Parentheses affect casting correctness
* Built-in conversion functions lack robust error handling
* Typedef improves code clarity
* Use structures for records, unions for alternatives
* Memory safety matters when converting and copying data

---

