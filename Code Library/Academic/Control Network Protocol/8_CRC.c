// ------------------------------------------------------
// Title        : CRC Error Detection Implementation
// ------------------------------------------------------
// Aim:
// To implement Cyclic Redundancy Check (CRC) in C to detect
// errors in data transmission using a generator polynomial.
// ------------------------------------------------------
// Tool Used    :: C Programming Language
// Software     :: GCC Compiler / Linux Terminal
// ------------------------------------------------------
// Theory:
// CRC is an error-detecting code commonly used in digital networks 
// and storage devices. A fixed generator polynomial is used to divide 
// the data. The remainder (checksum) is appended to the data, and on 
// the receiver side, the same polynomial is used to check if any errors 
// occurred during transmission.
// ------------------------------------------------------
// Procedure:
// Step 1: Open terminal (e.g., Ubuntu).
// Step 2: Create a C file:
//         $ gedit crc.c
// Step 3: Copy and paste the following C program into the file.
// Step 4: Save and compile the program:
//         $ gcc crc.c -o crc
// Step 5: Run the compiled program:
//         $ ./crc
// Step 6: Follow the input prompts to simulate CRC operation.
// ------------------------------------------------------
// Main C Program Starts Here
// ------------------------------------------------------

#include <stdio.h>
#include <string.h>

#define N strlen(g)

char t[28], cs[28], g[] = "1101";
int a, e, c;

// Function prototypes
void crc();
void xor();

int main() {
    printf("\nEnter the Data: ");
    scanf("%s", t);

    printf("\n\nThe Generator Polynomial is: %s\n", g);

    a = strlen(t);
    for (e = a; e < a + N - 1; e++)
        t[e] = '0';
    t[e] = '\0';  // Null-terminate the string

    printf("\nThe modified data is: %s\n", t);

    crc();

    printf("\nChecksum is: %s\n", cs);

    for (e = a; e < a + N - 1; e++)
        t[e] = cs[e - a];

    t[e] = '\0';  // Null-terminate again after adding checksum

    printf("\nThe Final Codeword is: %s\n", t);

    printf("\nTest Error Detection 0(YES) 1(NO)? :");
    scanf("%d", &e);

    if (e == 0) {
        do {
            printf("\nEnter the position where Error is to be inserted: ");
            scanf("%d", &e);
        } while (e == 0 || e > a + N - 1);

        t[e - 1] = (t[e - 1] == '0') ? '1' : '0';

        printf("\nErroneous Data: %s\n", t);
    }

    crc();

    for (e = 0; (e < N - 1) && (cs[e] != '1'); e++);

    if (e < N - 1)
        printf("\nError Detected\n\n");
    else
        printf("\nNo Error Detected\n\n");

    return 0;
}

void crc() {
    for (e = 0; e < N; e++)
        cs[e] = t[e];

    do {
        if (cs[0] == '1')
            xor();

        for (c = 0; c < N - 1; c++)
            cs[c] = cs[c + 1];

        cs[c] = t[e++];
    } while (e <= a + N - 1);

    cs[c] = '\0';  // Null-terminate the checksum
}

void xor() {
    for (c = 1; c < N; c++)
        cs[c] = (cs[c] == g[c]) ? '0' : '1';
}

// ------------------------------------------------------
// Sample Input/Output:
// ------------------------------------------------------
// Enter the Data: 100100
//
// The Generator Polynomial is: 1101
//
// The modified data is: 100100000
//
// Checksum is: 001
//
// The Final Codeword is: 100100001
//
// Test Error Detection 0(YES) 1(NO)? : 0
// Enter the position where Error is to be inserted: 7
//
// Erroneous Data: 100100101
//
// Error Detected
// ------------------------------------------------------
// Observation:
// ------------------------------------------------------
// - Appending checksum allows detection of single-bit errors.
// - If the checksum is all zeros after division, no error is detected.
// - CRC fails only for specific patterns (e.g., burst errors that 
//   match the polynomial).
// ------------------------------------------------------
// Result:
// ------------------------------------------------------
// The CRC algorithm was successfully implemented in C.
// Errors introduced during transmission were accurately detected
// using the generator polynomial.
// ======================================================
// End of File
// ======================================================
