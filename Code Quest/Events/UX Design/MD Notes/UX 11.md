## 1. Documentation Section (Top of the Program)

**Purpose**
The documentation section appears at the very top of a C program and exists purely for **human understanding**.

**What it typically contains**

* Program name
* Author name(s)
* Date of creation
* Version number
* Update history (if modified later)
* Brief description of what the program does
* References:

  * User guides
  * Reports
  * Websites
  * External code sources

**Why it matters**

* Helps others (and future-you) understand the program quickly
* Provides legal and ethical clarity
* Required in professional and commercial projects

---

## 2. Copyright, Attribution & Plagiarism

* Using someone else’s code **without permission or acknowledgment** is plagiarism.
* For educational use, this is usually acceptable.
* For **commercial software**, copyright rules **must be followed strictly**.
* If code is reused:

  * Credit the original author
  * Follow stated usage conditions
  * Clearly document what was reused
* If unclear, contact the original developer (contact info is often in documentation).
* Copyright violations can lead to **legal action and heavy fines**.

**Best practice**

* Always reference copied code, even if not required.
* Never present others’ work as your own.

---

## 3. Historical Note: B Language

* C had a predecessor called **B**
* Developed by **Dennis Ritchie**
* B is essentially **typeless C**

  * No data types in function definitions
  * Local variables declared using `auto`

---

## 4. Preprocessor Directives

**Execution timing**

* Preprocessor directives are handled **before compilation**
* They are part of the compilation pipeline

### Two Main Sections

1. **Link Section**
2. **Definition Section**

---

## 5. Types of Preprocessor Directives

There are **four main categories**:

1. **File Inclusion**
2. **Macros**
3. **Conditional Compilation**
4. **Miscellaneous Directives**

---

## 6. File Inclusion (`#include`)

**Purpose**

* Includes external header files containing function declarations and macros

### Syntax

* `#include <stdio.h>`

  * Searches system directories
* `#include "myfile.h"`

  * Searches project/current directory

**Why headers are used**

* Avoid forward-declaring functions repeatedly
* Organize large programs
* Support multi-file projects
* Enable team collaboration

**Important note**

* Including the same header file twice causes compilation errors
* Header files usually pair with source (`.c`) files
* Headers provide forward declarations

---

## 7. Macros (`#define`)

**What is a macro**

* A named block of code or value
* Replaced **before syntax checking**
* Text substitution, not function execution

### Macro Characteristics

* Can represent:

  * Constants
  * Expressions
  * Parameterized calculations
* Example use:

  * Calculating area
  * Reusable logic

### Important Rules

* No termination symbol (`;`)
* Lasts until undefined using `#undef`
* Not affected by block scope

### Risks

* Can cause unexpected behavior
* Hard to read if overused
* Debugging becomes difficult

### Predefined Macros

* Begin with `__`
* Used for diagnostics and documentation

### `#error`

* Forces compilation to stop
* Displays custom error message

---

## 8. Declaration Section (Global Scope)

**Purpose**

* Declares elements visible across the entire program

### What belongs here

* Global variables
* Function declarations (prototypes)
* User-defined functions (before `main`)

### Global Variables

* Exist for the entire runtime
* Accessible from all functions
* Local variables override globals with the same name
* Reusing names across scopes is discouraged (hurts readability)

---

## 9. Functions in C

**Definition**

* A function is a self-contained block of code with a name

### User-Defined Functions

* Declared above `main`
* Improve:

  * Readability
  * Reusability
  * Organization
* Called by name with arguments
* Execution:

  * Control jumps to function
  * Executes function body
  * Returns to calling point

---

## 10. `main()` Function

* Mandatory entry point of every C program
* Execution always starts here

### Structure of `main`

1. **Declaration Section**

   * Local variables
   * Constants
2. **Execution Section**

   * Statements executed line by line

### Return Value

* `return 0` → successful execution
* Non-zero → error or abnormal termination

---

## 11. Program Execution Flow

* Code above `main` is integrated during compilation
* Only **one entry point** exists: `main`
* Program exits when `main` returns

---

## 12. Comments in C

**Purpose**

* Explain code for humans
* Improve readability and maintainability

**Important**

* Comments are removed **before compilation**
* Do not affect execution
* Part of coding standards and best practices

---

## 13. Types of Comments

### Single-Line Comments

* Syntax: `//`
* Apply only to that line
* Used for brief explanations

### Multi-Line Comments

* Syntax: `/* ... */`
* Can span multiple lines
* Compiler ignores everything inside (including code)

**Conventional Style**

* Add `*` at the beginning of each line inside multi-line comments
* Improves readability
* Common in real-world C codebases

---

## 14. Commenting Best Practices

* Use clear, narrative language
* Avoid shorthand
* Use sentence case
* Check spelling and grammar
* Place comments:

  * After the code block they explain (preferred)
* Avoid unnecessary blank lines
* Do not comment out large code blocks unless necessary
* Remove commented-out code in final versions unless documented
* Commented-out code during debugging is acceptable temporarily

---

## 15. Readability as a Core Principle

* Readability is as important as correctness
* Code is read more often than it is written
* Comments help:

  * Other developers
  * Reviewers
  * Your future self

---

## 16. Demonstrated Concepts (Practical)

* Adding a user-defined function above `main`
* Function does nothing until it is **called**
* Calling a function inserts its execution into program flow
* Inline comments do not change output
* Program output remains unchanged unless logic changes

---

## 17. Key Mental Model to Retain

* Documentation → humans
* Preprocessor → before compilation
* Headers → declarations, not execution
* Macros → text substitution
* Globals → lifetime = entire program
* Functions → modular execution
* `main()` → single entry point
* Comments → ignored by compiler, vital for clarity

---

