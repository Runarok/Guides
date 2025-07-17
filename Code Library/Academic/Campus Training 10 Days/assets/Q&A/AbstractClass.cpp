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
