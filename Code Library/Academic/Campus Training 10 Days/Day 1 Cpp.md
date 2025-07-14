# 🛠️ C++ Technical Training – Day 1

## 📌 Introduction
This document is a complete summary of **Day 1** of the C++ internship technical training, conducted on **14th July 2025**.

---

## ✅ Header Files

### 🔹 `#include <iostream>`
This is the standard header used for basic input and output in C++. It allows access to:
- `cin` for input
- `cout` for output
- `cerr` for error messages
- `clog` for log/debug messages

```cpp
#include <iostream>
using namespace std;

int main() {
    cout << "Hello, World!" << endl;
    return 0;
}
````

---

✍️ Comments in C++

Comments are used to explain code and are ignored by the compiler.

### 🔹 Single-Line Comment

Single-line comments start with //.

```
// This is a single-line comment
```

### 🔹 Multi-Line Comment

Multi-line comments start with /* and end with */.

```
/*
 This is a
 multi-line comment
*/
```

---

## 🔤 Variables and Data Types

In C++, variables must be declared with a data type. Here's a breakdown of basic types with code examples.

### 🔹 Integer (`int`)

Used for whole numbers.

```cpp
#include <iostream>
using namespace std;

int main() {
    int age = 20;
    cout << "Age: " << age << endl;
    return 0;
}
```

### 🔹 Float (`float`)

Used for single-precision decimal numbers.

```cpp
#include <iostream>
using namespace std;

int main() {
    float temp = 36.6f;
    cout << "Temperature: " << temp << endl;
    return 0;
}
```

### 🔹 Double (`double`)

Used for double-precision decimal values (more accurate than float).

```cpp
#include <iostream>
using namespace std;

int main() {
    double pi = 3.1415926535;
    cout << "Value of pi: " << pi << endl;
    return 0;
}
```

### 🔹 Character (`char`)

Stores a single character. Use single quotes `' '`.

```cpp
#include <iostream>
using namespace std;

int main() {
    char grade = 'A';
    cout << "Grade: " << grade << endl;
    return 0;
}
```

### 🔹 Boolean (`bool`)

Stores truth values — `true` or `false`.

```cpp
#include <iostream>
using namespace std;

int main() {
    bool isCodingFun = true;
    cout << "Is coding fun? " << isCodingFun << endl;
    return 0;
}
```

---

## 🧱 Arrays (1D Array Introduction)

Arrays allow storing multiple values of the same type in a single variable.

```cpp
#include <iostream>
using namespace std;

int main() {
    int marks[5] = {85, 90, 78, 92, 88};

    for (int i = 0; i < 5; i++) {
        cout << "Mark " << i + 1 << ": " << marks[i] << endl;
    }

    return 0;
}
```

---

## 💬 Input and Output

### 🔹 `cout` – Output to Console

Used to print values or text to the terminal.

```cpp
#include <iostream>
using namespace std;

int main() {
    cout << "Welcome to C++!" << endl;
    return 0;
}
```

### 🔹 `cin` – Input from User

Used to take input from the user via the keyboard.

```cpp
#include <iostream>
using namespace std;

int main() {
    int number;
    cout << "Enter a number: ";
    cin >> number;
    cout << "You entered: " << number << endl;
    return 0;
}
```

### 🔹 `cerr` – Error Output

Used to print error messages. It doesn't buffer output (shows immediately).

```cpp
#include <iostream>
using namespace std;

int main() {
    cerr << "An error has occurred!" << endl;
    return 0;
}
```

### 🔹 `clog` – Logging Output

Used for debugging or logging messages. Unlike `cerr`, it's buffered.

```cpp
#include <iostream>
using namespace std;

