# **C++ Object-Oriented Programming (OOP) – Concepts & Practice**

---

## **What is OOP?**

**OOP** stands for **Object-Oriented Programming**.  
It is a programming paradigm focused on modeling real-world entities as "objects" containing **data** (attributes) and **functions** (methods).

### **Example: Car as an Object**

- **Attributes (Data):**  
  - `brand`
  - `speed`
  - `fuel`

- **Behaviors (Methods):**  
  - `start()`
  - `accelerate()`
  - `brake()`

---

## **Key Pillars of OOP**

1. **Encapsulation**  
   Bundle data and methods together; hide internal details.
2. **Abstraction**  
   Expose only essential features; hide complex implementation.
3. **Inheritance**  
   Reuse attributes and methods from other classes.
4. **Polymorphism**  
   Same interface or function behaves differently for different objects.

---

## **Advantages of OOP**

- Structured and organized code
- Easier maintenance, debugging, and extension
- Promotes **DRY** (Don't Repeat Yourself) by reusing code
- Enables rapid development of robust, reusable applications

> **Tip:**  
> The **DRY** principle encourages moving repeated code into functions or classes, so you can reuse logic and reduce errors.

---

## **Classes and Objects**

- A **class** defines the blueprint for objects (attributes + methods).
- An **object** is an instance of a class, holding real data and behavior.
- When you create an object, it inherits all the members (variables and functions) of its class.

---

## **Procedural vs Object-Oriented Programming**

|               | Procedural Programming        | Object-Oriented Programming      |
|:-------------:|:----------------------------:|:-------------------------------:|
| Organization  | Around functions             | Around objects (data + methods) |
| Data Handling | Separate from functions      | Bundled with methods            |
| Reusability   | Via functions                | Via inheritance & polymorphism  |

---

## **Encapsulation**

### **Definition**

Encapsulation means **binding data and methods** into a single unit (class) and **restricting direct access** to some members.

### **Real-World Analogy**

**Bank ATM:**  
You interact with ATM via its interface (insert card, enter PIN, withdraw), but you cannot access its internal database directly.

### **Benefits**

- Protects data from unauthorized access
- Prevents accidental modification
- Controls how data is viewed or changed

---

## **Access Modifiers in C++**

C++ uses access modifiers to control visibility:

| Modifier      | Access Level                      | Usage                        |
|:-------------:|:---------------------------------:|:----------------------------:|
| `private:`    | Only inside the same class        | Data protection (encapsulation) |
| `public:`     | Any part of the program           | External interface           |
| `protected:`  | Inside class & derived classes    | Inheritance support          |

---

## **Class Methods**

Methods are functions defined within a class. They can be:

- **Inside the class definition**
- **Outside the class definition** (using scope resolution operator `::`)

Access methods via object and dot notation, e.g., `obj.myMethod();`

---

## **Constructors in C++**

A **constructor** is a special method with:

- **Same name as the class**
- **No return type** (not even `void`)
- **Called automatically** when object is created
- **Usually declared public**

**Purpose:** Initialize object data when it is created.

---

## **Inheritance**

Inheritance allows a class (derived/child) to **reuse** and **extend** attributes and methods from another class (base/parent).

**Syntax:**  
`class Derived : access_modifier Base { ... };`

**Example:**  
A `Car` class inherits from a `Vehicle` class.

---

## **Polymorphism**

Polymorphism means **"many forms"**.  
It lets you use a common interface to represent different underlying forms (data types).

### **Example: Animal Sounds**

- **Base class:** `Animal` with method `makeSound()`
- **Derived classes:** `Pig`, `Dog`, `Bird` override `makeSound()`  
  - Pig: `wee wee`  
  - Dog: `bow wow`  
  - Bird: `tweet tweet`

> The same method (`makeSound()`) behaves differently for each type.

---

# **OOP Practice Programs**

### 1. **Single Inheritance**

Create a class `Person` with method `showName()`.  
Create derived class `Student` with method `showRollNo()`.  
Show how a `Student` object accesses both methods.

### 2. **Multi-level Inheritance**

Create class `Vehicle`, derived class `Car`, and another derived class `ElectricCar`.  
Show how an `ElectricCar` object accesses methods from all three classes.

### 3. **Multiple Inheritance**

Create class `Keyboard` and class `Screen`.  
Derive class `Laptop` from both.  
Show how `Laptop` uses both base class methods.

### 4. **Base Class Methods**

Create class `Shape` with method `draw()`.  
Derive classes `Circle` and `Rectangle`.  
Show how derived classes use base method.

### 5. **Runtime Polymorphism (Virtual Functions)**

Create base class `Shape` with method `area()`.  
Derive classes `Circle` and `Square`, override `area()` in both.  
Use base class pointer to call `area()` for each shape.

### 6. **Function Overloading**

Create class `Calculator` with two `add()` methods:  
- One adds two integers  
- One adds three floats

### 7. **Abstract Class / Pure Virtual Function**

Create abstract class `Animal` with pure virtual function `makeSound()`.  
Derive classes `Cat`, `Dog`, and `Cow`, implement `makeSound()` in each.  
In `main()`, use an array of `Animal*` to call `makeSound()` for each.

---

> These examples cover key OOP concepts and common interview patterns.  
> Use them to solidify your understanding and prepare for technical interviews!
