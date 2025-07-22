## 📑 Table of Contents

### [Q&A Section (OOP Concepts)](#oops-concepts)
1. [Inheritance: Accessing Base and Derived Class Methods](#1-inheritance-accessing-base-and-derived-class-methods)
2. [Multilevel Inheritance](#2-multilevel-inheritance)
3. [Multiple Inheritance](#3-multiple-inheritance)
4. [Hierarchical Inheritance](#4-hierarchical-inheritance)
5. [Virtual Functions and Polymorphism](#5-virtual-functions-and-polymorphism)
6. [Function Overloading](#6-function-overloading)
7. [Abstract Class and Runtime Polymorphism](#7-abstract-class-and-runtime-polymorphism)

---

### [OOP Projects Section](#c-oop-projects)
1. [Warm-Up: Student Report Card Generator](#1a-warm-up-student-report-card-generator)
2. [Smart Payment System](#2-smart-payment-system)
3. [Vehicle Rental System Simulator](#3-vehicle-rental-system-simulator)

---

### [OOP Assignment – C++ OLD Practice](#oop-assignment-practice)
1. [Inheritance: Accessing Base and Derived Class Methods](#q1)
2. [Multilevel Inheritance with ElectricCar](#q2)
3. [Multiple Inheritance: Laptop Example](#q3)
4. [Hierarchical Inheritance: Shape, Circle, Rectangle](#q4)
5. [Encapsulation with BankAccount Class](#q5)


--- 

### [Python Lab Questions & Solutions](#-python-lab-questions--solutions)

---

##  [📘 Interview Questions on Sorting – With Stack Overflow References](#interview-questions-on-sorting--with-stack-overflow-references)

1. [Google | 2022 – Memory-Efficient Sorting for Large List](#q1-google--2022--round-2-technical)
2. [Amazon | 2023 – Quick Sort with Partition Steps](#q2-amazon--2023--online-assessment-round)
3. [Microsoft | 2021 – Insertion Sort on Employee Records](#q3-microsoft--2021--technical-phone-screen)
4. [TCS Digital | 2023 – Bubble Sort with Swap Count](#q4-tcs-digital--2023--coding-round)
5. [Infosys | 2022 – Selection Sort with Min Index Print](#q5-infosys--2022--system-engineer-role)
6. [Capgemini | 2021 – Merge Sort with Recursive Call Count](#q6-capgemini--2021--tech-round)
7. [Zoho | 2020 – Quick Sort Descending + Median](#q7-zoho--2020--onsite-coding-round)
8. [Accenture | 2023 – Counting Sort with Mode](#q8-accenture--2023--final-round)
9. [IBM | 2022 – Radix Sort with Digit-wise Output](#q9-ibm--2022--coding-round)
10. [Wipro | 2023 – Alphabetical Selection Sort on Words](#q10-wipro--2023--campus-placement-round-1)

---
---

# OOPs Concepts
### **1. Inheritance: Accessing Base and Derived Class Methods**

**Question:**
Create a class `Person` with a method `showName()`. Create a derived class `Student` that adds a method `showRollNo()`. Show how a `Student` object can access both methods.

**Code:**

```cpp
#include <iostream>
using namespace std;

class Person {
public:
    void showName() {
        cout << "Name: John Doe" << endl;
    }
};

class Student : public Person {
public:
    void showRollNo() {
        cout << "Roll No: 101" << endl;
    }
};

int main() {
    Student s;
    s.showName();    // From Person
    s.showRollNo();  // From Student
    return 0;
}
```
View code in a file: [Inheritance1.cpp](assets/Q&A/Inheritance1.cpp)

---

### **2. Multilevel Inheritance**

**Question:**
Create a class `Vehicle`, derived class `Car`, and another derived class `ElectricCar`. Show how an `ElectricCar` object can access methods from all three classes.

**Code:**

```cpp
#include <iostream>
using namespace std;

class Vehicle {
public:
    void showType() {
        cout << "Type: Vehicle" << endl;
    }
};

class Car : public Vehicle {
public:
    void showBrand() {
        cout << "Brand: Toyota" << endl;
    }
};

class ElectricCar : public Car {
public:
    void showBattery() {
        cout << "Battery: 80 kWh" << endl;
    }
};

int main() {
    ElectricCar e;
    e.showType();     // From Vehicle
    e.showBrand();    // From Car
    e.showBattery();  // From ElectricCar
    return 0;
}
```
View code in a file: [MultilevelInheritance.cpp](assets/Q&A/MultilevelInheritance.cpp)

---

### **3. Multiple Inheritance**

**Question:**
Create a class `Keyboard` and class `Screen`. Derive a class `Laptop` from both. Show how `Laptop` can use both base class methods.

**Code:**

```cpp
#include <iostream>
using namespace std;

class Keyboard {
public:
    void input() {
        cout << "Keyboard input detected" << endl;
    }
};

class Screen {
public:
    void display() {
        cout << "Displaying on screen" << endl;
    }
};

class Laptop : public Keyboard, public Screen {
};

int main() {
    Laptop l;
    l.input();    // From Keyboard
    l.display();  // From Screen
    return 0;
}
```
View code in a file: [MultipleInheritance.cpp](assets/Q&A/MultipleInheritance.cpp)

---

### **4. Hierarchical Inheritance**

**Question:**
Create a class `Shape` with a method `draw()`. Derive two classes `Circle` and `Rectangle`. Show how both derived classes can use the base method.

**Code:**

```cpp
#include <iostream>
using namespace std;

class Shape {
public:
    void draw() {
        cout << "Drawing shape" << endl;
    }
};

class Circle : public Shape {
};

class Rectangle : public Shape {
};

int main() {
    Circle c;
    Rectangle r;
    c.draw();  // From Shape
    r.draw();  // From Shape
    return 0;
}
```
View code in a file: [HierarchicalInheritance.cpp](assets/Q&A/HierarchicalInheritance.cpp)

---

### **5. Virtual Functions and Polymorphism**

**Question:**
Create a base class `Shape` with a method `area()`. Derive classes `Circle` and `Square`, and override the `area()` method in both to print specific messages. Use a base class pointer to call `area()` for each shape.

**Code:**

```cpp
#include <iostream>
using namespace std;

class Shape {
public:
    virtual void area() {
        cout << "Area of generic shape" << endl;
    }
};

class Circle : public Shape {
public:
    void area() override {
        cout << "Area of circle = πr²" << endl;
    }
};

class Square : public Shape {
public:
    void area() override {
        cout << "Area of square = side²" << endl;
    }
};

int main() {
    Shape* s;
    Circle c;
    Square sq;

    s = &c;
    s->area();  // Calls Circle's area()

    s = &sq;
    s->area();  // Calls Square's area()

    return 0;
}
```
View code in a file: [VirtualFunctions.cpp](assets/Q&A/VirtualFunctions.cpp)

---

### **6. Function Overloading**

**Question:**
Create a class `Calculator` with two `add()` methods:

* One that adds two integers.
* One that adds three floats.

**Code:**

```cpp
#include <iostream>
using namespace std;

class Calculator {
public:
    int add(int a, int b) {
        return a + b;
    }

    float add(float a, float b, float c) {
        return a + b + c;
    }
};

int main() {
    Calculator calc;
    cout << "Sum of 2 and 3: " << calc.add(2, 3) << endl;
    cout << "Sum of 1.1, 2.2, and 3.3: " << calc.add(1.1f, 2.2f, 3.3f) << endl;
    return 0;
}
```
View code in a file: [FunctionOverloading.cpp](assets/Q&A/FunctionOverloading.cpp)

---

### **7. Abstract Class and Runtime Polymorphism**

**Question:**
Create an abstract class `Animal` with a pure virtual function `makeSound()`. Derive classes `Cat`, `Dog`, and `Cow` and implement `makeSound()` in each. In `main()`, use an array of `Animal` pointers to call `makeSound()` for each.

**Code:**

```cpp
#include <iostream>
using namespace std;

class Animal {
public:
    virtual void makeSound() = 0;  // Pure virtual function
};

class Cat : public Animal {
public:
    void makeSound() override {
        cout << "Cat: Meow" << endl;
    }
};

class Dog : public Animal {
public:
    void makeSound() override {
        cout << "Dog: Woof" << endl;
    }
};

class Cow : public Animal {
public:
    void makeSound() override {
        cout << "Cow: Moo" << endl;
    }
};

int main() {
    Animal* animals[3];
    Cat c;
    Dog d;
    Cow cw;

    animals[0] = &c;
    animals[1] = &d;
    animals[2] = &cw;

    for (int i = 0; i < 3; i++) {
        animals[i]->makeSound();
    }

    return 0;
}
```
View code in a file: [AbstractClass.cpp](assets/Q&A/AbstractClass.cpp)

---

---

# C++ OOP Projects

This document contains 3 structured projects built using **Object-Oriented Programming** principles.

---

## 1A. Warm-Up: Student Report Card Generator

### Objective:
- Take a student’s name
- Input marks for 5 subjects (out of 100)
- Calculate total, percentage, and grade
- Display formatted result

### Grading Scheme:

| Percentage   | Grade  |
|--------------|--------|
| 90 – 100     | A+     |
| 75 – 89      | A      |
| 60 – 74      | B      |
| 40 – 59      | C      |
| Below 40     | F (Fail) |

### 💻 Code:

```cpp
#include <iostream>
#include <string>
using namespace std;

class Student {
private:
    string name;
    int marks[5];
    int total = 0;
    float percentage = 0.0;
    string grade;

public:
    void inputDetails() {
        cout << "Enter your name: ";
        getline(cin, name);

        cout << "Enter marks for 5 subjects (out of 100):" << endl;
        for (int i = 0; i < 5; i++) {
            do {
                cout << "Subject " << i + 1 << ": ";
                cin >> marks[i];

                if (marks[i] < 0 || marks[i] > 100)
                    cout << "Invalid mark. Please enter between 0 and 100.\n";
            } while (marks[i] < 0 || marks[i] > 100);
            total += marks[i]; 
        }

        percentage = total / 5.0;
        assignGrade();
    }

    void assignGrade() {
        if (percentage >= 90) grade = "A+";
        else if (percentage >= 75) grade = "A";
        else if (percentage >= 60) grade = "B";
        else if (percentage >= 40) grade = "C";
        else grade = "F (Fail)";
    }

    void displayResult() {
        cout << "\n--- Result ---" << endl;
        cout << "Name: " << name << endl;
        cout << "Total Marks: " << total << " / 500" << endl;
        cout << "Percentage: " << percentage << "%" << endl;
        cout << "Grade: " << grade << endl;
    }
};

int main() {
    Student s;
    s.inputDetails();
    s.displayResult();
    return 0;
}

```
[View full code file](assets/projects/student_report_card.cpp)

---

## 2. Smart Payment System

### Objective:

- Define a general interface PaymentMethod
- Implement multiple payment types (CreditCard, PayPal, UPI)
- Use polymorphism to dynamically handle different payments


### OOP Concepts Used:

- Abstract class/interface
- Inheritance
- Runtime Polymorphism (via virtual functions)


### Code:

```cpp
#include <iostream>
using namespace std;

// Abstract base class
class PaymentMethod {
public:
    virtual void pay(float amount) = 0;  // Pure virtual function
};

// Derived classes
class CreditCard : public PaymentMethod {
public:
    void pay(float amount) override {
        cout << "Paid ₹" << amount << " using Credit Card." << endl;
    }
};

class PayPal : public PaymentMethod {
public:
    void pay(float amount) override {
        cout << "Paid ₹" << amount << " using PayPal." << endl;
    }
};

class UPI : public PaymentMethod {
public:
    void pay(float amount) override {
        cout << "Paid ₹" << amount << " via UPI." << endl;
    }
};

// Driver
int main() {
    PaymentMethod* payment;

    CreditCard cc;
    PayPal pp;
    UPI upi;

    payment = &cc;
    payment->pay(1000.00);

    payment = &pp;
    payment->pay(500.50);

    payment = &upi;
    payment->pay(299.99);

    return 0;
}
```
[View full code file](assets/projects/smart_payment_system.cpp)

---

## 3. Vehicle Rental System Simulator

### Objective:

- Allow customer to rent different types of vehicles (Car, Bike, Truck)
- Each vehicle type has different rental charges
- System calculates total cost based on type and number of days


### OOP Concepts Used:

- Base class + inheritance
- Polymorphism for dynamic behavior
- Encapsulation for internal rate logic


💻 Code:

```cpp
#include <iostream>
using namespace std;

class Vehicle {
public:
    virtual void rent(int days) = 0;  // Pure virtual method
};

class Car : public Vehicle {
public:
    void rent(int days) override {
        float rate = 1000;
        cout << "Car rented for " << days << " days. Total: ₹" << days * rate << endl;
    }
};

class Bike : public Vehicle {
public:
    void rent(int days) override {
        float rate = 300;
        cout << "Bike rented for " << days << " days. Total: ₹" << days * rate << endl;
    }
};

class Truck : public Vehicle {
public:
    void rent(int days) override {
        float rate = 2000;
        cout << "Truck rented for " << days << " days. Total: ₹" << days * rate << endl;
    }
};

int main() {
    int choice, days;
    Vehicle* v;

    cout << "Choose vehicle type to rent:\n1. Car\n2. Bike\n3. Truck\nChoice: ";
    cin >> choice;
    cout << "Enter number of rental days: ";
    cin >> days;

    switch (choice) {
        case 1: v = new Car(); break;
        case 2: v = new Bike(); break;
        case 3: v = new Truck(); break;
        default: cout << "Invalid choice"; return 0;
    }

    v->rent(days);
    delete v;  // Clean up
    return 0;
}
```
[View full code file](assets/projects/vehicle_rental_simulator.cpp)

---

---

# OOP Assignment Practice

Each question builds on key OOP principles: **inheritance, encapsulation, and multiple inheritance.**

---

## Q1.  
**Create a class `Person` with a method `showName()`. Create a derived class `Student` that adds a method `showRollNo()`.  
Show how a `Student` object can access both methods.**

### ✅ Answer:

```cpp
#include <iostream>
using namespace std;

class Person {
public:
    void showName() {
        cout << "Name: Runarok" << endl;
    }
};

class Student : public Person {
public:
    void showRollNo() {
        cout << "Roll No: 12345" << endl;
    }
};

int main() {
    Student s;
    s.showName();    // Inherited from Person
    s.showRollNo();  // Own method
    return 0;
}
````

---

## Q2.

**Create a class `Vehicle`, derived class `Car`, and another derived class `ElectricCar`.
Show how an `ElectricCar` object can access methods from all three classes.**

### ✅ Answer:

```cpp
#include <iostream>
using namespace std;

class Vehicle {
public:
    void move() {
        cout << "Vehicle is moving" << endl;
    }
};

class Car : public Vehicle {
public:
    void fuelType() {
        cout << "Fuel: Petrol/Diesel" << endl;
    }
};

class ElectricCar : public Car {
public:
    void charge() {
        cout << "Charging Electric Car" << endl;
    }
};

int main() {
    ElectricCar ec;
    ec.move();      // From Vehicle
    ec.fuelType();  // From Car
    ec.charge();    // From ElectricCar
    return 0;
}
```

---

## Q3.

**Create a class `Keyboard` and class `Screen`.
Derive a class `Laptop` from both.
Show how `Laptop` can use both base class methods.**

### ✅ Answer:

```cpp
#include <iostream>
using namespace std;

class Keyboard {
public:
    void type() {
        cout << "Typing on keyboard" << endl;
    }
};

class Screen {
public:
    void display() {
        cout << "Displaying on screen" << endl;
    }
};

class Laptop : public Keyboard, public Screen {
public:
    void specs() {
        cout << "Laptop with 16GB RAM and SSD" << endl;
    }
};

int main() {
    Laptop l;
    l.type();     // From Keyboard
    l.display();  // From Screen
    l.specs();    // Own method
    return 0;
}
```

---

## Q4.

**Create a class `Shape` with a method `draw()`. Derive two classes `Circle` and `Rectangle`.
Show how both derived classes can use the base method.**

### ✅ Answer:

```cpp
#include <iostream>
using namespace std;

class Shape {
public:
    void draw() {
        cout << "Drawing a shape" << endl;
    }
};

class Circle : public Shape {
public:
    void circleSpecific() {
        cout << "Drawing a circle" << endl;
    }
};

class Rectangle : public Shape {
public:
    void rectangleSpecific() {
        cout << "Drawing a rectangle" << endl;
    }
};

int main() {
    Circle c;
    Rectangle r;

    c.draw();              // From Shape
    c.circleSpecific();    // Own

    r.draw();              // From Shape
    r.rectangleSpecific(); // Own

    return 0;
}
```

---

## Q5.

\*\*Write a C++ class called `BankAccount` that uses encapsulation.

* Set and get the account number
* Deposit and withdraw money (with balance validation)
* Display current balance\*\*

### ✅ Answer:

```cpp
#include <iostream>
using namespace std;

class BankAccount {
private:
    int accountNumber;
    double balance;

public:
    BankAccount() {
        balance = 0;
    }

    void setAccountNumber(int accNo) {
        accountNumber = accNo;
    }

    int getAccountNumber() {
        return accountNumber;
    }

    void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            cout << "Deposited: " << amount << endl;
        } else {
            cout << "Invalid deposit amount" << endl;
        }
    }

    void withdraw(double amount) {
        if (amount <= balance && amount > 0) {
            balance -= amount;
            cout << "Withdrawn: " << amount << endl;
        } else {
            cout << "Insufficient balance or invalid amount" << endl;
        }
    }

    void showBalance() {
        cout << "Current Balance: " << balance << endl;
    }
};

int main() {
    BankAccount b;
    b.setAccountNumber(98765);
    cout << "Account No: " << b.getAccountNumber() << endl;

    b.deposit(5000);
    b.withdraw(2000);
    b.showBalance();

    return 0;
}
```

---
---

# 🐍 Python Lab Questions & Solutions

## 1. Find the Maximum Element in a List
```python
lst = [10, 20, 30, 5]
print(max(lst))
````

---

## 2. Print First 3 Elements of a List and Reverse the List

```python
lst = [1, 2, 3, 4, 5]
print(lst[:3])    # First 3 elements
print(lst[::-1])  # Reversed list
```

---

## 3. Remove Duplicates from a List

```python
lst = [1, 2, 2, 3, 4, 4]
lst = list(set(lst))
print(lst)
```

---

## 4. List Comprehension to Square Numbers

```python
lst = [1, 2, 3, 4]
squares = [x * x for x in lst]
print(squares)
```

---

## 5. Use Tuple as a Dictionary Key

```python
d = {(1, 2): "tuple as key"}
print(d)
```

---

## 6. Pack and Unpack a Tuple

```python
tup = (1, 2, 3)
a, b, c = tup
print(a, b, c)
```

---

## 7. Count Frequency of Words in a String

```python
s = "apple orange apple banana"
d = {}
for word in s.split():
    d[word] = d.get(word, 0) + 1
print(d)
```

---

## 8. Invert a Dictionary

```python
d = {'a': 1, 'b': 2}
inv = {v: k for k, v in d.items()}
print(inv)
```

---

## 9. Print Keys and Values from a Dictionary

```python
student_scores = {"Alex": 90, "Raj": 85}
for name, score in student_scores.items():
    print(name, score)
```

---

## 10. Store Student Records as Tuples in a List and Use Dictionary for Lookup

```python
records = [("Alex", 20), ("Raj", 21)]
lookup = {name: age for (name, age) in records}
print(lookup["Alex"])  # Lookup example
```

# === Python List, Tuple, and Dictionary Operations ===

```python
# 1. Find the Maximum Element in a List
lst = [10, 20, 30, 5]
print(max(lst))

# 2. Print First 3 Elements of a List and Reverse the List
lst = [1, 2, 3, 4, 5]
print(lst[:3])    # First 3 elements
print(lst[::-1])  # Reversed list

# 3. Remove Duplicates from a List
lst = [1, 2, 2, 3, 4, 4]
lst = list(set(lst))
print(lst)

# 4. List Comprehension to Square Numbers
lst = [1, 2, 3, 4]
squares = [x * x for x in lst]
print(squares)

# 5. Use Tuple as a Dictionary Key
d = {(1, 2): "tuple as key"}
print(d)

# 6. Pack and Unpack a Tuple
tup = (1, 2, 3)
a, b, c = tup
print(a, b, c)

# 7. Count Frequency of Words in a String
s = "apple orange apple banana"
d = {}
for word in s.split():
    d[word] = d.get(word, 0) + 1
print(d)

# 8. Invert a Dictionary
d = {'a': 1, 'b': 2}
inv = {v: k for k, v in d.items()}
print(inv)

# 9. Print Keys and Values from a Dictionary
student_scores = {"Alex": 90, "Raj": 85}
for name, score in student_scores.items():
    print(name, score)

# 10. Store Student Records as Tuples in a List and Use Dictionary for Lookup
records = [("Alex", 20), ("Raj", 21)]
lookup = {name: age for (name, age) in records}
print(lookup["Alex"])  # Lookup example
```

---
---

### 📘 **Interview Questions on Sorting – With Stack Overflow References**

---

#### **Q1. Google | 2022 | Round 2 (Technical)**

**Problem:**
Given a large list of 1 million integers, some repeated, design and implement a sorting function that is memory-efficient and fast.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/12748246/sorting-1-million-8-decimal-digit-numbers-with-1-mb-of-ram)

---

#### **Q2. Amazon | 2023 | Online Assessment Round**

**Problem:**
You are given a list of product prices. Implement **Quick Sort** to sort them in ascending order.
Also, print the list after **each partition** step.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/18262306/quicksort-with-python)

---

#### **Q3. Microsoft | 2021 | Technical Phone Screen**

**Problem:**
Sort a list of employee records (name and ID) by **name** using **Insertion Sort**.
If names are equal, use **ID as a tie-breaker**.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/29288367/how-to-count-number-of-swaps-in-a-bubble-sort)

---

#### **Q4. TCS Digital | 2023 | Coding Round**

**Problem:**
Write a program to sort **N integers using Bubble Sort** and count the **number of swaps** done.
Print the sorted list and total swap count.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/29288367/how-to-count-number-of-swaps-in-a-bubble-sort)

---

#### **Q5. Infosys | 2022 | System Engineer Role**

**Problem:**
Write a function that sorts an array using **Selection Sort**.
Print the **index of the minimum value** found in each iteration.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/69057837/sorting-an-array-using-selection-sort)

---

#### **Q6. Capgemini | 2021 | Tech Round**

**Problem:**
Implement **Merge Sort** to sort a list of floating-point numbers.
Also return how many total **recursive calls** were made.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/46775181/mergesort-maximum-number-of-recursive-calls)

---

#### **Q7. Zoho | 2020 | Onsite Coding Round**

**Problem:**
Given a list of student marks, **sort them in descending order** using **Quick Sort**.
Also, **calculate the median** of the sorted list.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/708698/how-can-i-sort-a-list-alphabetically)

---

#### **Q8. Accenture | 2023 | Final Round**

**Problem:**
Using **Counting Sort**, sort a list of 0–99 scores and find the **most frequently occurring score**.
Return the **sorted list and the mode**.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/6987285/find-the-item-with-maximum-occurrences-in-a-list)

---

#### **Q9. IBM | 2022 | Coding Round**

**Problem:**
Implement **Radix Sort** on a list of **6-digit zip codes**.
Print the list after sorting by **each digit place**.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/67750089/radix-sort-using-array-of-linked-list-as-bin-in-c)

---

#### **Q10. Wipro | 2023 | Campus Placement (Round 1)**

**Problem:**
You’re given a string of lowercase words. **Sort them alphabetically** using **Selection Sort**.
Do **not** use Python's built-in `sort()` or `sorted()` functions.

> 🔗 [Stack Overflow Reference](https://stackoverflow.com/questions/28136374/python-sort-strings-alphabetically-lowercase-first)

---


