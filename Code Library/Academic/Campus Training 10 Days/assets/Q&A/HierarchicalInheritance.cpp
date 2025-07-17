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
