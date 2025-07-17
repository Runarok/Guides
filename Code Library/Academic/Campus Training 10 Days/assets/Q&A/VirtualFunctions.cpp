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
