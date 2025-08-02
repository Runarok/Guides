/* ---------------------------------------------------------------
Objective:
This program demonstrates the control of a DC motor using an H-Bridge controller. 
The direction and speed can be selected using the program and adjusted via the delay.

Hardware:
- Microcontroller: 89s8252
- Crystal Frequency: 11.0592 MHz
- I/O Port Configuration:
  - Port 0: Control for DC motor (direction and enable)
---------------------------------------------------------------*/

// DC MOTOR CONTROL

#include <reg52.h>

void msdelay(unsigned int);
sbit enable = P0^6;   // Enable pin for the DC motor
sbit mtr_1 = P0^7;    // Motor direction pin 1
sbit mtr_2 = P0^4;    // Motor direction pin 2
unsigned int rot = 1;  // 0 for clockwise, 1 for anticlockwise

void main()
{
    if (rot == 0) {
        while (1) {
            msdelay(1000);
            mtr_1 = 1;  // Rotate clockwise
            mtr_2 = 0;
            msdelay(1000);
        }
    } else {
        while (1) {
            msdelay(1000);
            mtr_1 = 0;  // Rotate anticlockwise
            mtr_2 = 1;
            msdelay(1000);
        }
    }
}

// Delay Routine for DC Motor
void msdelay(unsigned int value)
{
    unsigned int x, y;
    for (x = 0; x < 500; x++)
        for (y = 0; y < value; y++);
}

// -----------------------------------------------------------------------

// STEP MOTOR CONTROL

#include <reg52.h>

void MSDelay(unsigned int);
unsigned int rdata = 1;  // 0 for clockwise, 1 for anticlockwise

void stepper_motor_control() {
    if (rdata == 0) {
        while (1) {
            P0 = 0x66;  // Clockwise Rotation
            MSDelay(100);  // Change speed by adjusting delay
            P0 = 0xCC;
            MSDelay(100);
            P0 = 0x99;
            MSDelay(100);
            P0 = 0x33;
            MSDelay(100);
        }
    } else {
        while (1) {
            P0 = 0x33;  // Anticlockwise Rotation
            MSDelay(100);
            P0 = 0x99;
            MSDelay(100);
            P0 = 0xCC;
            MSDelay(100);
            P0 = 0x66;
            MSDelay(100);
        }
    }
}

// Delay Routine for Stepper Motor
void MSDelay(unsigned int value) {
    unsigned int x, y;
    for (x = 0; x < 600; x++)
        for (y = 0; y < value; y++);
}

