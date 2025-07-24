# C++ OOPs Project – Practice Programs

Welcome to a collection of OOPs-focused C++ projects and warm-up exercises often asked in top IT interviews and hackathons. These problems help you master classes, inheritance, polymorphism, and more.

---

## **Warm Up – Student Marks & Grade Calculator**

**Task:**  
Write a C++ program that:
- Asks the user to enter their name.
- Asks the user to enter marks for 5 subjects (out of 100).
- Calculates the total and percentage.
- Displays the student's name, total marks, percentage, and grade.

**Grading Rules:**

| Percentage    | Grade     |
|:-------------:|:---------:|
| 90 – 100      | A+        |
| 75 – 89       | A         |
| 60 – 74       | B         |
| 40 – 59       | C         |
| Below 40      | F (Fail)  |

**Sample Input/Output:**
```
Enter your name: Ram
Enter marks for 5 subjects:
Subject 1: 78
Subject 2: 85
Subject 3: 67
Subject 4: 90
Subject 5: 80

--- Result ---
Name: Ram
Total Marks: 400 / 500
Percentage: 80%
Grade: A
```

**Solution:**
```cpp
#include <iostream>
#include <string>
using namespace std;

class Student {
public:
    string name;
    int marks[5];

    void getInput() {
        cout << "Enter your name: ";
        getline(cin, name);
        cout << "Enter marks for 5 subjects:\n";
        for (int i = 0; i < 5; i++) {
            cout << "Subject " << i + 1 << ": ";
            cin >> marks[i];
        }
    }

    void showResult() {
        int total = 0;
        for (int i = 0; i < 5; i++) total += marks[i];
        float percent = total / 5.0;
        string grade;

        if (percent >= 90) grade = "A+";
        else if (percent >= 75) grade = "A";
        else if (percent >= 60) grade = "B";
        else if (percent >= 40) grade = "C";
        else grade = "F (Fail)";

        cout << "\n--- Result ---\n";
        cout << "Name: " << name << "\n";
        cout << "Total Marks: " << total << " / 500\n";
        cout << "Percentage: " << percent << "%\n";
        cout << "Grade: " << grade << endl;
    }
};

int main() {
    Student s;
    s.getInput();
    s.showResult();
    return 0;
}
```

---

## **Project 1: Smart Payment System**

**Problem Statement:**  
Design a system that simulates different payment methods (Credit Card, PayPal, UPI).  
- Use OOPs concepts to define a generic interface for payments.
- Use **polymorphism** for dynamic handling of different payment types.

**Interview Presence:**  
- Infosys HackWithInfy 2023  
- TCS Digital Advanced Coding Round 2022  
- Paytm (Intern & Entry Roles)

---

## **Project 2: Vehicle Rental System Simulator**

**Problem Statement:**  
Create a console-based Vehicle Rental System for renting Cars, Bikes, and Trucks.
- Each vehicle type has different rental charges and conditions.
- Use OOPs principles to structure vehicle classes and rental logic.

**Interview Presence:**  
- Capgemini IT (2021–2023)  
- Cognizant GenC Next  
- L&T Infotech

---

**Tip:**  
For each project, focus on:  
- Class design  
- Inheritance and interfaces  
- Polymorphism  
- Real-world modeling

---

> These problems are excellent practice for campus placements, technical interviews, and competitive coding rounds!