int main() {
    clog << "This is a log message." << endl;
    return 0;
}
```

---

## 🧠 Built-in Data Types Summary

<table border="1">
  <tr>
    <th>Type</th>
    <th>Description</th>
    <th>Typical Size</th>
  </tr>
  <tr>
    <td><code>int</code></td>
    <td>Whole numbers</td>
    <td>4 bytes</td>
  </tr>
  <tr>
    <td><code>float</code></td>
    <td>Decimal (less precision)</td>
    <td>4 bytes</td>
  </tr>
  <tr>
    <td><code>double</code></td>
    <td>Decimal (more precision)</td>
    <td>8 bytes</td>
  </tr>
  <tr>
    <td><code>char</code></td>
    <td>Single ASCII character</td>
    <td>1 byte</td>
  </tr>
  <tr>
    <td><code>bool</code></td>
    <td>True/False values</td>
    <td>1 byte</td>
  </tr>
</table>

---

### 🔢 1. Arithmetic Operators

<table border="1">
  <tr>
    <th>Operator</th>
    <th>Description</th>
    <th>Example (a=10, b=3)</th>
    <th>Result</th>
  </tr>
  <tr><td><code>+</code></td><td>Addition</td><td><code>a + b</code></td><td>13</td></tr>
  <tr><td><code>-</code></td><td>Subtraction</td><td><code>a - b</code></td><td>7</td></tr>
  <tr><td><code>*</code></td><td>Multiplication</td><td><code>a * b</code></td><td>30</td></tr>
  <tr><td><code>/</code></td><td>Division</td><td><code>a / b</code></td><td>3</td></tr>
  <tr><td><code>%</code></td><td>Modulo (remainder)</td><td><code>a % b</code></td><td>1</td></tr>
</table>

```cpp
#include <iostream>
using namespace std;

int main() {
    int a = 10, b = 3;
    cout << "Addition: " << (a + b) << endl;
    cout << "Subtraction: " << (a - b) << endl;
    cout << "Multiplication: " << (a * b) << endl;
    cout << "Division: " << (a / b) << endl;
    cout << "Modulo: " << (a % b) << endl;
    return 0;
}
```

---

### ⚖️ 2. Relational Operators

Used to compare two values. Returns `true (1)` or `false (0)`.

<table border="1">
  <tr>
    <th>Operator</th>
    <th>Meaning</th>
    <th>Example</th>
  </tr>
  <tr><td><code>==</code></td><td>Equal to</td><td><code>a == b</code></td></tr>
  <tr><td><code>!=</code></td><td>Not equal to</td><td><code>a != b</code></td></tr>
  <tr><td><code>></code></td><td>Greater than</td><td><code>a > b</code></td></tr>
  <tr><td><code><</code></td><td>Less than</td><td><code>a < b</code></td></tr>
  <tr><td><code>>=</code></td><td>Greater than or equal</td><td><code>a >= b</code></td></tr>
  <tr><td><code><=</code></td><td>Less than or equal</td><td><code>a <= b</code></td></tr>
</table>

```cpp
#include <iostream>
using namespace std;

int main() {
    int a = 5, b = 10;
    cout << (a == b) << endl;  // 0
    cout << (a != b) << endl;  // 1
    cout << (a > b) << endl;   // 0
    cout << (a < b) << endl;   // 1
    cout << (a >= b) << endl;  // 0
    cout << (a <= b) << endl;  // 1
    return 0;
}
```

---

### 🧠 3. Logical Operators

Used with boolean expressions.

<table border="1">
  <tr>
    <th>Operator</th>
    <th>Meaning</th>
    <th>Example</th>
  </tr>
  <tr><td><code>&&</code></td><td>Logical AND</td><td><code>a && b</code></td></tr>
  <tr><td><code>||</code></td><td>Logical OR</td><td><code>a || b</code></td></tr>
  <tr><td><code>!</code></td><td>Logical NOT</td><td><code>!a</code></td></tr>
</table>

```cpp
#include <iostream>
using namespace std;

int main() {
    bool x = true, y = false;
    cout << (x && y) << endl;  // 0
    cout << (x || y) << endl;  // 1
    cout << (!x) << endl;      // 0
    return 0;
}
```

---

### 🧮 4. Bitwise Operators

Performs bit-level operations on integers.

<table border="1">
  <tr>
    <th>Operator</th>
    <th>Meaning</th>
    <th>Example</th>
    <th>Result</th>
  </tr>
  <tr>
    <td><code>&</code></td>
    <td>Bitwise AND</td>
    <td><code>a & b</code> => <code>101 & 011</code></td>
    <td><code>001</code> (1)</td>
  </tr>
  <tr>
    <td><code>|</code></td>
    <td>Bitwise OR</td>
    <td><code>a | b</code> => <code>101 | 011</code></td>
    <td><code>111</code> (7)</td>
  </tr>
  <tr>
    <td><code>^</code></td>
    <td>Bitwise XOR</td>
    <td><code>a ^ b</code> => <code>101 ^ 011</code></td>
    <td><code>110</code> (6)</td>
  </tr>
  <tr>
    <td><code>~</code></td>
    <td>Bitwise NOT</td>
    <td><code>~a</code></td>
    <td>-6</td>
  </tr>
</table>


```cpp
#include <iostream>
using namespace std;

