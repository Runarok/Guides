

# 🚀 C++ OOP Projects

This document contains 3 structured projects built using **Object-Oriented Programming** principles.

---

## 🧪 1A. Warm-Up: Student Report Card Generator

### 🎯 Objective:
- Take a student’s name
- Input marks for 5 subjects (out of 100)
- Calculate total, percentage, and grade
- Display formatted result

### ✅ Grading Scheme:

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
    float percentage;
    string grade;

public:
    void inputDetails() {
        cout << "Enter your name: ";
        getline(cin, name);

        cout << "Enter marks for 5 subjects (out of 100):" << endl;
        for (int i = 0; i < 5; i++) {
            cout << "Subject " << i + 1 << ": ";
            cin >> marks[i];
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

---

💸 2. Smart Payment System

🎯 Objective:

Define a general interface PaymentMethod

Implement multiple payment types (CreditCard, PayPal, UPI)

Use polymorphism to dynamically handle different payments


💡 OOP Concepts Used:

Abstract class/interface

Inheritance

Runtime Polymorphism (via virtual functions)


💻 Code:

```
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

---

🚗 3. Vehicle Rental System Simulator

🎯 Objective:

Allow customer to rent different types of vehicles (Car, Bike, Truck)

Each vehicle type has different rental charges

System calculates total cost based on type and number of days


💡 OOP Concepts Used:

Base class + inheritance

Polymorphism for dynamic behavior

Encapsulation for internal rate logic


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

---




