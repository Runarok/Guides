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
