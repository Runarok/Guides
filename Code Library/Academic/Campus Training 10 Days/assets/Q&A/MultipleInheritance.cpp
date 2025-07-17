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
