## 1. Purpose of Revisiting the Compilation Process

* To understand **where header files fit** in compilation.
* Explains **why header files behave differently** from normal source code.
* Critical for understanding **preprocessor rules and limitations**.

---

## 2. High-Level Compilation Pipeline

1. **Preprocessor**
2. **Compiler** → produces *relocatable code*
3. **Assembler** → produces *assembly*
4. **Linker & Loader** → produces *machine code*

Each stage transforms code into a different form.

---

## 3. The Preprocessor (Core Focus)

* Runs **before compilation**
* Is a **separate program** from the compiler
* Operates mainly on lines starting with `#`
* Output is still **valid C code**, just expanded

### Main Responsibilities

* Header file inclusion
* Macro expansion
* Conditional compilation
* Line control

---

## 4. Preprocessing Stages (In Order)

1. **Trigraph Replacement**

   * Converts trigraph sequences into single characters
   * Rarely used today, mostly legacy

2. **Line Splicing**

   * Joins physical lines split using `\`

3. **Tokenization**

   * Breaks code into tokens and whitespace
   * **Comments are removed entirely**

4. **Directive & Macro Processing**

   * Executes `#include`, `#define`, `#if`, etc.
   * Inserts external file contents directly into code

---

## 5. Preprocessor Directives

### 5.1 `#include`

* Inserts file contents **textually**
* Treated as if you wrote that code yourself

#### Forms

* `<file.h>` → search standard include paths
* `"file.h"` → search project directory first

---

### 5.2 `#pragma`

* Requests **compiler-specific behavior**
* Syntax and supported tokens vary by compiler
* Ignored if unsupported
* From **C99**, can be generated via macros

Used mainly in **large or specialized builds**

---

## 6. Header Files: Key Rules

* Typically use `.h`, sometimes `.hpp`
* Meant to be **included once**
* Multiple inclusion causes errors unless guarded
* Contain:

  * Function declarations
  * Macros
  * Type definitions

### Special Case

* `assert.h` **can be included multiple times**

  * Used to enable/disable assertions

---

## 7. Why Header Files Exist

* Avoid rewriting common functionality
* Improve portability
* Separate **interface** from **implementation**
* Enable reuse and standardization

---

## 8. The C Standard Library

* Collection of standard header files
* Defined by ANSI → ISO standards
* Intentionally **small and minimal**
* Designed for:

  * Portability
  * Low-level system access
  * Predictable behavior across platforms

---

## 9. Important Standard Header Files (Grouped)

### Debugging

* `assert.h` → runtime checks, aborts on failure

### Character Handling

* `ctype.h` → character classification & mapping

### Error Handling

* `errno.h` → global error reporting via `errno`

### Mathematics

* `math.h`, `float.h`, `limits.h`
* Advanced math, floating-point behavior, type limits

### Localization

* `locale.h` → regional formats (date, time, currency)

### Control Flow

* `setjmp.h` → non-local jumps (manual exception-like behavior)

### Signals (Mostly Unix)

* `signal.h` → asynchronous signal handling
* **Not portable**

### Variadic Functions

* `stdarg.h`
* Rules:

  * At least one fixed argument
  * `va_end` must be called
  * Type promotion rules apply

### Core Utilities

* `stddef.h` → common types and macros
* `stdio.h` → input/output (files, streams, devices)
* `stdlib.h` → memory allocation, conversions, utilities
* `string.h` → string manipulation
* `time.h` → date and time functions (second-level precision)

---

## 10. Hosted vs Freestanding Environments

### Hosted

* Full standard library available
* Typical desktop/server systems

### Freestanding

* Minimal headers only:

  * `float.h`
  * `limits.h`
  * `stdarg.h`
  * `stddef.h`
* Common in embedded systems

---

## 11. User-Defined Header Files

* Created to build **custom libraries**
* Included using quotes `"file.h"`
* Behave exactly like standard headers
* Excessive non-standard headers hurt portability

---

## 12. C Standards Overview

### ANSI C

* First formal standard (1980s)
* C89 / C90

### ISO C

* Adopted in 1990
* Revisions:

  * C99
  * C11
  * C18 (latest)

### What the Standard Defines

* Program representation
* Syntax and constraints
* Semantics
* Input representation
* Output representation

---

## 13. POSIX Standard

* Superset of the C standard library
* Adds:

  * Multithreading
  * Networking
  * Regex
* Focused on **Unix-like systems**
* Improves OS-level compatibility, not portability across all platforms

---

## 14. Key Takeaways (All Things to Remember)

* Preprocessor runs **before compilation**
* `#include` performs **text substitution**
* Header files define interfaces, not logic
* Standard library is intentionally minimal
* Portability depends on sticking to standard headers
* POSIX ≠ Standard C
* Compiler behavior ≠ Preprocessor behavior
* Freestanding ≠ Hosted environments
* Comments never reach the compiler
* Multiple inclusion must be controlled

---
