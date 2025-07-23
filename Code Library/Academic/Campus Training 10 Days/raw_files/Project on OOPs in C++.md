Project on OOPs in C++

Warm Up

1a). Write a C++ program that:

Asks the user to enter their name.  
Asks the user to enter marks for 5 subjects (out of 100).  
Calculates the total and percentage.  
Displays the student's name, total marks, percentage, and grade.

\---

📋 Grading Rules:

Percentage	Grade

90 – 100	A+  
75 – 89	A  
60 – 74	B  
40 – 59	C  
Below 40	F (Fail)

Sample Input/Output:

Enter your name: Ram  
Enter marks for 5 subjects:  
Subject 1: 78  
Subject 2: 85  
Subject 3: 67  
Subject 4: 90  
Subject 5: 80

\--- Result \---  
Name: Ram  
Total Marks: 400 / 500  
Percentage: 80%  
Grade: A

Solution:

| \#include \<iostream\>\#include \<string\>using namespace std;class Student {public:    string name;    int marks\[5\];    void getInput() {        cout \<\< "Enter your name: ";        getline(cin, name);        cout \<\< "Enter marks for 5 subjects:\\n";        for (int i \= 0; i \< 5; i++) {            cout \<\< "Subject " \<\< i \+ 1 \<\< ": ";            cin \>\> marks\[i\];        }    }    void showResult() {        int total \= 0;        for (int i \= 0; i \< 5; i++) total \+= marks\[i\];        float percent \= total / 5.0;        string grade;        if (percent \>= 90) grade \= "A+";        else if (percent \>= 75) grade \= "A";        else if (percent \>= 60) grade \= "B";        else if (percent \>= 40) grade \= "C";        else grade \= "F (Fail)";        cout \<\< "\\n--- Result \---\\n";        cout \<\< "Name: " \<\< name \<\< "\\n";        cout \<\< "Total Marks: " \<\< total \<\< " / 500\\n";        cout \<\< "Percentage: " \<\< percent \<\< "%\\n";        cout \<\< "Grade: " \<\< grade \<\< endl;    }};int main() {    Student s;    s.getInput();    s.showResult();    return 0;} |
| :---- |

1. Smart Payment System

Students will design a system that simulates different payment methods (e.g., CreditCard, PayPal, UPI). The system should use OOPs concepts to define a general interface for payments and polymorphism to handle different types of payments dynamically.

Question above was asked at:

1. Infosys HackWithInfy 2023  
2. TCS Digital Advanced Coding Round 2022  
3. Paytm (Intern & Entry Roles)

2. Vehicle Rental System Simulator

Design a console-based Vehicle Rental System that allows customers to rent different types of vehicles: Car, Bike, Truck. Each vehicle type has different rental charges and conditions.

Question above was asked at:

1. Capgemini IT (2021–2023)  
2. Cognizant GenC Next  
3. L\&T Infotech

