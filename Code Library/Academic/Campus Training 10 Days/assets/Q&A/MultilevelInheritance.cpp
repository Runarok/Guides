#include <iostream>
using namespace std;

class Vehicle {
public:
    void showType() {
        cout << "Type: Vehicle" << endl;
    }
};

class Car : public Vehicle {
public:
    void showBrand() {
        cout << "Brand: Toyota" << endl;
    }
};

class ElectricCar : public Car {
public:
    void showBattery() {
        cout << "Battery: 80 kWh" << endl;
    }
};

int main() {
    ElectricCar e;
    e.showType();     // From Vehicle
    e.showBrand();    // From Car
    e.showBattery();  // From ElectricCar
    return 0;
}
