## 1. Variables and Memory

* Memory content is **not fixed**
* Variable values change because memory content changes
* When a variable is read:

  * The **value is copied** from memory
  * The copy is used in calculations

Variables are simply **named memory locations** formatted to hold a specific data type.

---

## 2. Variable Declaration

### General Syntax

```c
data_type variable_name;
```

* Memory size is determined by the **data type**
* Memory location is labeled using the **variable name**
* Variable declaration:

  * Reserves memory
  * Defines how that memory will be interpreted

Variables can be declared:

* At the start of a block
* Immediately before use

⚠ Placement affects **visibility (scope)**.

---

## 3. Types of Variables in C

C supports several variable categories:

1. **Local variables**
2. **Global variables**
3. **Static variables**
4. **Automatic variables**
5. **External variables**

(Static, automatic, and external are covered deeper later.)

---

## 4. Variable Naming Rules & Conventions

### Rules (Mandatory)

* Must start with:

  * Letter or `_`
* Cannot:

  * Be a keyword
  * Contain whitespace
  * Contain special characters
* Case-sensitive

### Naming Best Practices (Strongly Recommended)

Variable names should:

* Reflect purpose
* Improve readability
* Reduce mental load

Bad:

```c
int CFDdrs;
```

Good:

```c
int age;
int user_age;
```

---

## 5. Naming Conventions

### Common Styles

1. **snake_case**

```c
user_age
```

2. **camelCase**

```c
userAge
```

3. **PascalCase**

```c
UserAge
```

4. **Hungarian Notation**

```c
iCount   // integer
sName    // string
arrData  // array
```

Using conventions helps:

* Reviewers
* Future maintainers
* Yourself

---

## 6. Variables vs Constants

### Variables

* Value **can change**
* Represent changing state

### Constants

* Value **never changes**
* Assigned once
* Protected against modification

---

## 7. Why Use Constants

Constants:

* Prevent accidental modification
* Improve readability
* Communicate intent
* Reduce bugs in large codebases
* Are thread-safe (read-only)
* Often reused across program

---

## 8. Declaring Constants

### Method 1: `#define` (Preprocessor)

```c
#define PI 3.14
```

* No data type
* Text replacement
* No memory safety

### Method 2: `const` keyword (Preferred)

```c
const float PI = 3.14;
```

* Typed
* Stored in memory
* Compiler-enforced protection

### Best Practices

* Assign value immediately
* Use **UPPERCASE names**
* Treat constants as immutable

---

## 9. Scope of Variables

### Scope = Where a variable is visible

#### Local Variables

* Declared inside a block or function
* Accessible **only within that block**
* Invisible outside

#### Global Variables

* Declared outside all functions
* Accessible **anywhere in program**

Scope mistakes cause:

* Compilation errors
* Logic bugs

---

## 10. Function Parameters & Arguments

### Terminology (Important)

* **Parameter** → variable in function definition
* **Argument** → actual value passed during function call

Also known as:

* Parameters → *formal parameters*
* Arguments → *actual parameters*

---

## 11. Formal vs Actual Parameters

### Formal Parameters

* Defined in function declaration
* Act as local variables inside function
* Receive values at function call

### Actual Parameters

* Values or expressions passed during call
* Can be:

  * Variables
  * Constants
  * Literals

---

## 12. Passing Arguments

### Pass by Value

* Copy of value is passed
* Caller and callee have **separate variables**
* Changes inside function **do not affect caller**

Used when:

* Safety matters
* Multi-threaded systems
* Distributed systems

---

### Pass by Reference (Pass by Address)

* Memory address is passed
* Caller and callee share same data
* Changes **affect original variable**

Used when:

* Large data structures
* Performance matters
* Modification is intended

---

## 13. Argument & Parameter Rules

* Number of arguments must match parameters
* Data types must match
* Parameters are local to the function
* Parameters exist only during function execution
* Variable-length parameter lists are exceptions

---

## 14. Variable Initialization

### Why Initialization Matters

* Memory is reused
* Uninitialized variables may contain **garbage values**
* Causes:

  * Random behavior
  * Crashes
  * Hard-to-debug bugs

### Best Practice

Always initialize variables:

```c
int count = 0;
```

If not used immediately:

* Set to `0`

---

## 15. Program Demo Overview (Even Numbers Program)

### Problem

* Ask user for **10 numbers**
* Display **only even numbers**

---

## 16. Design Process

1. Flowchart
2. Pseudocode
3. Implementation
4. Testing
5. Commenting

---

## 17. Core Program Elements Used

* Documentation section
* `#include <stdio.h>`
* Arrays
* Index variable
* Functions
* Loops (`while`, `for`)
* Conditionals (`if`)
* Modulus operator `%`
* Input (`scanf`)
* Output (`printf`)
* Return values

---

## 18. Key Logic Used

### Even Number Check

```c
number % 2
```

* Remainder `0` → even
* Remainder `1` → odd

---

## 19. Array Handling

* Array size fixed (10 elements)
* Index starts at `0`
* Index must be reset after use
* Prevents out-of-bounds errors

---

## 20. Why Reset Variables

Resetting variables:

* Prevents stale values
* Simplifies debugging
* Improves readability
* Makes execution predictable

---

## 21. Return Values

* `int main()` must return an integer
* `return 0;` → success
* Non-zero → error

---

## 22. Comments in Practice

* Inline comments used for explanation
* Comments:

  * Do not affect execution
  * Improve understanding
* Too many comments can hurt readability
* Use comments to explain **why**, not obvious **what**

---

## 23. Key Takeaways to Retain

* Variables = named memory locations
* Initialize everything
* Use meaningful names
* Prefer `const` over magic numbers
* Scope controls visibility
* Parameters ≠ arguments
* Pass by value = safe
* Pass by reference = efficient
* Arrays require careful indexing
* Reset reused variables
* Comments improve maintainability
* Logic clarity > clever tricks

---

