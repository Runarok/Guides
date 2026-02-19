## 1. What Memory Is

* Memory stores **data** (binary 0s and 1s) used by the computer.
* Data is unprocessed information; instructions operate on it to produce results.
* Physically implemented using **transistors and capacitors** representing charge.

---

## 2. Memory Hierarchy (Closest → Farthest from CPU)

1. **CPU Registers**

   * Smallest, fastest, most expensive
   * Directly accessed by CPU

2. **Cache**

   * Slightly slower than registers
   * Stores data likely needed soon
   * Usually only a few MB

3. **RAM (Main Memory)**

   * Largest working memory
   * Slower than cache
   * Programs can run directly from RAM

4. **Secondary Storage (Disk)**

   * Very slow compared to RAM
   * Used when RAM is insufficient

---

## 3. Latency and Performance

* **Latency** = time to complete a read/write
* Higher latency → slower memory
* Performance depends on:

  * Speed (latency)
  * Size
  * Cost
  * Distance from CPU

---

## 4. Memory Allocation at Program Start

* When a program starts:

  * OS assigns memory via the **memory manager**
  * Allocator decides how memory is distributed
* Memory movement between RAM and disk is handled by OS
* Programmer declares variables → compiler converts them to **memory addresses**
* Variable names mean nothing at runtime; only addresses matter

---

## 5. Stack Memory

* Stores **automatic (local) variables**
* Memory freed automatically when variables go out of scope
* Characteristics:

  * Fast access
  * Size must be known at compile time
  * Limited size
* Uses **LIFO (Last In, First Out)**
* Each function call:

  * Pushes return address and local variables
* Recursive calls rely heavily on stack behavior

---

## 6. Heap Memory

* Used for **dynamic memory allocation**
* Memory allocated at runtime
* Characteristics:

  * Slower than stack
  * Much larger
  * Size can grow/shrink dynamically
* Programmer must manually manage it
* Incorrect handling leads to:

  * **Memory leaks**
  * Crashes
  * Undefined behavior

---

## 7. Program Memory Layout (Low → High Address)

1. **Text Segment**

   * Executable code
   * Read-only
   * Sharable across processes

2. **Initialized Data Segment**

   * Global/static variables with initial values
   * Read-write

3. **Uninitialized Data Segment (BSS)**

   * Global/static variables without initialization
   * Contains garbage values initially

4. **Stack**

   * Function calls, local variables

5. **Heap**

   * Dynamically allocated memory

---

## 8. Dynamic Memory Allocation in C

* Used when data size is unknown at compile time
* Overcomes fixed-size array limitations
* Defined in standard library headers

### Four Core Functions

1. **malloc**

   * Allocates memory (uninitialized)
   * Returns pointer or `NULL`

2. **calloc**

   * Allocates memory and initializes to zero
   * Returns pointer or `NULL`

3. **free**

   * Deallocates memory
   * Does not return anything
   * Freeing invalid or already freed memory → undefined behavior

4. **realloc**

   * Resizes previously allocated memory
   * Preserves old data up to smaller size
   * May move memory to a new location
   * Returns `NULL` on failure (old block remains valid)

---

## 9. Special `realloc` Behaviors

* `realloc(NULL, size)` → same as `malloc(size)`
* `realloc(ptr, 0)` → frees memory, returns `NULL`
* If expansion fails:

  * Original block is not freed

---

## 10. Fragmentation

* **External Fragmentation**

  * Free memory exists but in unusable chunks
  * Causes allocation failure despite available memory
* Handled by allocator, mostly out of programmer’s control

---

## 11. Common Memory Errors

1. **Memory Leak**

   * Allocated memory never freed
   * Program memory usage grows uncontrollably

2. **Dangling Pointer**

   * Pointer refers to freed memory
   * Causes crashes and security vulnerabilities

3. **Wild Pointer**

   * Pointer never initialized
   * Points to random memory

4. **Invalid Free**

   * Freeing memory that was never allocated
   * Freeing memory twice

---

## 12. Best Practices

* Always initialize pointers (use `NULL`)
* Always `free` memory you allocate
* Set pointer to `NULL` after freeing
* Limit user-controlled memory sizes
* Validate allocation results (`NULL` checks)
* Be extra careful on constrained systems (embedded)

---

## 13. Key Conceptual Takeaways

* Stack is fast, automatic, limited
* Heap is flexible, manual, dangerous if mishandled
* C gives **full control** → also full responsibility
* Compiler will not protect you from memory mistakes
* Correct memory management = stable, efficient programs

---

