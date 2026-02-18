# 1. Computing Systems — Overview

A **computer system** is built using a predefined architecture, just like a house follows a blueprint.

### Core components (present in all computers)

* **Input devices** – feed raw data
* **CPU** – processes data
* **Storage devices** – store data & programs
* **Output devices** – present results

---

# 2. Central Processing Unit (CPU)

The CPU is a **small chip**, not the computer cabinet.

### Internal components of the CPU

## 2.1 Arithmetic Logic Unit (ALU)

* Performs:

  * Arithmetic operations (add, subtract, etc.)
  * Logical operations (AND, OR, comparisons)
* Handles **decision making**

---

## 2.2 Registers

* Very small, ultra-fast memory inside CPU
* Types:

  * **General-purpose registers**
  * **Special-purpose registers**
* Faster than cache and RAM

---

## 2.3 Cache

* High-speed memory inside the processor
* Stores:

  * Frequently used data
  * Recently used instructions
* Purpose: reduce access time to RAM
* Measured in MB (e.g., 3 MB cache)

---

## 2.4 Buses

High-speed communication pathways

* **Address bus** → carries memory addresses
* **Data bus** → carries actual data
* **Control bus** → carries control signals

---

## 2.5 Clock

* Synchronizes all CPU operations
* Measured in **Hertz (Hz)**
* Example:

  * 2.5 GHz = 2.5 billion cycles/second
* One cycle ≈ one instruction step

---

# 3. Von Neumann Architecture

Proposed in 1945 by **John von Neumann**

### Core idea

* **Programs and data are stored together in memory**
* Enables **general-purpose computing**

### Why it mattered

* Eliminated hard-wiring for each task
* Made computers programmable via software

---

## 3.1 Special Registers in Von Neumann Architecture

| Register                               | Purpose                             |
| -------------------------------------- | ----------------------------------- |
| **PC (Program Counter)**               | Holds next instruction address      |
| **CIR (Current Instruction Register)** | Holds instruction being executed    |
| **MAR (Memory Address Register)**      | Holds memory address to access      |
| **MDR (Memory Data Register)**         | Holds data being transferred        |
| **ACC (Accumulator)**                  | Stores intermediate & final results |

---

# 4. Instruction Sets

### Instruction Set

* Complete set of commands a CPU understands
* Controls transistor switching

---

## 4.1 CISC vs RISC

### CISC – Complex Instruction Set Computer

* Goal: fewer instructions per program
* Uses **microcode**
* Instructions span multiple cycles
* Hardware complexity: high
* Pros:

  * Uses less RAM
  * Flexible instruction expansion

---

### RISC – Reduced Instruction Set Computer

* Simple instructions
* One instruction per clock cycle
* Enables **pipelining**
* More registers, fewer transistors
* Pros:

  * Predictable performance
  * Easier compiler optimization
* Cons:

  * Requires more RAM

### Analogy

* **CISC** → adult given one complex task
* **RISC** → child guided step-by-step

---

# 5. Digital Computing Fundamentals

### Binary System

* Uses only:

  * **0** (off)
  * **1** (on)
* Based on transistor states

### Bit

* Single binary digit (0 or 1)

---

## 5.1 Byte & Data Units

* **Nibble** = 4 bits
* **Byte** = 8 bits (standard)
* **Word** = 16 bits

> “Byte” is a deliberate misspelling of “bite”

---

# 6. Memory Addressing & Powers of Two

* Memory addresses are binary
* Adding one address line → doubles capacity

### Example

* 4 address lines → 2⁴ = 16 locations
* 5 address lines → 32 locations

### Why powers of two?

* Prevent unused addresses
* Reduce controller complexity
* Avoid data loss

> Powers of two became a **de facto standard**

---

# 7. Limits of Computing

## 7.1 Where Humans Are Better

* Emotional understanding
* Intuition
* Contextual decisions
* Creativity

---

## 7.2 Affective Computing

* AI branch focused on:

  * Emotion recognition
  * Facial expressions
  * Human emotional context

---

## 7.3 Creativity in AI

* **Inceptionism**

  * AI generates images from noise
* Example:

  * Google “dreaming” AI
  * Pig-snails, camel-birds

---

## 7.4 Self-Improvement Limitation

* Computers don’t evolve autonomously
* Improvements require:

  * Engineers
  * Programmers
* Exception: learning systems

---

# 8. Learning Systems

### Example

* **AlphaGo (DeepMind)**

  * Learned games autonomously
  * Improved through iteration

> Still dependent on initial human-designed frameworks

---

# 9. Decision Making in Computers

* All decisions reduce to:

  * **True / False**
* Based on provided data & logic
* No genuine independent thought

---

## 9.1 Natural Language Challenges

* Accents
* Pronunciation variation
* Context
* Figurative language

---

## 9.2 Fuzzy Logic

* Allows partial truth values
* Avoids strict true/false boundaries
* Helps with:

  * Speech recognition
  * Pattern ambiguity

---

# 10. Fetch–Decode–Execute Cycle

### CPU operation loop

1. **Fetch** instruction from RAM
2. **Decode** instruction
3. **Execute** instruction

* Synchronized by clock
* One complete loop = one instruction cycle

---

# 11. Factors Affecting Computer Speed

### 1. Clock Speed

* More cycles per second → faster CPU

### 2. Cache Size

* Larger cache → faster access

### 3. Number of Cores

* Multiple processing units
* Common in powers of two
* Quad-core ≫ dual-core

---

# 12. Final Core Takeaway

* Computers are **deterministic machines**
* Everything reduces to:

  * Binary states
  * Timed instruction cycles
* Power comes from:

  * Architecture
  * Instruction design
  * Parallelism
* Limits remain in:

  * Emotion
  * Creativity
  * Contextual reasoning

---
