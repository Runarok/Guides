# 1. Brief History of Programming Languages

## Early Mechanical Roots

* **Jacquard Loom (early 1800s)**

  * Used punch cards to control fabric patterns
  * First example of **machine instruction via symbolic input**

## First Programmer

* **Ada Lovelace**

  * Wrote an algorithm for **Charles Babbage**’s Analytical Engine
  * Target problem: Bernoulli numbers
  * October 15 celebrated as **Ada Lovelace Day**

---

## Stored-Program Era (1940s)

* Emergence of programmable electronic computers
* **Alec Glennie**

  * Developed **Autocode** for the Mark I
  * First high-level programming language concept

---

## Assembly Language

* Invented by **Kathleen Booth**
* Replaced raw binary with mnemonics (ADD, SUB, MUL)
* Still used today for:

  * Device drivers
  * Embedded systems
  * Real-time systems

---

## 1960s–1970s

* Explosion of programming languages
* Evolution of:

  * C → C++
  * Modular programming
  * Object-oriented concepts

---

## Internet Era

* Shift toward:

  * Programmer productivity
  * Rapid development
* Rise of:

  * Scripting languages
  * Interpreted languages

---

# 2. What Is a Programming Language?

### Definition

A **systematic method** of describing a computational process using:

* Arithmetic
* Logic
* Control flow
* Input / Output

---

# 3. Programming Paradigms (Models)

There are **two primary paradigms**:

---

## 3.1 Imperative Programming

### Core idea

* Focuses on **how** a task is done
* Program state changes step by step

### Characteristics

* Assignment statements
* Global state mutation
* Close to machine architecture

### Limitations

* Poor parallelism
* Complex state management

---

### Imperative Subtypes

#### Procedural Programming

* Sequential execution
* Heavy use of loops & variables
* Examples:

  * C, C++, Java, Pascal

#### Object-Oriented Programming (OOP)

* System modeled as interacting objects
* Key concepts:

  * Encapsulation
  * Inheritance
  * Polymorphism
* Emphasizes reusability

#### Parallel Processing

* Divide-and-conquer strategy
* Tasks distributed across processors

---

## 3.2 Declarative Programming

### Core idea

* Focuses on **what** needs to be done
* Not how it is achieved

### Characteristics

* No explicit loops
* No variable reassignment
* High-level abstraction

---

### Declarative Subtypes

#### Logic Programming

* Program = facts + rules
* Computer reasons about consequences
* Example: Prolog

#### Functional Programming

* Pure mathematical functions
* Immutable data
* Recursion instead of loops
* Functions passed as values
* Example:

  * **ReactJS** (functional paradigm influence)

#### Database Programming

* Data-driven logic
* Queries describe desired result
* Uses **SQL**
* Managed by **DBMS**
* Strong data consistency guarantees

---

# 4. Low-Level vs High-Level Languages

## Low-Level Languages

* Hardware-specific
* Assembly, machine code
* Fast but non-portable

## High-Level Languages

* Hardware-independent
* Portable source code
* Compiled per target architecture
* Large libraries & abstractions

### Emulator

* Software that mimics another architecture
* Inefficient and resource-heavy
* Avoided when high-level languages are available

---

# 5. Translation of Programs

All programs must become **machine language** to run.

---

## 5.1 Translation Tools

### Assembler

* Assembly → machine code

### Compiler

* High-level code → machine code
* Produces executable file
* Target-specific

### Interpreter

* Translates line by line
* Executes immediately
* No standalone executable

---

# 6. Compilation Process (High-Level)

## Phase 1: Preprocessing

* Handles macros, includes

---

## Phase 2: Analysis

### Lexical Analysis (Scanner)

* Converts code into tokens
* Removes whitespace/comments
* Detects invalid symbols

### Syntax Analysis (Parser)

* Checks grammar rules
* Builds parse tree
* Reports syntax errors

### Semantic Analysis

* Checks logical meaning
* Undeclared variables
* Type mismatches

### Symbol Table

* Stores:

  * Variables
  * Functions
  * Classes
* Used across compiler phases

---

## Phase 3: Intermediate Code Generation

* Architecture-independent
* Assembly-like representation

---

## Phase 4: Code Optimization

* Improves speed
* Reduces size

---

## Phase 5: Code Generation

* Translates to target machine code
* Output: **target program**

---

# 7. Assembly, Linking, and Loading

## Assembler (Two Passes)

### Pass 1

* Determines memory requirements
* Builds assembler symbol table

### Pass 2

* Produces **relocatable machine code**

---

## Linker

* Combines multiple object files
* Resolves references
* Produces single executable

---

## Loader

* Loads executable into memory
* Starts execution
* Fails if references unresolved

---

# 8. Machine Code Types

* **Relocatable Machine Code**

  * Can load at different memory locations

* **Absolute Machine Code**

  * Final executable
  * Hardware-specific
  * Non-portable

---

# 9. Portability Implications

* Source code → portable
* Compiled executable → NOT portable
* Must compile separately for:

  * x86
  * ARM
  * Different operating systems

Example:

* Same Microsoft Office source
* Different binaries for Windows, macOS, Android

---

# 10. Final Core Takeaways

* Programming languages evolved with hardware
* Paradigms shape how problems are solved
* High-level languages trade control for productivity
* Compilation is a **multi-stage pipeline**
* Executables are architecture-specific
* Understanding this pipeline = better debugging & design

---
