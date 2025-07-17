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
