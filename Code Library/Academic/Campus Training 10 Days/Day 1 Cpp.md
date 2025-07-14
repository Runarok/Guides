# 🛠️ C++ Technical Training – Day 1

## 📌 Introduction
This document summarizes **Day 1** of the C++ internship technical training, conducted on **14th July 2025**.

---

## ✅ Header Files

### What Are Header Files?

Header files in C++ contain declarations for functions, types, and objects that you can use in your program. By including them with `#include`, you gain access to standard or external library features.

#### Example: <code>#include <iostream></code>
This is the standard header used for basic input and output operations. It provides:
<ul>
  <li><code>cin</code> for reading input from the user</li>
  <li><code>cout</code> for printing output to the console</li>
  <li><code>cerr</code> for error messages (unbuffered)</li>
  <li><code>clog</code> for log/debug messages (buffered)</li>
</ul>

```cpp
#include <iostream> // Includes IO stream library for input/output functions
using namespace std; // Allows using cout/cin without std:: prefix

int main() {
    cout << "Hello, World!" << endl; // Prints a greeting to the console
    return 0; // Indicates successful program execution
}
```

---

## ✍️ Comments in C++

Comments help explain your code and are ignored by the compiler.

### 🔹 Single-Line Comment

Single-line comments start with <code>//</code> and continue until the end of the line.

```cpp
// This is a single-line comment explaining that the next line prints text
cout << "Single-line comment above" << endl;
```

### 🔹 Multi-Line Comment

Multi-line comments start with <code>/&ast;</code> and end with <code>&ast;/</code>.  
<span>Tip:</span> Use HTML tags in Markdown to ensure asterisks are rendered properly:

```cpp
/*
   This is a multi-line comment.
   It can span multiple lines.
   Useful for detailed explanations.
*/
cout << "Multi-line comment above" << endl;
```

---

## 🔤 Variables and Data Types

Variables are named locations in memory to store values. Their data types determine what kind of data they hold and how much memory they use.

**Definition:**  
A variable is a "container" for storing data. The data type defines what kind of value (number, character, etc.) the variable can hold.

**Use Cases:**  
Variables are used for storing user input, intermediate calculations, settings, and more. Data types help the compiler allocate memory and enforce correct usage.

---

### 🔹 Integer (`int`)
A variable that holds whole numbers (no decimals).  
Use for counting, indexing, ages, etc.

```cpp
#include <iostream>
using namespace std;

int main() {
    int age = 20; // Declare an integer variable to store age
    cout << "Age: " << age << endl; // Print age to the console
    return 0;
}
```
<!-- The comment above the variable explains its purpose. The output statement shows how to print variable values. -->

---

### 🔹 Float (`float`)
Stores decimal numbers with single precision (about 6-7 digits).  
Use for measurements, grades, or temperature.

```cpp
#include <iostream>
using namespace std;

int main() {
    float temp = 36.6f; // 'f' suffix marks the literal as float
    cout << "Temperature: " << temp << endl; // Print temperature value
    return 0;
}
```
<!-- Shows how to declare and use a float variable. The 'f' suffix is required for float literals. -->

---

### 🔹 Double (`double`)
Stores decimal numbers with double precision (about 15 digits).  
Use for scientific values, precise calculations.

```cpp
#include <iostream>
using namespace std;

int main() {
    double pi = 3.1415926535; // Double holds more precision than float
    cout << "Value of pi: " << pi << endl; // Output the value of pi
    return 0;
}
```
<!-- Double is preferred when you need more accurate decimals. -->

---

### 🔹 Character (`char`)
Stores a single character (ASCII value).  
Use for grades, initials, single keystrokes.

```cpp
#include <iostream>
using namespace std;

int main() {
    char grade = 'A'; // Char stores a single character, use single quotes
    cout << "Grade: " << grade << endl; // Print the grade
    return 0;
}
```
<!-- 'char' is useful for storing letters, symbols, etc. -->

---

### 🔹 Boolean (`bool`)
Stores truth values: <code>true</code> or <code>false</code>.  
Use for decision making, status flags.

```cpp
#include <iostream>
using namespace std;

int main() {
    bool isCodingFun = true; // Boolean variable indicating if coding is fun
    cout << "Is coding fun? " << isCodingFun << endl; // Prints 1 for true, 0 for false
    return 0;
}
```
<!-- Booleans are used for conditions, logic, and flags. -->

---

## 🧱 Arrays (1D Array Introduction)

Arrays allow you to store multiple values of the same type under a single variable name.

**Use Case:**  
Storing lists of marks, scores, temperatures, etc.

