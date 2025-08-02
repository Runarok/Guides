#include <iostream>
using namespace std;

// Abstract base class
class PaymentMethod {
public:
    virtual void pay(float amount) = 0;  // Pure virtual function
};

// Derived classes
class CreditCard : public PaymentMethod {
public:
    void pay(float amount) override {
        cout << "Paid ₹" << amount << " using Credit Card." << endl;
    }
};

class PayPal : public PaymentMethod {
public:
    void pay(float amount) override {
        cout << "Paid ₹" << amount << " using PayPal." << endl;
    }
};

class UPI : public PaymentMethod {
public:
    void pay(float amount) override {
        cout << "Paid ₹" << amount << " via UPI." << endl;
    }
};

// Driver
int main() {
    PaymentMethod* payment;

    CreditCard cc;
    PayPal pp;
    UPI upi;

    payment = &cc;
    payment->pay(1000.00);

    payment = &pp;
    payment->pay(500.50);

    payment = &upi;
    payment->pay(299.99);

    return 0;
}
