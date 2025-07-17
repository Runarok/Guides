# 📘 Campus Training – Day 2

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
