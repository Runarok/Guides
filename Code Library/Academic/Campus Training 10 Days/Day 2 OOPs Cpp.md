# 📘 Campus Training – Day 2 (Session 1)

This session covered basic C++ programming concepts such as I/O, conditional statements, `switch-case`, and loops (`for`, `while`, `do...while`).  
Additionally, I **self-taught** and explored:
-  Function calling (user-defined functions)
-  Time API (`ctime`) and weekday manipulation

---

##  1. Addition of Two Integers

**Concept Covered in Class:** Input, basic arithmetic

```cpp
#include <iostream>

int main() {
    int A, B;

    std::cout << "Enter two integers separated by space: ";
    std::cin >> A >> B;

    int sum = A + B;  // Add the two integers
    std::cout << "Sum: " << sum << std::endl;

    return 0;
}
````

---

##  2. Check Positive, Negative or Zero

**Concept Covered in Class:** Conditional `if-else`

```cpp
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
```

---

##  3. Day of the Week using `switch`

**Concept Covered in Class:** `switch-case`

```cpp
#include <iostream>

int main() {
    int day;

    std::cout << "Enter a number (1 to 7) to get the day of the week: ";
    std::cin >> day;

    switch (day) {
        case 1: std::cout << "Monday" << std::endl; break;
        case 2: std::cout << "Tuesday" << std::endl; break;
        case 3: std::cout << "Wednesday" << std::endl; break;
        case 4: std::cout << "Thursday" << std::endl; break;
        case 5: std::cout << "Friday" << std::endl; break;
        case 6: std::cout << "Saturday" << std::endl; break;
        case 7: std::cout << "Sunday" << std::endl; break;
        default: std::cout << "Invalid input! Please enter a number between 1 and 7." << std::endl;
    }

    return 0;
}
```

---

##  4. Day Offset using Current Day

**🔹 Self-Taught Concept:** `ctime` usage, weekday index manipulation

```cpp
#include <iostream>
#include <ctime>
using namespace std;

int main() {
    int offset, todayIndex, targetIndex;

    // Get current local time
    time_t now = time(0);
    tm *ltm = localtime(&now);

    // Get today's index (0 = Sunday, 6 = Saturday)
    todayIndex = ltm->tm_wday;

    cout << "Enter day offset (positive or negative): ";
    cin >> offset;

    // Normalize offset within 0–6
    targetIndex = (todayIndex + offset % 7 + 7) % 7;

    switch (targetIndex) {
        case 0: cout << "It's Sunday!" << endl; break;
        case 1: cout << "It's Monday!" << endl; break;
        case 2: cout << "It's Tuesday!" << endl; break;
        case 3: cout << "It's Wednesday!" << endl; break;
        case 4: cout << "It's Thursday!" << endl; break;
        case 5: cout << "It's Friday!" << endl; break;
        case 6: cout << "It's Saturday!" << endl; break;
        default: cout << "Error: Invalid day index." << endl;
    }

    return 0;
}
```

---

##  5. Countdown using `while` Loop

**Concept Covered in Class:** Basic `while` loop

```cpp
#include <iostream>
using namespace std;

int main() {
    int i = 5;

    while(i > 0) {
        cout << i << "\n";
        i--;
    }

    return 0;
}
```

---

##  6. Countdown using Function and `while` Loop

**🔹 Self-Taught Concept:** Function declaration, definition, parameter usage

```cpp
#include <iostream>
using namespace std;

// Function declaration
void printCountdown(int start, int end);

int main() {
    int i = 5;
    int j = 0;
    printCountdown(i, j);  // Function call
    return 0;
}

// Function definition
void printCountdown(int start, int end) {
    while (start > end) {
        cout << start << "\n";
        start--;
    }
}
```

---

##  7. Countdown using `do...while` Function

**🔹 Self-Taught Concept:** `do...while` inside a function

```cpp
#include <iostream>
using namespace std;

// Function declaration
void printCountdown(int start, int end);

int main() {
    int i = 5;
    int j = 0;
    printCountdown(i, j);  // Function call
    return 0;
}

// Function definition using do...while loop
void printCountdown(int start, int end) {
    do {
        cout << start << "\n";
        start--;
    } while (start > end);
}
```

---

##  8. `for` Loop Example

**Concept Covered in Class:** Basic `for` loop

```cpp
#include <iostream>
using namespace std;

int main() {
    for (int i = 1; i < 5; i++) {
        cout << i << "\n";
    }
    return 0;
}
```

---

##  9. Sum of First 5 Natural Numbers

**Concept Covered in Class:** Loop-based sum logic

```cpp
#include <iostream>
using namespace std;

int main() {
    int sum = 0;

    for (int i = 1; i <= 5; i++) {
        sum = sum + i;
    }

    cout << "Sum is " << sum << endl;
    return 0;
}
```

---

> **Note to Self:**
> Even if some of this wasn’t taught in class, I took initiative to deepen my understanding of function usage and system-level time manipulation. Staying one step ahead.
