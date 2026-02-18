# 1. Natural Language vs Computer Language

## Natural Language

* Refers to **human language**
* Used to express:

  * Thoughts
  * Identity
  * Emotions
  * Imagination
* Logical **and** emotional
* Highly **ambiguous**

### Ambiguity

* Same sentence → different meanings based on:

  * Emphasis
  * Tone
  * Context
* Useful for humans, **problematic for computers**

---

## Computer / Programming Language

* A **special-purpose language**
* Used to give **precise instructions**
* Must be:

  * Unambiguous
  * Deterministic
  * Strictly structured

> If code is confusing to read, it is badly written code.

---

# 2. Language Structure (Borrowed into Programming)

### Syntax

* Order of words / symbols
* Rules of arrangement

### Semantics

* Meaning of words / symbols

> In simple terms:
> **Syntax = structure**
> **Semantics = meaning**

Programming languages borrow **syntax heavily** but minimize semantics to avoid ambiguity.

---

# 3. Why Programming Languages Exist

* Early computers used **pure binary (1s and 0s)**
* Extremely error-prone
* Impossible to scale

### Purpose of programming languages

* Make computers usable
* Eliminate rewiring
* Express logic clearly
* Abstract hardware complexity

---

# 4. Binary Representation of Information

## Binary System

* Based on:

  * **0** (off)
  * **1** (on)
* Fundamental to all computing

### Bit

* Binary digit
* Smallest unit of information

---

## Bytes & Units

* **Nibble** = 4 bits
* **Byte** = 8 bits (standard)
* **Word** = CPU-dependent (32-bit / 64-bit)

---

# 5. Character Encoding

## ASCII

* 7-bit encoding
* 2⁷ = **128 characters**
* English-centric
* Counting starts at **0**

Limit: cannot represent global languages.

---

## Unicode

Designed to represent **all human languages**

### UTF (Unicode Transformation Format)

* **UTF-7** – legacy email compatibility
* **UTF-8** – most popular

  * Variable width (8–48 bits)
  * Backward compatible with ASCII
* **UTF-16** – 16–32 bits
* **UTF-32** – fixed 32 bits

### Capacity

* Characters = 2ⁿ (n = number of bits)
* UTF-32 → ~4.2 billion characters

---

# 6. Parity Bits (Error Detection)

Used to check **data integrity**

### Even Parity

* Total number of 1s must be even

### Odd Parity

* Total number of 1s must be odd

Parity bit is adjusted accordingly.

---

# 7. Machine Language & Instruction Sets

## Machine Language

* Actual 1s and 0s executed by hardware
* All programming languages compile/translate into this

---

## Instruction Set Architecture (ISA)

* Programmer-visible CPU design
* Defines:

  * Supported operations
  * Instruction formats
  * Word size

Example:

* **x86**, **ARM**

---

## Word Size

* Amount of data CPU processes at once
* Common sizes:

  * 32-bit
  * 64-bit

### Compatibility

* 32-bit programs → run on 64-bit systems
* 64-bit programs → ❌ on 32-bit systems

---

# 8. Computer Instructions

Each instruction has **three parts**:

1. **Opcode**

   * Operation to perform
2. **Address Field**

   * Memory/register location
3. **Mode Field**

   * How operand/address is interpreted

### Instruction Types

* Memory reference
* Register reference
* Input/Output

---

# 9. Transducers (Input Conversion)

## Purpose

* Convert environmental data → digital signals

### Examples

* Microphone
* Accelerometer
* Pressure sensor
* Hall sensor
* Display
* Motors

> Smartphones are packed with transducers.

---

# 10. Programming Languages (Conceptual View)

* Describe tasks **step-by-step**
* Follow strict rules
* Require understanding of:

  * Hardware
  * OS
  * Architecture

Before building a computer:

* An **abstract machine** is designed

---

# 11. Abstract Computational Models

These are **theoretical models**, not real machines.

---

## 11.1 Finite State Machines (FSM)

* Limited memory
* Generates **regular languages**
* Used for:

  * Simple logic
  * Pattern matching
  * Regular expressions

---

## 11.2 Pushdown Automata (PDA)

* FSM + **stack**
* Stack = LIFO (Last In, First Out)
* Accepts **context-free languages**
* Used in:

  * Parsers
  * Compilers
  * Matching parentheses

---

## 11.3 Linear Bounded Automata (LBA)

* PDA + finite tape
* Accepts **context-sensitive languages**

---

## 11.4 Turing Machine

Invented by **Alan Turing** (1936)

### Characteristics

* Infinite tape (memory)
* Read/write head
* Transition table
* Can:

  * Halt
  * Run forever

### Importance

* Most powerful computational model
* Defines limits of computability

> Any real computer can be simulated by a Turing Machine (given enough memory).

---

# 12. Decidability

* **Decidable language**:

  * TM halts for all inputs
* **Recognizable language**:

  * TM may not halt for invalid inputs

All decidable languages are recognizable, but not vice versa.

---

# 13. Chomsky Hierarchy

Proposed by **Noam Chomsky** (1956)

### Language hierarchy (from weakest → strongest)

| Type   | Grammar           | Machine                 |
| ------ | ----------------- | ----------------------- |
| Type 3 | Regular           | Finite Automata         |
| Type 2 | Context-Free      | Pushdown Automata       |
| Type 1 | Context-Sensitive | Linear Bounded Automata |
| Type 0 | Unrestricted      | Turing Machine          |

Each level is a **subset of the next**.

---

# 14. Key Takeaways (Compressed)

* Human language → expressive but ambiguous
* Computer language → strict, deterministic
* Binary underpins everything
* Encoding enables global communication
* Instruction sets bridge software & hardware
* Abstract machines define **what is computable**
* Chomsky hierarchy classifies **language power**

---

