/*
1. Aim:
   To implement a program in C for simulating HDLC (High-Level Data Link Control) frame processing using:
   i) Bit Stuffing
   ii) Character Stuffing

2. Software Tool:
   - Language: C
   - Compiler: GCC / Turbo C / Code::Blocks
   - Platform: Any operating system

3. Theory:
   HDLC (High-Level Data Link Control) is a bit-oriented synchronous data link layer protocol. It supports both bit and character-oriented framing techniques.

   i) Bit Stuffing:
      - HDLC frames begin and end with a flag sequence: 01111110.
      - To ensure this pattern doesn't appear in the data, a '0' is inserted after every sequence of five consecutive '1's in the data.
      - This process is called bit stuffing.

   ii) Character Stuffing:
      - In character-oriented protocols, special characters are used for framing.
      - DLE (Data Link Escape), STX (Start of Text), and ETX (End of Text) are used.
      - If the DLE character appears in the actual data, it is duplicated (stuffed) to distinguish it from control characters.

4. Procedure:
   - For Bit Stuffing:
     a) Start the frame with a flag sequence: 01111110.
     b) Read the binary data stream.
     c) After five consecutive 1's, insert a 0 (bit stuffing).
     d) End the frame with the same flag.

   - For Character Stuffing:
     a) Start the frame with DLE STX.
     b) Read the input data stream.
     c) If DLE appears in the data, duplicate it.
     d) End the frame with DLE ETX.

5. Program:
*/

// -------------------------- Bit Stuffing Program --------------------------
/* Program to simulate bit stuffing where the flag byte is 01111110 */
#include <stdio.h>
#include <string.h>

int main() {
    char ch, array[100] = "01111110";  // Initialize array with start flag
    int counter = 0;  // Counter for consecutive 1s
    int i = 8;        // Start inserting bits after the 8-bit start flag
    int j;            // Loop variable for printing

    printf("Enter the original data stream for bit stuffing (end with ENTER):\n");

    // Read input characters until the Enter key is pressed
    while ((ch = getchar()) != '\n') {
        if (ch != '0' && ch != '1') continue;  // Skip characters other than 0 and 1

        // Increment counter if '1' is read, otherwise reset
        if (ch == '1') {
            ++counter;
        } else {
            counter = 0;
        }

        // Add the character to the array
        array[i++] = ch;

        // If five consecutive 1s are found, insert a 0 (bit stuffing)
        if (counter == 5) {
            array[i++] = '0';  // Stuff a 0
            counter = 0;       // Reset the counter
        }
    }

    // Add the ending flag to signify end of frame
    strcat(array, "01111110");

    printf("\nThe stuffed data stream is:\n\n");

    // Print the entire frame (stuffed data + start and end flag)
    for (j = 0; j < i + 8; ++j) {
        printf("%c", array[j]);
    }

    printf("\n");
    return 0;
}

// ----------------------- Character Stuffing Program -----------------------
/* Program to demonstrate character stuffing */
#include <stdio.h>

#define DLE 16  // ASCII value of DLE (Data Link Escape)
#define STX 2   // ASCII value of STX (Start of Text)
#define ETX 3   // ASCII value of ETX (End of Text)

int main() {
    char ch;                        // To hold user input character
    char array[100] = {DLE, STX};   // Start the frame with DLE STX
    int i = 2;                      // Start inserting after DLE and STX
    int j;                          // Loop variable for printing

    printf("Enter the data stream (Ctrl+B for STX, Ctrl+C for ETX, Ctrl+P for DLE).\n");
    printf("Press ENTER to end input:\n");

    // Read input characters until the Enter key is pressed
    while ((ch = getchar()) != '\n') {
        // If the character is DLE, stuff another DLE
        if (ch == DLE) {
            array[i++] = DLE;      // Stuff another DLE
            printf("DLE ");        // Show DLE in output
        } else if (ch == STX) {
            printf("STX ");        // Show STX in output
        } else if (ch == ETX) {
            printf("ETX ");        // Show ETX in output
        } else {
            printf("%c ", ch);     // Print normal character
        }

        array[i++] = ch;  // Add character to the frame
    }

    // Add ending characters DLE and ETX to signify end of frame
    array[i++] = DLE;
    array[i++] = ETX;

    // Print the stuffed character stream
    printf("\n\nThe stuffed stream is:\n");
    for (j = 0; j < i; ++j) {
        if (array[j] == DLE)
            printf("DLE ");
        else if (array[j] == STX)
            printf("STX ");
        else if (array[j] == ETX)
            printf("ETX ");
        else
            printf("%c ", array[j]);
    }

    printf("\n");
    return 0;
}

/*
6. Result:
   - The program successfully simulates HDLC framing using:
     i) Bit Stuffing: After five consecutive 1s in the bit stream, a 0 is inserted.
     ii) Character Stuffing: DLE characters are duplicated in the frame, and STX/ETX are used to define frame boundaries.
*/
