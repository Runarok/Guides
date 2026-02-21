## 1. Bugs vs Errors (Core Distinction)

* **Bug**:

  * Caused by incorrect program logic or implementation
  * Program behaves differently from what the programmer intended
  * Examples: wrong calculations, missing menu, incorrect output

* **Error**:

  * Caused by **external or unexpected runtime events**
  * Not a fault in program logic
  * Examples: removed flash drive, missing file, invalid user input

* Not all bugs produce errors

* Not all errors are bugs

---

## 2. Errors vs Exceptions (Conceptual Mapping)

* In many languages, runtime errors are called **exceptions**
* In C, errors are typically handled manually
* Errors occur **during execution**, not compilation
* Programs should handle **foreseeable errors** gracefully

---

## 3. Good Error Handling Practices

* Programs should:

  * Detect errors
  * Inform users clearly
  * Avoid cryptic or technical messages
* Error messages should:

  * Explain what happened
  * Explain what the user can do next
* Poor error messages reduce usability and reliability

---

## 4. Error Handling in C (Big Picture)

* C provides **no built-in exception system**
* Error handling is mostly the **programmer’s responsibility**
* Support exists via:

  * Header files
  * Return values
  * Global and local indicators
  * Signals and jumps

---

## 5. Two Phases of Error Handling

1. **Error Detection**

   * Identify that something went wrong

2. **Error Recovery**

   * Decide how to respond without crashing
   * Restore program to a valid state if possible

---

## 6. Error Handling Strategies in C

Common approaches include:

1. Prevention
2. Termination
3. Global error indicators
4. Local (non-global) error indicators
5. Return values
6. Assertions
7. Signals
8. Goto chains
9. Non-local jumps
10. Error callbacks

---

## 7. Error Prevention

* Write code that **prevents invalid states**
* Examples:

  * Restrict input to digits for numeric fields
  * Limit ranges (dates, sizes, lengths)
* Prevention is not always practical

  * Some mathematical operations naturally overflow
  * Over-restriction can reduce functionality

---

## 8. Termination (Fail-Hard Strategy)

* Used when execution **must not continue**
* Program exits immediately
* Useful when:

  * Continuing would corrupt data
  * State cannot be recovered
* Libraries should avoid forcing termination unless unavoidable
* Responsibility shifts to higher-level code to decide recovery

---

## 9. Global Error Indicators (Fail-Soft)

* Use shared variables to indicate error state
* Common examples:

  * `errno`
  * Floating-point error indicators
  * Platform-specific equivalents

### Key Rules for `errno`

* Set `errno = 0` before calling a function
* Check it **only after** a function signals failure
* Library functions must not reset it to zero
* Meaningful only when the function explicitly documents its use

⚠️ Misuse can silently corrupt program state

---

## 10. Local (Non-Global) Error Indicators

* Used for **object-specific error states**
* Common in file handling
* Typical functions:

  * `ferror`
  * `clearerr`
* Safer and more contained than global indicators

---

## 11. Jumps for Error Handling

* Uses `goto` or similar jump mechanisms
* Allows jumping to cleanup or recovery code
* Strongly discouraged because:

  * Breaks structured flow
  * Creates hard-to-debug logic
  * Easy to forget or misuse

Use structured control flow instead whenever possible.

---

## 12. Return Values as Error Indicators

* Many C functions signal errors via return values
* Example:

  * `malloc()` returns `NULL` on failure

### Pros

* Simple
* Explicit
* Widely used

### Cons

* Return value cannot carry other information
* Easy to ignore
* Ignoring return values can cause security vulnerabilities

---

## 13. Responsibility of the Caller

* The **caller must always check**:

  * Return values
  * Error indicators
* Ignoring errors can lead to:

  * Crashes
  * Data corruption
  * Security flaws

---

## 14. Error Handling Decision Flow

* Choose error handling based on:

  * Severity
  * Recoverability
  * Scope (local vs global)
* No single method fits all cases
* Mixing methods carefully is common in real systems

---

## 15. Project Context: Student Records System

Goal:

* Store, retrieve, delete, and view student records
* File-based persistent storage
* Login-protected system

---

## 16. Flowchart Design (High-Level Logic)

Main stages:

1. Start
2. Initialization
3. Login
4. Main Menu
5. Operations:

   * Add student
   * Search records
   * View records
   * Delete records
   * Change credentials
6. Return to menu after each operation
7. Exit program

---

## 17. Initialization Phase (Critical Setup)

Includes:

* Variable initialization
* File creation/checking
* Credential setup
* Defining limits:

  * Year ranges
  * String sizes
  * File names

---

## 18. Data Structures Defined

* Date structure
* Credential structure
* Student structure:

  * Name
  * Address
  * Guardian
  * Enrollment date

---

## 19. Functional Decomposition

Planned functions include:

* Initialization
* Login handling
* Menu control
* Add student
* Search student
* View records
* Delete records
* Update credentials
* Duplicate checking
* Input validation
* File validation

---

## 20. Pseudocode Development Strategy

* Start from flowchart blocks
* Translate each block into:

  * Functions
  * Variables
  * Structures
* Gradually refine into executable code
* Keep track of required components as development progresses

---

## 21. Key Things to Remember

* Bugs ≠ errors
* Errors can be external and unavoidable
* C relies on manual error handling
* Always check return values
* Use error indicators carefully
* Prefer clarity and safety over cleverness
* Design flow before writing code
* Initialization and validation prevent most runtime failures

---

