#include <iostream>

int main() {
    int Integer;

    std::cout << "Enter an integer: ";
    std::cin >> Integer;

    if (Integer > 0) {
        std::cout << "The integer is positive." << std::endl;
    } else if (Integer < 0) {
        std::cout << "The integer is negative." << std::endl;
    } else {
        std::cout << "The integer is zero." << std::endl;
    }

    return 0;
}
