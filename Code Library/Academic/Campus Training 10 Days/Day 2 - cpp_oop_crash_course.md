# C++ Object-Oriented Programming (OOP) Crash Course

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