```cpp
#include <iostream>
using namespace std;

int main() {
    int marks[5] = {85, 90, 78, 92, 88}; // Array storing 5 integer marks

    // Loop through each element in the array and print its value
    for (int i = 0; i < 5; i++) {
        cout << "Mark " << i + 1 << ": " << marks[i] << endl;
    }

    return 0;
}
```
<!-- Arrays are indexed from 0. The loop prints every mark by accessing marks[i]. -->

---

### <span style="color:#3B82F6">`using namespace std;`</span>

Allows you to use standard C++ objects like <code>cout</code> and <code>cin</code> without the <code>std::</code> prefix.

#### Example without `using namespace std`:

```cpp
#include <iostream>

int main() {
    std::cout << "Hello, world!" << std::endl; // Must use std:: prefix
    return 0;
}
```
<!-- Without 'using namespace std;', every standard object needs 'std::' -->

#### Example with `using namespace std`:

```cpp
#include <iostream>
using namespace std;

int main() {
    cout << "Hello, world!" << endl; // std:: prefix not needed here
    return 0;
}
```
<!-- 'using namespace std;' makes code shorter, but may cause conflicts in large projects -->

---

### <span style="color:#3B82F6">`cout` vs `std::cout`</span>

<ul>
  <li><code>std::cout</code>: The fully qualified name, always refers to the standard library's cout. Preferred in professional code to avoid naming conflicts.</li>
  <li><code>cout</code>: Shortcut that works only if you've used <code>using namespace std;</code>. Easier for small projects but risky for large codebases.</li>
</ul>

> <b>Best Practice:</b> Avoid <code>using namespace std;</code> in large or header files to prevent naming conflicts. Prefer <code>std::cout</code> in professional codebases.

---

## 💬 Input and Output

### 🔹 `cout` – Output to Console

Prints values or text to the terminal.

```cpp
#include <iostream>
using namespace std;

int main() {
    cout << "Welcome to C++!" << endl; // Prints a welcome message
    return 0;
}
```
<!-- 'cout' is used for displaying information to the user. -->

### 🔹 `cin` – Input from User

Reads input from the user via the keyboard.

```cpp
#include <iostream>
using namespace std;

int main() {
    int number; // Variable to store user input
    cout << "Enter a number: "; // Prompt the user
    cin >> number; // Read number from keyboard and store in variable
    cout << "You entered: " << number << endl; // Show what was entered
    return 0;
}
```
<!-- 'cin' reads input and stores it in the variable. -->

### 🔹 `cerr` – Error Output

Prints error messages immediately (unbuffered).

```cpp
#include <iostream>
using namespace std;

int main() {
    cerr << "An error has occurred!" << endl; // Prints error message immediately
    return 0;
}
```
<!-- 'cerr' is ideal for errors and is not buffered. -->

### 🔹 `clog` – Logging Output

Used for logging/debug messages (buffered output).

```cpp
#include <iostream>
using namespace std;

int main() {
    clog << "This is a log message." << endl; // Logs a message, but might not show immediately
    return 0;
}
```
<!-- 'clog' is buffered, so output may not appear instantly. Good for logs and debugging. -->

---

## 🧠 Built-in Data Types Summary

- <code>int</code>: Whole numbers, e.g. 42, -7
- <code>float</code>: Decimal numbers (single precision), e.g. 3.14
- <code>double</code>: Decimal numbers (double precision), e.g. 2.718281828
- <code>char</code>: A single character, e.g. 'A'
- <code>bool</code>: True or false

---

## 🧮 Operators in C++

### 🔢 1. Arithmetic Operators

Operators that perform mathematical operations on numeric values.  
Use for calculations, counters, updating values.

```cpp
#include <iostream>
using namespace std;

int main() {
    int a = 10, b = 3; // Two integer variables

    // Perform and display basic arithmetic operations
    cout << "Addition: " << (a + b) << endl;        // Adds a and b
    cout << "Subtraction: " << (a - b) << endl;     // Subtracts b from a
    cout << "Multiplication: " << (a * b) << endl;  // Multiplies a and b
    cout << "Division: " << (a / b) << endl;        // Divides a by b (integer division)
    cout << "Modulo: " << (a % b) << endl;          // Remainder of a divided by b
    return 0;
}
```
<!-- Each line shows a different arithmetic operator and its result. -->

---

### ⚖️ 2. Relational Operators

Operators that compare two values, returning <code>true</code> (1) or <code>false</code> (0).  
Use for decision making, loops, and conditions.

