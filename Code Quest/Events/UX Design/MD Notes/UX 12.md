## 1. Tokens in C

A **token** is the **smallest meaningful unit** in a C program.
Programs are built by combining tokens, just like sentences are built from words.

### Six Categories of Tokens

1. **Keywords**
2. **Identifiers**
3. **Constants**
4. **Strings**
5. **Special symbols (punctuators)**
6. **Operators**

During compilation:

* The **lexical analyzer** converts source code into a **stream of tokens**
* The **parser** uses token types to understand program structure

---

## 2. C Character Set

The **C character set** includes:

* Letters (uppercase and lowercase)
* Digits (0–9)
* Special characters (punctuation and symbols)

### Role of Special Characters

* Used to define structure and meaning in code
* Examples:

  * `{ }` → code blocks
  * `[ ]` → arrays
  * `;` → statement termination
  * `< >` → system header inclusion
  * `%` → remainder in division

These characters help the compiler identify **where code sections start and end**.

---

## 3. Keywords

### Definition

* Reserved words with **fixed meaning**
* Cannot be used as identifiers
* Always written in **lowercase**
* C has **32 keywords**

### Common Keyword Groups

#### Control & Decision

* `if`, `else`, `switch`, `case`, `default`
* `for`, `while`, `do`
* `break`, `continue`, `goto`

#### Data Types

* `int`, `float`, `char`, `double`, `long`, `void`

#### Storage & Modifiers

* `auto`, `extern`, `register`
* `signed`, `unsigned`, `const`, `volatile`

#### Others

* `return` → exits function
* `sizeof` → size of variable/type
* `struct`, `union`, `typedef`
* `enum`

### Case Sensitivity

* C is **case-sensitive**
* Using keywords with different casing technically works, but is **bad practice** and hurts readability

---

## 4. Identifiers

### Definition

Identifiers are **user-defined names** for:

* Variables
* Functions
* Arrays
* Structures
* Other program elements

### Rules for Identifiers

* Must start with:

  * A letter (A–Z / a–z) or `_`
* Cannot start with:

  * A digit
  * Special characters
* Cannot contain:

  * Spaces or tabs
  * Punctuation or symbols
* Cannot be a keyword
* Case-sensitive (`count` ≠ `Count`)

Good naming improves readability; similar-looking names should be avoided.

---

## 5. Variables and Constants

### Variables

* Represent **memory locations**
* Hold values that can change during execution
* Memory is allocated when declared
* Can be destroyed when no longer needed to save memory

### Constants

* Values that **never change**
* Occupy memory like variables
* Used when modification is not allowed
* Example: π (22/7)

---

## 6. Punctuators (Special Symbols)

### Definition

Punctuators give **syntactic meaning** but do not perform operations themselves.

### Key Characteristics

* Often appear in pairs
* Missing one usually causes compilation errors
* Used to:

  * Group code
  * Mark boundaries
  * Define structure

### Most Important Punctuator

* `;` (semicolon)

  * Marks end of a statement
  * Missing semicolons are a common source of bugs
  * Program may compile but behave incorrectly

---

## 7. Operators in C

Operators instruct the computer to **perform operations**.

### Main Categories

* **Arithmetic**: `+ - * / %`
* **Relational**: `< > <= >= == !=`
* **Logical**: `&& || !`
* **Bitwise**: `& | ^ ~ << >>`
* **Assignment**: `= += -= *= /=`

(Operators are covered in detail later in the course.)

---

## 8. Functions

### Definition

A **function** is a named block of code that:

* Takes input
* Performs computation
* Produces output

### Purpose

* Avoid code repetition
* Improve readability
* Improve maintainability

### General Function Structure

* Return type
* Function name
* Parameters (arguments)
* Function body (code)

### `main()` Function

* Mandatory entry point
* Program execution starts here
* Returns:

  * `0` → success
  * Non-zero → error

---

## 9. Control Structures

Control structures decide **when and how code executes**.

### Conditional Execution

* `if–else`
* `switch–case–default`

### Looping

* `while` → repeats while condition is true
* `for` → loop with initialization, condition, update
* `do–while` → executes at least once

---

## 10. Data Types (Overview)

* `char` → smallest addressable unit (stores characters)
* `int`, `float`, `double`, `long`
* `unsigned long long` → largest built-in type (memory heavy, often unnecessary)

Advanced types (covered later):

* Arrays
* Pointers
* Structures
* Unions

---

## 11. Comments in C

### Purpose

* Improve readability
* Explain intent
* Help maintain code

### Important

* Comments are **removed before compilation**
* Do not affect execution

### Types of Comments

#### Multi-line Comments

* `/* ... */`
* Can span multiple lines
* Must be closed properly
* Forgetting to close comments can disable large portions of code

#### Single-line (Inline) Comments

* `//`
* Apply only to the rest of the line
* Do not require closing

### Rules & Best Practices

* Comments cannot be nested
* Place inline comments:

  * On their own line
  * Or at end of a code line
* Avoid shorthand
* Use clear, readable language
* Remove commented-out code in final versions unless justified
* `TODO` comments indicate unfinished or future work

---

## 12. Whitespace in C

### Definition

Whitespace includes:

* Spaces
* Tabs
* Newlines
* Comments

### Compiler Behavior

* Whitespace is ignored after tokenization
* Used only to separate tokens
* Blank lines have no effect on compilation

### Example

* `int num1;`
  Requires space between `int` and `num1` so the compiler can distinguish tokens

---

## 13. Key Principles to Retain

* Tokens are the foundation of C programs
* Keywords are reserved and lowercase
* Identifiers follow strict naming rules
* Semicolons terminate statements
* Functions organize logic
* Control structures manage flow
* Comments are for humans, not machines
* Whitespace improves readability, not execution
* Readability is a core programming principle

---

