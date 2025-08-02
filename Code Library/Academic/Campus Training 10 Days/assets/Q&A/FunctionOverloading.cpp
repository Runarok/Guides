#include <iostream>
using namespace std;

class Calculator {
public:
    int add(int a, int b) {
        return a + b;
    }

    float add(float a, float b, float c) {
        return a + b + c;
    }
};

int main() {
    Calculator calc;
    cout << "Sum of 2 and 3: " << calc.add(2, 3) << endl;
    cout << "Sum of 1.1, 2.2, and 3.3: " << calc.add(1.1f, 2.2f, 3.3f) << endl;
    return 0;
}
