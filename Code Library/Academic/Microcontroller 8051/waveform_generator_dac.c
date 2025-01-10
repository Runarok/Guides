/* ---------------------------------------------------------------
Objective:
This program implements the basic waveform generation using a Digital-to-Analog Converter (DAC).
The output is displayed on a Cathode Ray Oscilloscope (CRO). The program supports the generation of:
1. Square Wave
2. Triangle Wave
3. Staircase Wave
4. Positive Ramp Wave
5. Negative Ramp Wave
6. Sine Wave

Hardware:
- Microcontroller: 89s8252
- Crystal Frequency: 11.0592 MHz
- I/O Port Configuration:
  - Port 0: DAC Output
  - Other Ports: Not used in this program
---------------------------------------------------------------*/

#include <reg52.h>
#include <math.h>

// Square Wave Generation
idata unsigned int r;

void generate_square_wave() {
    while(1) {
        P0 = 0x00;  // Output low signal (0V) for half of the period
        for(r = 0; r < 400; r++);  // Delay for time control

        P0 = 0xFF;  // Output high signal (Vdd) for the other half of the period
        for(r = 0; r < 400; r++);  // Delay for time control
    }
}

// Triangle Wave Generation
#define DAC_IN P0
void generate_triangle_wave() {
    DAC_IN = 0x00;  // Start from 0 (lowest value)
    while(1) {
        // Increment DAC value until it reaches 0xFF (255)
        while(DAC_IN < 0xFF) { 
            DAC_IN = DAC_IN + 0x01; 
        }

        // Decrement DAC value back to 0
        while(DAC_IN > 0x00) { 
            DAC_IN = DAC_IN - 0x01; 
        }
    }
}

// Staircase Wave Generation
code unsigned char array[6] = {0x00, 0x33, 0x66, 0x99, 0xCC, 0xFF};
void generate_staircase_wave() {
    unsigned char i, r;
    while(1) {
        // Iterate through the values in the array and output them to P0
        for(i = 0; i < 5; i++) {
            P0 = array[i];  // Output the current value to DAC
            for(r = 0; r < 40; r++);  // Delay for time control
        }
    }
}

// Positive Ramp Wave Generation
void generate_positive_ramp_wave() {
    while(1) {
        P0 = P0 + 0x01;  // Increment the DAC output value (P0)
    }
}

// Negative Ramp Wave Generation
void generate_negative_ramp_wave() {
    while(1) {
        P0 = P0 - 0x01;  // Decrement the DAC output value (P0)
    }
}

// Sine Wave Generation
unsigned char arr[62];  // Array to store the sine wave values
float x;
unsigned int i = 0;

void generate_sine_wave() {
    P0 = 0xFF;  // Set the initial output to 0xFF (high)

    // Precompute sine wave values and store them in arr[]
    for (x = 0; x < (2 * 3.1415); x += 0.1) {
        arr[i] = 127 + 127 * sin(x);  // Generate sine values (scaled)
        i++;
    }
    
    P0 = 0x00;  // Reset the initial value to 0
    while(1) {
        // Loop through the sine wave values and output them
        for (i = 0; i < 62; i++) {
            P0 = arr[i];  // Output the sine wave value to DAC
        }
    }
}

void main() {
    // Choose which waveform generation function to use
    // Uncomment the function you want to test and comment the others.

    //generate_square_wave();    // Square Wave Generation
    //generate_triangle_wave();  // Triangle Wave Generation
    //generate_staircase_wave(); // Staircase Wave Generation
    //generate_positive_ramp_wave(); // Positive Ramp Wave Generation
    //generate_negative_ramp_wave(); // Negative Ramp Wave Generation
    //generate_sine_wave();    // Sine Wave Generation
}
