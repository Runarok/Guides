#include <iostream>

int main() {
    int A, B;

    std::cout << "Enter two integers separated by space: ";
    std::cin >> A >> B;

    int sum = A + B;  // Add the two integers
    std::cout << "Sum: " << sum << std::endl;

    return 0;
}
