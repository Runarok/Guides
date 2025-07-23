# **C++ OOP**

## **C++ What is OOP?**

OOP stands for Object-Oriented Programming.

Object-oriented programming is about creating "objects", which can hold **data** and **functions** that work on that data.

Think of a **Car**:

* **Data**: brand, speed, fuel

* **Behavior**: start(), accelerate(), brake()

### **Key Pillars of OOP**

1. **Encapsulation** – Hiding data inside objects

2. **Abstraction** – Hiding complexity, showing only essentials

3. **Inheritance** – Reusing properties and methods from other classes

4. **Polymorphism** – Same function behaves differently in different contexts

## **Advantages of OOP**

* OOP provides a clear structure to programs  
* Makes code easier to maintain, reuse, and debug  
* Helps keep your code DRY (**Don't Repeat Yourself**)  
* Makes it possible to create full reusable applications with less code and shorter development time

**Tip:** The **DRY** principle means you should avoid writing the same code more than once. Move repeated code into functions or classes and **reuse it**.

## **What are Classes and Objects?**

Classes and objects are the two main aspects of object-oriented programming.

A class defines what an object should look like, and an object is created based on that class.

When you create an object from a class, it inherits all the **variables** and **functions** defined inside that class.

## **Procedural vs Object-Oriented Programming**

**Procedural programming** is about writing functions that operate on data.

**Object-oriented programming (OOP)** is about creating objects that contain both the data and the functions.

In procedural programming, the code is organized around functions.  
In object-oriented programming, the code is organized around objects.

**What is Encapsulation?**

### **Definition**

**Encapsulation** is the process of **binding data and methods** together into a single unit (a class) and **restricting direct access** to some of the object's components.

### **Real-world Analogy**

A **Bank ATM**:

* You can't see or access the internal database

* You can **only** use the interface: insert card, type PIN, withdraw

### **Why Use Encapsulation?**

* Protect data from unwanted access

* Prevent misuse or accidental changes

* Control how data is accessed or modified

## **Access Modifiers in C++**

C++ provides **access control** through **modifiers**:

| Modifier | Access Level | Can Access |
| ----- | ----- | ----- |
| `private:` | Only from within the same class | Encapsulated Data |
| `public:` | Anywhere in the program | Interface |
| `protected:` | Inside the class and derived (child) classes | Used in Inheritance |

## **Class Methods**

Methods are **functions** that belongs to the class.

There are two ways to define functions that belongs to a class:

* Inside class definition  
* Outside class definition

---

## **Define a Method Inside the Class**

In the following example, we define a function inside the class, and we name it "`myMethod`".

**Note:** You access methods just like you access attributes; by creating an object of the class and using the dot syntax (`.`):

## **Constructors**

A constructor is a **special method** that is automatically called when an object of a class is created.

To create a constructor, use the same name as the class, followed by parentheses `()`:

### **Constructor Rules**

* The constructor has the **same name as the class**.  
* It has **no return type** (not even `void`).  
* It is usually declared **public**.  
* It is **automatically called** when an object is created  
* 

## **Inheritance**

**Inheritance** allows one class to reuse attributes and methods from another class. It helps you write cleaner, more efficient code by avoiding duplication.

We group the "inheritance concept" into two categories:

* **derived class** (child) \- the class that inherits from another class  
* **base class** (parent) \- the class being inherited from

To inherit from a class, use the `:` symbol.

In the example below, the `Car` class (child) inherits the attributes and methods from the `Vehicle` class (parent):

.

## **Polymorphism**

Polymorphism means "many forms", and it occurs when we have many classes that are related to each other by inheritance.

Like we specified in the previous chapter; [**Inheritance**](https://www.w3schools.com/cpp/cpp_inheritance.asp) lets us inherit attributes and methods from another class. **Polymorphism** uses those methods to perform different tasks. This allows us to perform a single action in different ways.

For example, imagine a base class **Animal** with a method called `makeSound()`. Derived classes of Animals could be Pigs, Cats, Dogs, Birds, etc. Every animal can "make a sound", but each one sounds different:

* **Pig:** wee wee  
* **Dog:** bow wow  
* **Bird:** tweet tweet

This is polymorphism \- the same action (making a sound) behaves differently for each animal:

### Programs

1\. Create a class Person with a method showName(). Create a derived class Student that adds a method showRollNo(). Show how a Student object can access both methods.

2\. Create a class Vehicle, derived class Car, and another derived class ElectricCar. Show how an ElectricCar object can access methods from all three classes.

3\. Create a class Keyboard and class Screen. Derive a class Laptop from both. Show how Laptop can use both base class methods.

4.Create a class Shape with a method draw(). Derive two classes Circle and Rectangle. Show how both derived classes can use the base method.

5\. Create a base class Shape with a method area(). Derive classes Circle and Square, and override the area() method in both to print specific messages. Use a base class pointer to call area() for each shape.

6\. Create a class Calculator with two add() methods:  
    One that adds two integers.  
    One that adds three floats.

7\. Create an abstract class Animal with a pure virtual function makeSound(). Derive classes Cat, Dog, and Cow and implement makeSound() in each. In main(), use an array of Animal\* to call makeSound() for each.