int main() {
    int a = 5, b = 3;
    cout << "AND: " << (a & b) << endl;
    cout << "OR: " << (a | b) << endl;
    cout << "XOR: " << (a ^ b) << endl;
    cout << "NOT: " << (~a) << endl;
    return 0;
}
```

---

### 🔀 5. Shift Operators

Shift bits left or right.

<table border="1">
  <tr>
    <th>Operator</th>
    <th>Meaning</th>
    <th>Example (x=5)</th>
    <th>Result</th>
  </tr>
  <tr><td><code>&lt;&lt;</code></td><td>Left shift (×2)</td><td><code>x << 1</code></td><td>10</td></tr>
  <tr><td><code>&gt;&gt;</code></td><td>Right shift (÷2)</td><td><code>x >> 1</code></td><td>2</td></tr>
</table>


```cpp
#include <iostream>
using namespace std;

int main() {
    int x = 5;
    cout << "Left Shift: " << (x << 1) << endl;
    cout << "Right Shift: " << (x >> 1) << endl;
    return 0;
}
```

---

### ❓ 6. Conditional Operator (Ternary)

Short form of if-else.

```cpp
condition ? value_if_true : value_if_false;
```

```cpp
#include <iostream>
using namespace std;

int main() {
    int a = 10, b = 20;
    int max = (a > b) ? a : b;
    cout << "Max: " << max << endl;
    return 0;
}
```

---

### 🧾 7. Assignment Operators

Used to assign or update variables.

<table border="1">
  <tr>
    <th>Operator</th>
    <th>Meaning</th>
    <th>Example (x = 10)</th>
    <th>Result</th>
  </tr>
  <tr><td><code>=</code></td><td>Assign</td><td><code>x = 10</code></td><td>10</td></tr>
  <tr><td><code>+=</code></td><td>Add and assign</td><td><code>x += 5</code></td><td>15</td></tr>
  <tr><td><code>-=</code></td><td>Subtract and assign</td><td><code>x -= 2</code></td><td>13</td></tr>
  <tr><td><code>*=</code></td><td>Multiply and assign</td><td><code>x *= 3</code></td><td>39</td></tr>
  <tr><td><code>/=</code></td><td>Divide and assign</td><td><code>x /= 3</code></td><td>13</td></tr>
  <tr><td><code>%=</code></td><td>Modulo and assign</td><td><code>x %= 6</code></td><td>1</td></tr>
</table>


```cpp
#include <iostream>
using namespace std;

int main() {
    int x = 10;
    x += 5;   // 15
    x -= 2;   // 13
    x *= 3;   // 39
    x /= 3;   // 13
    x %= 6;   // 1
    cout << "Final x: " << x << endl;
    return 0;
}
```

---

### ➕ 8. Increment & Decrement Operators

<table border="1">
  <tr>
    <th>Operator</th>
    <th>Meaning</th>
    <th>Example</th>
    <th>Explanation</th>
  </tr>
  <tr><td><code>++x</code></td><td>Pre-increment</td><td><code>++x</code></td><td>Increments first, then uses value</td></tr>
  <tr><td><code>x++</code></td><td>Post-increment</td><td><code>x++</code></td><td>Uses value, then increments</td></tr>
  <tr><td><code>--x</code></td><td>Pre-decrement</td><td><code>--x</code></td><td>Decrements first, then uses value</td></tr>
  <tr><td><code>x--</code></td><td>Post-decrement</td><td><code>x--</code></td><td>Uses value, then decrements</td></tr>
</table>


```cpp
#include <iostream>
using namespace std;

int main() {
    int x = 5;
    cout << "Post-increment: " << x++ << endl; // 5
    cout << "After post: " << x << endl;       // 6
    cout << "Pre-increment: " << ++x << endl;  // 7
    cout << "Pre-decrement: " << --x << endl;  // 6
    cout << "Post-decrement: " << x-- << endl; // 6
    cout << "After post: " << x << endl;       // 5
    return 0;
}
```

---
