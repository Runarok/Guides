

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


