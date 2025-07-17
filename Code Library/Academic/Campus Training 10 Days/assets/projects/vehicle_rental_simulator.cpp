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
