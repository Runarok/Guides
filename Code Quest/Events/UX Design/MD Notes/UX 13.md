## 1. Why Data Types Matter in C

* C is **hardware-aware**: data types map closely to machine architecture.
* Sizes of data types **depend on hardware** (CPU, word size, OS).
* C guarantees **minimum sizes**, not exact sizes.
* Choosing the wrong data type can cause:

  * Incorrect results
  * Memory waste
  * Performance issues
  * Undefined behavior

---

## 2. Classes of Data Types in C

C data types fall into **four classes**:

1. **Basic (Arithmetic) Types**
2. **Enumerated Types**
3. **Void**
4. **Derived Types**

---

## 3. Basic (Arithmetic) Data Types

### 3.1 Integer Types

Used to store **whole numbers** (no fractions).

| Type            | Minimum Size | Notes                                  |
| --------------- | ------------ | -------------------------------------- |
| `char`          | 8 bits       | Stored as numbers (character encoding) |
| `short int`     | ≥16 bits     | Rarely used                            |
| `int`           | ≥16 bits     | Common default                         |
| `long int`      | ≥32 bits     | Larger range                           |
| `long long int` | ≥64 bits     | Very large, often overkill             |

#### Signed vs Unsigned

* **Signed**: can store negative and positive values
* **Unsigned**: only non-negative values, larger upper range

---

### 3.2 `char` Data Type

* Stored in **1 byte (8 bits)** minimum
* Internally stored as integers using character encoding
* Characters:

  * `'A'–'Z'` are contiguous
  * `'a'–'z'` are contiguous
  * `'0'–'9'` are contiguous
* Can be manipulated using arithmetic

Variants:

* `char`
* `signed char` → typically `-128` to `127`
* `unsigned char` → typically `0` to `255`

---

### 3.3 `int` Data Type

* Stores integers without fractions
* Minimum range: `-32767` to `32767`
* Division discards fractional part

  * Example: `22 / 7 = 3`

Use `float` or `double` when precision is required.

---

### 3.4 Floating-Point Types

Used for **real numbers with fractions**:

* `float`
* `double`
* `long double`

Used when precision matters (e.g., scientific calculations).

---

## 4. Boolean Type in C

C does **not** have a true boolean type internally.

### Options:

#### `_Bool`

* Built-in type
* Can only hold `0` or `1`
* Any non-zero assignment becomes `1`

#### `bool`

* Available via `<stdbool.h>`
* Defined as:

  * `true` → `1`
  * `false` → `0`

Internally, booleans are still integers.

---

## 5. Void Data Type

`void` means **no value** or **no type**.

Used in **three cases**:

1. **Function return type**

   * Function returns nothing

2. **Function parameters**

   * Function accepts no arguments

3. **Void pointers (`void*`)**

   * Generic pointer to any data type
   * Common in memory allocation
   * Must be cast before use

---

## 6. Fixed-Width Integer Types

* Provide **guaranteed sizes**
* Useful for portability
* Defined in `<stdint.h>`
* Examples:

  * `int8_t`
  * `int16_t`
  * `int32_t`
  * `int64_t`

---

## 7. Choosing the Right Data Type — Key Factors

### 1. Requirements

* What values must be stored?
* Range?
* Precision?

### 2. Future-Proofing

* Will values grow over time?
* Avoid assumptions tied to current hardware

### 3. Convenience

* Readability matters
* Avoid overly complex representations

### 4. Performance

* Larger types cost more memory
* But **premature optimization is bad**

### 5. Memory Constraints

* Critical in:

  * Embedded systems
  * Battery-powered devices

---

## 8. Derived Data Types

Derived types build on basic types to provide structure and flexibility.

---

## 9. Arrays

### Definition

* Collection of elements of the **same data type**
* Stored in **contiguous memory**

### Key Properties

* Indexed starting at **0**
* Fixed size at declaration
* Cannot exceed declared size

### Declaration

```c
char initials[15];
```

* Holds 15 characters
* Access via index:

```c
initials[2] = 'E';
```

---

## 10. Pointers

### Definition

* A variable that stores the **address of another variable**

### Key Facts

* All pointers store memory addresses
* Address is a large hexadecimal number
* Pointer type determines **what it points to**, not address size

### Declaration

```c
int *ptr;
```

### Null Pointers

* Assigned value `0`
* Indicates pointer points to nothing
* Prevents accidental memory access

---

### Pointer Variations

* Pointer arithmetic (`++`, `--`, `+`, `-`)
* Arrays of pointers
* Pointer to pointer
* Passing pointers to functions (pass-by-reference)
* Returning pointers from functions

⚠ Powerful but dangerous if misused.

---

## 11. Unions

### Definition

* Multiple variables share the **same memory location**
* Only one member holds a value at a time

### Key Properties

* Memory size = size of largest member
* Used for memory efficiency

### Access

```c
u.member;
```

Use case:

* Low-memory systems
* Multiple interpretations of same data

---

## 12. Structures (`struct`)

### Definition

* Group of **different data types**
* Stored in **contiguous memory**

### Use Cases

* Records
* File metadata
* Complex data modeling

### Initialization Methods

1. Direct initialization
2. Designated initializers
3. Assignment from another struct

### Key Notes

* Field alignment depends on machine word size
* `sizeof` gives total memory used
* Structures can be:

  * Assigned
  * Passed by pointer
  * Accessed using `.` or `->`

---

## 13. Type Qualifiers

Type qualifiers modify how a variable behaves.

### `const`

* Value cannot be modified after initialization

### `volatile`

* Value may change outside program control
* Prevents compiler optimizations

### `restrict`

* Used with pointers
* Informs compiler pointer is sole reference
* Enables optimization

⚠ `restrict` and `volatile` **cannot** be used together.

---

## 14. `sizeof` Operator

* Returns size (in bytes) of:

  * Variables
  * Data types
  * Structures
* Hardware-dependent
* Essential for portability checks

---

## 15. Core Mental Model to Retain

* Data types are **contracts with hardware**
* Size is minimum-guaranteed, not fixed
* Smaller ≠ better, larger ≠ safer
* Choose types based on:

  * Meaning
  * Range
  * Precision
  * Context
* Arrays → contiguous memory
* Pointers → memory addresses
* Structs → grouped records
* Unions → shared memory
* Qualifiers → behavioral rules

---
