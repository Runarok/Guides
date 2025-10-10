// ------------------------------------------------------
// Title: Implementation of Stop and Wait and Sliding Window Protocols
// ------------------------------------------------------
// Aim:
// To simulate two data link layer protocols: 
// 1. Stop and Wait Protocol 
// 2. Sliding Window Protocol
// using C programming, demonstrating reliable data transmission
// and acknowledgement mechanisms between sender and receiver.
// ------------------------------------------------------
// Tool Used    :: C Programming Language
// Software     :: GCC Compiler / Linux Terminal (Ubuntu)
// ------------------------------------------------------
// Theory:
// - **Stop and Wait Protocol**: Sends one frame at a time. Waits for 
//   acknowledgement (ACK) before sending the next. Retransmits on timeout.
// - **Sliding Window Protocol**: Sends multiple frames defined by a 
//   window size before waiting for ACK. Increases throughput.
//
// In both protocols, Round Trip Time (RTT) is simulated using `sleep()`.
// ------------------------------------------------------
// Procedure:
// Step 1: Open terminal.
// Step 2: Create C files:
//         $ gedit sliding_window.c
//         $ gedit stop_and_wait.c
//
// Step 3: Copy respective codes below into those files.
// Step 4: Compile the programs:
//         $ gcc sliding_window.c -o sliding
//         $ gcc stop_and_wait.c -o stop
//
// Step 5: Run the executables:
//         $ ./sliding
//         $ ./stop
// ------------------------------------------------------
// A) Sliding Window Protocol Implementation
// ------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> // for sleep()

#define RTT 5

int main() {
    int window_size, i, f, frames[50];

    printf("Enter window size: ");
    scanf("%d", &window_size);

    printf("\nEnter number of frames to transmit: "); 
    scanf("%d", &f);

    printf("\nEnter %d frames: ", f);
    for (i = 1; i <= f; i++)
        scanf("%d", &frames[i]);

    printf("\nAfter sending %d frames at each stage sender waits for ACK\n", window_size);
    printf("Sending frames in the following manner....\n\n");

    for (i = 1; i <= f; i++) {
        if (i % window_size != 0) {
            printf(" %d", frames[i]);
        } else {
            printf(" %d\n", frames[i]);
            printf("SENDER: Waiting for ACK...\n");
            sleep(RTT / 2);

            printf("RECEIVER: Frames Received, ACK sent\n");
            printf("--------------------------------------\n");

            sleep(RTT / 2);
            printf("SENDER: ACK received, sending next frames\n");
        }
    }

    if (f % window_size != 0) {
        printf("\nSENDER: Waiting for ACK...\n");
        sleep(RTT / 2);

        printf("\nRECEIVER: Frames Received, ACK Sent\n");
        printf("-------------------------------------------------\n");

        sleep(RTT / 2);
        printf("SENDER: ACK received.\n");
    }

    return 0;
}

// ------------------------------------------------------
// Sample Output:
// ------------------------------------------------------
// Enter window size: 3
// Enter number of frames to transmit: 6
// Enter 6 frames: 10 20 30 40 50 60
//
// After sending 3 frames at each stage sender waits for ACK
// Sending frames in the following manner....
//
// 10 20 30
// SENDER: Waiting for ACK...
// RECEIVER: Frames Received, ACK sent
// SENDER: ACK received, sending next frames
// 40 50 60
// SENDER: Waiting for ACK...
// RECEIVER: Frames Received, ACK sent
// SENDER: ACK received.
// ------------------------------------------------------
// Observation:
// ------------------------------------------------------
// - ACKs are sent for every window of frames.
// - Sender sends next set only after receiving ACK.
// - Better throughput than Stop-and-Wait.
// ------------------------------------------------------

// ------------------------------------------------------
// B) Stop and Wait Protocol Implementation
// ------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>  // for sleep()

#define RTT 4
#define TIMEOUT 4
#define TOTAL_NO_FRAMES 7

enum { NO, YES } ACK;

int main() {
    int wait_time, i = 1;
    ACK = YES;

    for (; i <= TOTAL_NO_FRAMES;) {
        if (ACK == YES && i != 1) {
            printf("\nSENDER: ACK for Frame %d Received.\n", i - 1);
        }

        printf("\nSENDER: Frame %d sent, Waiting for ACK...\n", i);
        ACK = NO;

        wait_time = rand() % 4 + 1;

        if (wait_time == TIMEOUT) {
            printf("SENDER: ACK not received for Frame %d => TIMEOUT. Resending Frame...\n", i);
        } else {
            sleep(RTT / 2);
            printf("\nRECEIVER: Frame %d received, ACK sent\n", i);
            printf("--------------------------------------------\n");
            ACK = YES;
            sleep(RTT / 2);
            i++;
        }
    }

    return 0;
}

// ------------------------------------------------------
// Sample Output:
// ------------------------------------------------------
// SENDER: Frame 1 sent, Waiting for ACK...
// RECEIVER: Frame 1 received, ACK sent
// SENDER: ACK for Frame 1 Received.
// SENDER: Frame 2 sent, Waiting for ACK...
// SENDER: ACK not received for Frame 2 => TIMEOUT. Resending Frame...
// SENDER: Frame 2 sent, Waiting for ACK...
// RECEIVER: Frame 2 received, ACK sent
// ...
// ------------------------------------------------------
// Observation:
// ------------------------------------------------------
// - Only one frame sent at a time.
// - Retransmission occurs on timeout.
// - Lower throughput than Sliding Window.
// ------------------------------------------------------
// Result:
// ------------------------------------------------------
// Both Stop-and-Wait and Sliding Window protocols were successfully 
// implemented in C. Simulated transmission delays and acknowledgements 
// illustrated reliability mechanisms in data link layer protocols.
// ======================================================
// End of File
// ======================================================
