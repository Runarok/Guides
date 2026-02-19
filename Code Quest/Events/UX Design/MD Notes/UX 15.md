## 1. Purpose of Input and Output in C

* Computers need to know **what type of data** they are receiving or displaying.
* This is done using **format specifiers**.
* The programmer is responsible for telling the computer how to interpret data.
* Input → process → output is the core flow.

---

## 2. Required Header Files

* Input/output is **not built into core C**.
* You must include:

  * `stdio.h` → standard, portable, required
  * `conio.h` → non-standard, mostly MS-DOS / old compilers
* `conio.h` is **not portable** and not part of ISO C.

---

## 3. Input and Output Functions

### Character-based

* `getchar()` → reads a single character
* `putchar()` → outputs a single character

### String-based

* `puts()` → outputs a string (adds newline automatically)

### General-purpose (most important)

* `scanf()` → input
* `printf()` → output
* These handle:

  * characters
  * integers
  * floats
  * strings

---

## 4. Syntax Rules for scanf and printf

### scanf

* Requires:

  * format specifier
  * variable **address** (use `&` for non-strings)
* Strings do **not** use `&`
* Example logic:

  * `%d` → `&integer`
  * `%f` → `&float`
  * `%s` → string name only

### printf

* Uses format specifiers to replace values inside text
* Does **not** use `&`
* Output formatting is controlled by escape sequences

---

## 5. Common Format Specifiers

* `%c` → character
* `%d` / `%i` → integer
* `%f` → float
* `%e` / `%E` → scientific notation
* `%g` / `%G` → shortest float representation
* `%hi` → short signed integer
* `%hu` → short unsigned integer
* Length modifiers matter for correct memory interpretation

---

## 6. Escape Sequences (Formatting Symbols)

Used to control layout and readability:

* `\n` → new line
* `\t` → horizontal tab
* `\\` → backslash
* `\"` → double quote
* `\a` → alert sound
* `\b` → backspace

Used to:

* align output
* separate columns
* improve presentation

---

## 7. Default Output Behavior

* Text is **right-aligned**
* Field width equals content width unless specified
* No formatting → output appears in a straight horizontal line

---

## 8. Program Design Workflow

You are expected to follow this order:

1. Problem statement
2. Pseudocode
3. Flowchart
4. Actual C code

Reason:

* Prevents logic errors
* Makes large programs manageable
* Any change in code should reflect back in pseudocode

---

## 9. Sample Program Logic (Student Average)

### Inputs Required

* Name (string)
* Surname (string)
* Maths mark (int)
* English mark (int)
* Science mark (int)

### Processing

* Average = (maths + english + science) / 3

### Output

* Student name
* Student surname
* Average mark
* Displayed vertically and aligned

---

## 10. Variable Declaration Rules

* Strings must have:

  * fixed size
  * proper null termination
* Integers should be initialized
* Variables *can* be declared inline but:

  * not recommended
  * reduces readability
  * increases error risk

---

## 11. Screen Control

* `system("cls")` clears the screen on Windows
* Platform-dependent
* Avoid in portable programs

---

## 12. Output Alignment Techniques

* Use `\t` to align columns
* Multiple tabs may be required
* Works similarly to word processors
* Improves readability of results

---

## 13. Key Rules to Remember (Checklist)

* Always include `stdio.h`
* Match format specifier to data type
* Use `&` in `scanf` for non-strings
* Strings do not use `&`
* Initialize variables
* Escape sequences affect layout, not data
* Avoid non-standard headers unless required
* Follow design steps for clarity and correctness

---
