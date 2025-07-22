# Table of Contents

1. [C++ Technical Training - Day 1](#c-technical-training---day-1)
2. [C++ Object-Oriented Programming (OOP) Crash Course - Day 2](#c-object-oriented-programming-oop-crash-course---day-2)
3. [Campus Training – Day 3,4](#campus-training--day-34)

---
---

# C++ Technical Training - Day 1

## 📌 Introduction
This document summarizes **Day 1** of the C++ internship technical training, conducted on **14th July 2025**.

> Day 1 of campus training was fully based on the [GeeksforGeeks C++ Cheatsheet](https://www.geeksforgeeks.org/cpp/cpp-cheatsheet/). 
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
---

# C++ Object-Oriented Programming (OOP) Crash Course - Day 2

## What is OOP?

**OOP** stands for **Object-Oriented Programming**.  
It is a programming paradigm based on the concept of "objects" — data structures that contain data, in the form of fields (attributes), and code, in the form of procedures (methods).

Think of a **Car** object:  
- **Data:** brand, speed, fuel  
- **Behavior:** start(), accelerate(), brake()

### Key Pillars of OOP
- **Encapsulation** – Hiding data inside objects to protect it.  
- **Abstraction** – Hiding complexity, showing only the essentials.  
- **Inheritance** – Reusing properties and methods from other classes.  
- **Polymorphism** – Same function behaves differently in different contexts.

For more details, see [What is OOP? (GeeksforGeeks)](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-cpp/).

### Advantages of OOP
- Provides a clear structure to programs.  
- Makes code easier to maintain, reuse, and debug.  
- Helps keep your code DRY (Don't Repeat Yourself).  
- Enables creation of reusable applications with less code and shorter development time.

> **Tip:** The DRY principle means you should avoid writing the same code more than once. Move repeated code into functions or classes and reuse it.

---

## Classes and Objects

- **Class:** Blueprint or template that defines what an object should look like (attributes) and what it can do (methods).  
- **Object:** An instance of a class with actual values.

When you create an object from a class, it inherits all the variables and functions defined inside that class.

Learn more here: [Classes and Objects in C++ (GeeksforGeeks)](https://www.geeksforgeeks.org/classes-and-objects-in-cpp/).

---

## Procedural vs Object-Oriented Programming

| Procedural Programming               | Object-Oriented Programming (OOP)          |
|------------------------------------|--------------------------------------------|
| Code organized around functions.   | Code organized around objects.              |
| Functions operate on data separately.| Objects contain both data and functions.    |

---

## What is Encapsulation?

**Encapsulation** is the process of binding data and methods together into a single unit (a class) and restricting direct access to some of the object's components.

### Real-world Analogy  
A Bank ATM:  
- You can't see or access the internal database.  
- You only interact with the interface (insert card, type PIN, withdraw).

### Why Use Encapsulation?
- Protect data from unwanted access.  
- Prevent misuse or accidental changes.  
- Control how data is accessed or modified.

See more on encapsulation: [Encapsulation in C++ (GeeksforGeeks)](https://www.geeksforgeeks.org/encapsulation-in-c/).

---

## Access Modifiers in C++

C++ provides access control through **access modifiers**:

| Modifier    | Access Level                          | Can Access                  |
|-------------|-------------------------------------|-----------------------------|
| `private:`  | Only within the same class           | Encapsulated Data           |
| `public:`   | Anywhere in the program              | Interface                  |
| `protected:`| Inside the class and derived classes| Used mainly in inheritance  |

---

## Class Methods

Methods are functions that belong to a class.

### Defining Methods
- **Inside the class:** Define methods directly in the class body.  
- **Outside the class:** Declare in class, define later using scope resolution `ClassName::MethodName`.

Access methods via object and dot syntax:

```cpp
myObject.myMethod();
````

More on class methods: [C++ Member Functions (GeeksforGeeks)](https://www.geeksforgeeks.org/member-functions-in-c/).

---

## Constructors

A **constructor** is a special method automatically called when an object is created.

### Rules for Constructors:

* Same name as the class.
* No return type (not even `void`).
* Usually declared `public`.
* Automatically invoked during object creation.

Learn about constructors here: [Constructors in C++ (GeeksforGeeks)](https://www.geeksforgeeks.org/constructors-c/).

---

## Inheritance

Inheritance allows one class (child/derived) to reuse attributes and methods of another class (parent/base).

### Benefits:

* Helps avoid code duplication.
* Enables cleaner and more efficient code.

### Syntax Example:

```cpp
class Vehicle {
    // Base class
};

class Car : public Vehicle {
    // Derived class inherits Vehicle's members
};
```

More about inheritance: [Inheritance in C++ (GeeksforGeeks)](https://www.geeksforgeeks.org/inheritance-in-c/).

---

## Polymorphism

Polymorphism means “many forms.” It occurs when multiple classes related by inheritance implement methods differently.

Example: Base class `Animal` with a method `makeSound()`; derived classes like `Pig`, `Dog`, and `Bird` implement it differently:

| Animal | Sound       |
| ------ | ----------- |
| Pig    | wee wee     |
| Dog    | bow wow     |
| Bird   | tweet tweet |

The same method (`makeSound()`) behaves differently based on the object’s actual class.

Learn more: [Polymorphism in C++ (GeeksforGeeks)](https://www.geeksforgeeks.org/polymorphism-in-c/).

---
---

# Campus Training – Day 3,4

This session covered basic C++ programming concepts such as I/O, conditional statements, `switch-case`, and loops (`for`, `while`, `do...while`).  
Additionally, I **self-taught** and explored:
-  Function calling (user-defined functions)
-  Time API (`ctime`) and weekday manipulation

---

##  1. Addition of Two Integers

**Concept Covered in Class:** Input, basic arithmetic

```cpp
#include <iostream>

int main() {
    int A, B;

    std::cout << "Enter two integers separated by space: ";
    std::cin >> A >> B;

    int sum = A + B;  // Add the two integers
    std::cout << "Sum: " << sum << std::endl;

    return 0;
}
````

---

##  2. Check Positive, Negative or Zero

**Concept Covered in Class:** Conditional `if-else`

```cpp
#include <iostream>

int main() {
    int Integer;

    std::cout << "Enter an integer: ";
    std::cin >> Integer;

    if (Integer > 0) {
        std::cout << "The integer is positive." << std::endl;
    } else if (Integer < 0) {
        std::cout << "The integer is negative." << std::endl;
    } else {
        std::cout << "The integer is zero." << std::endl;
    }

    return 0;
}
```

---

##  3. Day of the Week using `switch`

**Concept Covered in Class:** `switch-case`

```cpp
#include <iostream>

int main() {
    int day;

    std::cout << "Enter a number (1 to 7) to get the day of the week: ";
    std::cin >> day;

    switch (day) {
        case 1: std::cout << "Monday" << std::endl; break;
        case 2: std::cout << "Tuesday" << std::endl; break;
        case 3: std::cout << "Wednesday" << std::endl; break;
        case 4: std::cout << "Thursday" << std::endl; break;
        case 5: std::cout << "Friday" << std::endl; break;
        case 6: std::cout << "Saturday" << std::endl; break;
        case 7: std::cout << "Sunday" << std::endl; break;
        default: std::cout << "Invalid input! Please enter a number between 1 and 7." << std::endl;
    }

    return 0;
}
```

---

##  4. Day Offset using Current Day

**🔹 Self-Taught Concept:** `ctime` usage, weekday index manipulation

```cpp
#include <iostream>
#include <ctime>
using namespace std;

int main() {
    int offset, todayIndex, targetIndex;

    // Get current local time
    time_t now = time(0);
    tm *ltm = localtime(&now);

    // Get today's index (0 = Sunday, 6 = Saturday)
    todayIndex = ltm->tm_wday;

    cout << "Enter day offset (positive or negative): ";
    cin >> offset;

    // Normalize offset within 0–6
    targetIndex = (todayIndex + offset % 7 + 7) % 7;

    switch (targetIndex) {
        case 0: cout << "It's Sunday!" << endl; break;
        case 1: cout << "It's Monday!" << endl; break;
        case 2: cout << "It's Tuesday!" << endl; break;
        case 3: cout << "It's Wednesday!" << endl; break;
        case 4: cout << "It's Thursday!" << endl; break;
        case 5: cout << "It's Friday!" << endl; break;
        case 6: cout << "It's Saturday!" << endl; break;
        default: cout << "Error: Invalid day index." << endl;
    }

    return 0;
}
```

---

##  5. Countdown using `while` Loop

**Concept Covered in Class:** Basic `while` loop

```cpp
#include <iostream>
using namespace std;

int main() {
    int i = 5;

    while(i > 0) {
        cout << i << "\n";
        i--;
    }

    return 0;
}
```

---

##  6. Countdown using Function and `while` Loop

**🔹 Self-Taught Concept:** Function declaration, definition, parameter usage

```cpp
#include <iostream>
using namespace std;

// Function declaration
void printCountdown(int start, int end);

int main() {
    int i = 5;
    int j = 0;
    printCountdown(i, j);  // Function call
    return 0;
}

// Function definition
void printCountdown(int start, int end) {
    while (start > end) {
        cout << start << "\n";
        start--;
    }
}
```

---

##  7. Countdown using `do...while` Function

**🔹 Self-Taught Concept:** `do...while` inside a function

```cpp
#include <iostream>
using namespace std;

// Function declaration
void printCountdown(int start, int end);

int main() {
    int i = 5;
    int j = 0;
    printCountdown(i, j);  // Function call
    return 0;
}

// Function definition using do...while loop
void printCountdown(int start, int end) {
    do {
        cout << start << "\n";
        start--;
    } while (start > end);
}
```

---

##  8. `for` Loop Example

**Concept Covered in Class:** Basic `for` loop

```cpp
#include <iostream>
using namespace std;

int main() {
    for (int i = 1; i < 5; i++) {
        cout << i << "\n";
    }
    return 0;
}
```

---

##  9. Sum of First 5 Natural Numbers

**Concept Covered in Class:** Loop-based sum logic

```cpp
#include <iostream>
using namespace std;

int main() {
    int sum = 0;

    for (int i = 1; i <= 5; i++) {
        sum = sum + i;
    }

    cout << "Sum is " << sum << endl;
    return 0;
}
```

---

##  10. `for` Loop – Basics

**Objective:** Repeat a block of code a fixed number of times.

```cpp
#include <iostream>
using namespace std;

int main() {
    for (int i = 1; i <= 5; i++) {
        cout << "Iteration " << i << "\n";
    }
    return 0;
}
````

> **Flow:**

* Initialization (`int i = 1`)
* Condition (`i <= 5`)
* Increment (`i++`) after each iteration

---

##  11. Procedural Programming

**Definition:**
A programming paradigm based on the concept of **procedure calls** — a sequence of instructions that operate on data.

### 🔹 Characteristics:

* Code organized into **functions** (also called procedures)
* Data and functions are separate
* Focus is on **how** things are done (step-by-step logic)

###  Example (Procedural style):

```cpp
#include <iostream>
using namespace std;

int add(int a, int b) {
    return a + b;
}

int main() {
    int x = 5, y = 10;
    int result = add(x, y);
    cout << "Sum is " << result << endl;
    return 0;
}
```

---

##  12. Object-Oriented Programming (OOP) – Introduction

**Definition:**
OOP is a programming paradigm centered around **objects** that combine **data** and **functions**.

### 🔹 Key Focus:

* **What the object is** and **what it does**, rather than step-by-step instructions.

---

##  13. Four Pillars of OOP - Indepth at end 

> *Briefed out by the teacher. In-depth explanations (self-study) are provided at the end.*

---

### 🔹 **Summary Table**

| **Pillar**        | **Keyword**   | **Purpose**              | **Key Tool in C++**                         |
| ----------------- | ------------- | ------------------------ | ------------------------------------------- |
| **Encapsulation** | *Protect*     | Hide internal state      | `private`, `public`                         |
| **Abstraction**   | *Simplify*    | Show only what’s needed  | `abstract class`, `interface`, `virtual`    |
| **Inheritance**   | *Reuse*       | Reuse and extend code    | `class A : public B`                        |
| **Polymorphism**  | *Flexibility* | One name, many behaviors | `virtual`, `override`, function overloading |


### 🔹 **Brief Meanings of Each Pillar**

| **Pillar**        | **Meaning**                                                                  |
| ----------------- | ---------------------------------------------------------------------------- |
| **Encapsulation** | Wrapping data and functions into one unit (class). Hides internal state.     |
| **Abstraction**   | Hiding complex details and exposing only the essentials to the user.         |
| **Inheritance**   | One class (child) inherits properties and methods of another (parent).       |
| **Polymorphism**  | Same function name behaves differently based on context (e.g., overloading). |

---

##  14. Advantages of OOP

* 🔐 **Modularity**: Code is divided into classes/objects
* 🔄 **Reusability**: Inheritance allows use of existing logic
* 🛠️ **Maintainability**: Easy to update/modify specific parts
* 🧠 **Scalability**: Better structure for growing projects
* 🔍 **Debugging Ease**: Encapsulated units isolate bugs quickly

---

##  15. Class and Object – Basics

**Class:** Blueprint or template that defines variables and functions
**Object:** Instance of a class — actual entity used in code

---

###  Example: Class with Function

```cpp
#include <iostream>
using namespace std;

// Class definition
class Student {
public:
    string name;
    int age;

    void display() {
        cout << "Name: " << name << ", Age: " << age << endl;
    }
};

int main() {
    Student s1;  // Object creation
    s1.name = "Runarok";
    s1.age = 21;
    s1.display();  // Calling class method
    return 0;
}
```

> 💡 Here, `Student` is the class. `s1` is an object with its own `name` and `age`.

---

# The 4 Pillars of OOP – Deep Dive

Object-Oriented Programming is built around 4 core principles. Each of them changes how we **think**, **structure**, and **extend** code.

---

## 1️⃣ Encapsulation – *“Protect what shouldn’t be touched”*

### 🔹 What it means:
Encapsulation is the **binding of data and related methods into a single unit (class)**, and **restricting direct access** to some of the object’s components.

It lets you hide the internal state of an object and only expose what is **safe and necessary** via public functions (getters/setters).

### 🔐 Real-life analogy:
Think of a **capsule** — it contains medicine inside but exposes only the outer shell to the world. You consume it, but don’t touch what’s inside directly.

### 🧠 Why it matters:
- Prevents unwanted interference with internal object state
- Improves **modularity** and makes code easier to debug or change
- Allows validation before modifying data

### ✅ C++ Example:

```cpp
class BankAccount {
private:
    double balance;  // hidden from outside

public:
    void deposit(double amount) {
        if (amount > 0)
            balance += amount;
    }

    double getBalance() {
        return balance;
    }
};
````

Here, `balance` is private — you **can’t access or change it directly**, only through controlled methods.

---

## 2️) Abstraction – *“Expose only the essentials”*

### 🔹 What it means:

Abstraction is about **hiding complex implementation** and **only showing relevant details** to the user. You don’t need to know *how* it works inside — just *what* it does.

Think of abstraction as **intentional ignorance**: we expose what’s needed, we hide what’s not.

### 🔧 Real-life analogy:

You use a TV remote without knowing the circuit behind it. You press a button → it works. That’s abstraction.

### 🧠 Why it matters:

* Keeps code **clean, readable, and focused**
* Separates *what it does* from *how it works*
* Encourages **interface-based design** in larger systems

### ✅ C++ Example using Abstract Class:

```cpp
class Animal {
public:
    virtual void makeSound() = 0;  // pure virtual = abstraction
};

class Dog : public Animal {
public:
    void makeSound() override {
        cout << "Bark!" << endl;
    }
};
```

The user can use `makeSound()` without knowing how `Dog` implements it.

---

## 3️) Inheritance – *“Get everything your parent had, and more”*

### 🔹 What it means:

Inheritance allows a **new class (child)** to **acquire properties and behaviors** of an **existing class (parent)**. The child can also override or extend functionality.

It builds a **hierarchy** — from general to specific.

### 👨‍👦 Real-life analogy:

A child inherits traits from parents — eye color, height, etc. But they can also have traits of their own.

### 🧠 Why it matters:

* Promotes **code reusability** and avoids duplication
* Supports **hierarchical design**
* Enables polymorphism (next pillar)

### ✅ C++ Example:

```cpp
class Vehicle {
public:
    void move() {
        cout << "Moving..." << endl;
    }
};

class Car : public Vehicle {
public:
    void honk() {
        cout << "Beep beep!" << endl;
    }
};
```

`Car` can use both `move()` (inherited) and `honk()` (its own).

---

## 4️) Polymorphism – *“Same name, different behavior”*

### 🔹 What it means:

Polymorphism means **many forms**. A function or object can behave differently based on the **context** (data type, class, etc).

Two main types:

* **Compile-time (Static)** – function overloading, operator overloading
* **Runtime (Dynamic)** – method overriding via virtual functions

### 🎭 Real-life analogy:

One word — “run” — can mean different things:

* Run a program
* Run in a race
* Run your mouth 😅

### 🧠 Why it matters:

* Enables **flexible and scalable** code
* Allows different classes to be treated as the same base type
* Supports design patterns like Strategy, Factory, etc.

### ✅ C++ Example: Runtime Polymorphism

```cpp
class Shape {
public:
    virtual void draw() {
        cout << "Drawing shape" << endl;
    }
};

class Circle : public Shape {
public:
    void draw() override {
        cout << "Drawing circle" << endl;
    }
};

void render(Shape* s) {
    s->draw();  // Polymorphic call
}
```

Calling `render(new Circle())` will call `Circle`’s version of `draw()`.

---

> **Note to Self:**
> Even if some of this wasn’t taught in class, I took initiative to deepen my understanding of function usage and system-level time manipulation. Staying one step ahead.

# 📘 C++ Object-Oriented Programming Extra Concepts

## 1. 🧱 Classes and Objects

### ✅ Class
A **class** in C++ is a user-defined data type that encapsulates data members and member functions.

```cpp
class ClassName {
  // members
};
````

### ✅ Object

An **object** is an instance of a class. It is created to access class members.

```cpp
ClassName obj;
```

### 🧪 Example

```cpp
#include <iostream>
using namespace std;

class Car {
public:
    string brand;
    int year;

    void display() {
        cout << "Brand: " << brand << ", Year: " << year << endl;
    }
};

int main() {
    Car myCar;
    myCar.brand = "BMW";
    myCar.year = 2023;
    myCar.display();
    return 0;
}
```

---

## 2. 🔐 Access Specifiers

C++ has three primary access specifiers:

| Access      | Description                                        |
| ----------- | -------------------------------------------------- |
| `public`    | Members are accessible from outside the class.     |
| `private`   | Members are accessible only within the class.      |
| `protected` | Like `private`, but accessible in derived classes. |

### 🧪 Example

```cpp
class Person {
private:
    string ssn;

protected:
    string name;

public:
    void setSSN(string s) {
        ssn = s;
    }
    void displaySSN() {
        cout << "SSN: " << ssn << endl;
    }
};
```

---

## 3. 👪 Inheritance

Inheritance allows one class (child/derived) to inherit members from another class (parent/base).

### 📚 Syntax

```cpp
class DerivedClass : access_specifier BaseClass {
    // additional members
};
```

### 🧪 Example

```cpp
class Animal {
public:
    void eat() {
        cout << "This animal eats food." << endl;
    }
};

class Dog : public Animal {
public:
    void bark() {
        cout << "The dog barks." << endl;
    }
};

int main() {
    Dog d;
    d.eat();  // Inherited method
    d.bark();
    return 0;
}
```

### 🧬 Types of Inheritance

* **Single**: One base, one derived.
* **Multilevel**: Derived from a derived class.
* **Multiple**: Derived from more than one base class.
* **Hierarchical**: Multiple classes from one base.
* **Hybrid**: Combination of multiple and multilevel.

---

## 4. 🧠 Virtual Functions and Polymorphism

### 🔁 Polymorphism

Polymorphism allows the same function to behave differently depending on the object.

### 🧰 Virtual Function

A **virtual function** enables **runtime polymorphism** when accessed through a base class pointer.

### 📚 Syntax

```cpp
class Base {
public:
    virtual void show(); // virtual keyword
};
```

### 🧪 Example: Virtual Function

```cpp
class Base {
public:
    virtual void show() {
        cout << "Base class" << endl;
    }
};

class Derived : public Base {
public:
    void show() override {
        cout << "Derived class" << endl;
    }
};

int main() {
    Base* b;
    Derived d;
    b = &d;

    b->show(); // Output: Derived class
    return 0;
}
```

> If `show()` were **not virtual**, it would output `"Base class"`.

### 🔒 Virtual Destructor

Useful to ensure correct destruction when deleting derived objects through base pointers.

```cpp
class Base {
public:
    virtual ~Base() {
        cout << "Base destructor\n";
    }
};

class Derived : public Base {
public:
    ~Derived() {
        cout << "Derived destructor\n";
    }
};
```

---

## 🧾 Summary Table

| Concept               | Description                              |
| --------------------- | ---------------------------------------- |
| **Class**             | Blueprint for creating objects           |
| **Object**            | Instance of a class                      |
| **Access Specifiers** | Control visibility of class members      |
| **Inheritance**       | Mechanism to derive a class from another |
| **Virtual Function**  | Enables dynamic dispatch at runtime      |
| **Polymorphism**      | Same interface, different behavior       |

---

## 📌 Best Practices

* Keep data members `private` or `protected`.
* Use `public` member functions to provide controlled access.
* Use `virtual` destructor in base classes for safe polymorphic deletion.
* Prefer `override` keyword in derived classes for clarity.

---

> 🧠 **Tip**: Always understand the memory model and access scope when working with inheritance and polymorphism in C++.



---
Made with ♥ by Runarok


