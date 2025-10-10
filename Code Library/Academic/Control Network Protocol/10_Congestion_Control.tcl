// ------------------------------------------------------
// Title: Congestion Control using Leaky Bucket Algorithm
// ------------------------------------------------------
// Aim:
// To implement congestion control in a network using the 
// Leaky Bucket algorithm, simulating packet processing and drops.
// ------------------------------------------------------
// Tool Used    :: C Programming Language
// Software     :: GCC Compiler / Linux Terminal
// ------------------------------------------------------
// Theory:
// The Leaky Bucket algorithm is a traffic shaping mechanism used 
// in computer networks. It controls data flow by allowing a fixed 
// output rate (processing rate), regardless of the burstiness of input.
//
// - A fixed-size "bucket" holds incoming packets.
// - If packets arrive faster than they are processed and overflow 
//   the bucket, they are dropped.
// - The algorithm ensures congestion is avoided by shaping the flow.
// ------------------------------------------------------
// Procedure:
// Step 1: Open terminal (Ubuntu).
// Step 2: Create a C file:
//         $ gedit leaky_bucket.c
// Step 3: Copy the below program and save.
// Step 4: Compile the program:
//         $ gcc leaky_bucket.c -o bucket
// Step 5: Run the program:
//         $ ./bucket
// ------------------------------------------------------
// C Program Starts Below
// ------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>

int min(int x, int y) {
    return (x < y) ? x : y;
}

int main() {
    int imp[25], drop = 0, count = 0, process, mini, cap, nsec, i;

    printf("Enter the bucket size: ");
    scanf("%d", &cap);

    printf("Enter the processing rate (packets/sec): ");
    scanf("%d", &process);

    printf("Enter the number of seconds for simulation: ");
    scanf("%d", &nsec);

    for (i = 0; i < nsec; i++) {
        printf("Enter number of packets at %d sec: ", i + 1);
        scanf("%d", &imp[i]);
    }

    printf("\nSeconds | Received | Sent | Left | Dropped\n");
    printf("----------------------------------------------\n");

    for (i = 0; i < nsec; i++) {
        count += imp[i];
        if (count > cap) {
            drop = count - cap;
            count = cap;
        }

        mini = min(count, process);
        count -= mini;

        printf("%7d | %8d | %4d | %4d | %7d\n", i + 1, imp[i], mini, count, drop);
        drop = 0;
    }

    // Process remaining packets after input ends
    for (; count != 0; i++) {
        if (count > cap) {
            drop = count - cap;
            count = cap;
        }

        mini = min(count, process);
        count -= mini;

        printf("%7d | %8d | %4d | %4d | %7d\n", i + 1, 0, mini, count, drop);
    }

    return 0;
}

// ------------------------------------------------------
// Sample Output:
// ------------------------------------------------------
// Enter the bucket size: 10
// Enter the processing rate (packets/sec): 4
// Enter the number of seconds for simulation: 4
// Enter number of packets at 1 sec: 5
// Enter number of packets at 2 sec: 7
// Enter number of packets at 3 sec: 4
// Enter number of packets at 4 sec: 6
//
// Seconds | Received | Sent | Left | Dropped
// ----------------------------------------------
//       1 |        5 |    4 |     1 |       0
//       2 |        7 |    4 |     4 |       0
//       3 |        4 |    4 |     4 |       0
//       4 |        6 |    4 |     6 |       0
//       5 |        0 |    4 |     2 |       0
//       6 |        0 |    2 |     0 |       0
// ------------------------------------------------------
// Observation:
// ------------------------------------------------------
// - The bucket holds only a limited number of packets.
// - Excess packets beyond capacity are dropped.
// - After simulation ends, leftover packets are still processed.
// ------------------------------------------------------
// Result:
// ------------------------------------------------------
// The leaky bucket algorithm was successfully implemented using C.
// The program demonstrated controlled packet output rate and dropped 
// excess packets beyond bucket capacity to manage network congestion.
// ======================================================
// End of File
// ======================================================