```cpp
#include <iostream>
using namespace std;

int main() {
    int a = 5, b = 10;

    // Compare a and b using relational operators
    cout << (a == b) << endl;  // Checks if a equals b (false)
    cout << (a != b) << endl;  // Checks if a not equal to b (true)
    cout << (a > b) << endl;   // Checks if a is greater (false)
    cout << (a < b) << endl;   // Checks if a is less (true)
    cout << (a >= b) << endl;  // Checks if a greater or equal (false)
    cout << (a <= b) << endl;  // Checks if a less or equal (true)
    return 0;
}
```
<!-- Each operator returns 0 or 1 depending on the result of the comparison. -->

---

### 🧠 3. Logical Operators

Operators used with boolean expressions to combine or invert logic.  
Use for decision making in if statements and complex conditions.

```cpp
#include <iostream>
using namespace std;

int main() {
    bool x = true, y = false;

    // Combine boolean values using logical operators
    cout << (x && y) << endl;  // AND: true only if both are true (false)
    cout << (x || y) << endl;  // OR: true if any is true (true)
    cout << (!x) << endl;      // NOT: inverts x (false)
    return 0;
}
```
<!-- Shows how to combine and invert boolean values. -->

---

### 🧮 4. Bitwise Operators

Operators that work directly on the binary bits of integer values.  
Use for low-level programming, flags, and masks.

```cpp
#include <iostream>
using namespace std;

int main() {
    int a = 5, b = 3; // 5: 101, 3: 011 in binary

    cout << "AND: " << (a & b) << endl;    // Bitwise AND: 101 & 011 = 001 (1)
    cout << "OR: " << (a | b) << endl;     // Bitwise OR: 101 | 011 = 111 (7)
    cout << "XOR: " << (a ^ b) << endl;    // Bitwise XOR: 101 ^ 011 = 110 (6)
    cout << "NOT: " << (~a) << endl;       // Bitwise NOT: ~101 = ...11111010 (-6 in two's complement)
    return 0;
}
```
<!-- Bitwise operators work at the binary level, useful for certain optimizations and hardware control. -->

---

### 🔀 5. Shift Operators

Operators that shift bits left or right in the binary representation.  
Use for fast multiplication/division by powers of two.

```cpp
#include <iostream>
using namespace std;

int main() {
    int x = 5; // 5: 00000101 in binary

    cout << "Left Shift: " << (x << 1) << endl;  // Shifts bits left (5 * 2 = 10)
    cout << "Right Shift: " << (x >> 1) << endl; // Shifts bits right (5 / 2 = 2)
    return 0;
}
```
<!-- Shifting left multiplies, shifting right divides by powers of two. -->

---

### ❓ 6. Conditional Operator (Ternary)

A compact syntax for <code>if-else</code> selection.  
Use to assign values based on a condition.

```cpp
#include <iostream>
using namespace std;

int main() {
    int a = 10, b = 20;

    // Use ternary operator to assign the larger value to max
    int max = (a > b) ? a : b; // If a > b, max = a; else max = b
    cout << "Max: " << max << endl;
    return 0;
}
```
<!-- Ternary operator is useful for simple conditional assignments. -->

---

### 🧾 7. Assignment Operators

Operators that assign values to variables, often combining assignment with another operation.  
Use for updating counters, accumulators.

```cpp
#include <iostream>
using namespace std;

int main() {
    int x = 10; // Start with x = 10

    x += 5;   // Adds 5 to x (x = 15)
    x -= 2;   // Subtracts 2 (x = 13)
    x *= 3;   // Multiplies by 3 (x = 39)
    x /= 3;   // Divides by 3 (x = 13)
    x %= 6;   // x modulo 6 (x = 1)

    cout << "Final x: " << x << endl; // Prints the final value of x
    return 0;
}
```
<!-- Shows how assignment operators update the variable in-place. -->

---

### ➕ 8. Increment & Decrement Operators

Increase or decrease the value of a variable by one.  
Use for loop counters, array indexing.

```cpp
#include <iostream>
using namespace std;

int main() {
    int x = 5;

    cout << "Post-increment: " << x++ << endl; // Prints x, then increments (5)
    cout << "After post: " << x << endl;       // x is now 6
    cout << "Pre-increment: " << ++x << endl;  // Increments, then prints (7)
    cout << "Pre-decrement: " << --x << endl;  // Decrements, then prints (6)
    cout << "Post-decrement: " << x-- << endl; // Prints x, then decrements (6)
    cout << "After post: " << x << endl;       // x is now 5
    return 0;
}
```
<!-- Shows the difference between pre/post increment and decrement. -->

---
