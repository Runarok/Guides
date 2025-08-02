/* ---------------------------------------------------------------
Objective:
This program is designed to implement a basic temperature sensor 
using an ADC (Analog to Digital Converter). The output from the 
temperature sensor, which varies from 27°C to 141°C, is displayed 
on a 2x16 LCD.

--------------------------------------------------------------- */

/* ---------------------------------------------------------------
Hardware:
- Microcontroller: 89S8252
- Crystal Frequency: 11.0592 MHz
- I/O Port Configuration:
  - Port 0 (Output): LCD Data
  - Port 1 (Input): Control signals for ADC (RD, WR, INTR, AEN)
  - Port 2 (Input): ADC Data
  - Port 3 (Output): LCD Control signals (RS, RW, EN)
--------------------------------------------------------------- */

#include <reg52.h>

// ADC control pins
sbit rd = P1^1;   // Read signal from ADC
sbit wr = P1^2;   // Write signal to ADC
sbit intr = P1^3; // Interrupt signal from ADC
sbit aen = P1^0;  // ADC enable signal

// LCD control pins
sfr ldata = 0x80; // LCD Data register
sbit rs = P3^7;   // Register Select for LCD
sbit rw = P3^6;   // Read/Write for LCD
sbit en = P3^5;   // Enable for LCD
sbit busy = P0^7; // LCD busy flag

// Function Declarations
void convert_display(unsigned char);   // Hex to Binary conversion for display
void lcdcmd(unsigned char value);      // LCD command function
void lcddata(unsigned char value);     // LCD data function
void lcdready();                       // LCD ready check function
void MSDealy(unsigned int itime);      // Delay function

void main() {
    unsigned char value; // Variable to store ADC data

    // LCD initialization
    lcdcmd(0x38);  // 8-bit mode, 2-line display
    lcdcmd(0x0E);  // Display on, cursor on
    lcdcmd(0x01);  // Clear display
    lcdcmd(0x06);  // Increment cursor
    lcdcmd(0x83);  // Move cursor to beginning of second line
    lcddata('T');  // LCD data
    lcddata('e');
    lcddata('m');
    lcddata('p');
    lcddata('e');
    lcddata('r');
    lcddata('a');
    lcddata('t');
    lcddata('u');
    lcddata('r');
    lcddata('e');
    lcddata('r');
    
    // Set port 2 as input and port 0 as output
    mydata1 = 0xFF;
    ldata = 0x00;

    // ADC routine
    while (1) {
        aen = 0;     // Enable ADC
        wr = 0;      // Write=0
        wr = 1;      // WR=1 to start conversion (Low to High pulse)
        
        // Wait for the end of conversion
        while (intr == 1);  
        
        rd = 0;  // Conversion finished, enable RD
        value = mydata1;  // Read the ADC data
        value = value - 114;  // Adjust value for temperature calculation
        lcdcmd(0xC7);  // Move cursor to position for displaying value
        convert_display(value);  // Convert and display the temperature
        rd = 1;  // Enable RD for next round
        
        MSDealy(10);  // Delay to stabilize the ADC reading
    }
}

// ------------------------ Hex to Binary conversion routine --------------------------
void convert_display(unsigned char value) {
    unsigned char x, d1, d2, d3, data1, data2, data3;
    x = value / 10;  // Divide by 10 to get tens
    d1 = value % 10; // Save low digit (reminder of division)
    d2 = x % 10;     // Get tens digit
    d3 = x / 10;     // Divide again to get hundreds digit
    
    data1 = d1 | 0x30;  // Convert to ASCII
    data2 = d2 | 0x30;
    data3 = d3 | 0x30;
    
    // Display the digits
    lcddata(data3);  // Display MSB first
    lcddata(data2);
    lcddata(data1);  // Display the LSB
    return;
}

// ---------------------------- LCD Command function -------------------------------
void lcdcmd(unsigned char value) {
    lcdready();  // Check if LCD is ready
    ldata = value;  // Write command code
    rs = 0;  // RS=0 for command
    rw = 0;  // R/W=0 to write to LCD
    en = 1;  // E=1 for H-to-L pulse
    MSDealy(1);
    en = 0;  // E=0 to latch the command
    return;
}

// ---------------------------- LCD Data function -------------------------------
void lcddata(unsigned char value) {
    lcdready();  // Check if LCD is ready
    ldata = value;  // Write data to LCD
    rs = 1;  // RS=1 for data
    rw = 0;  // R/W=0 to write to LCD
    en = 1;  // E=1 for H-to-L pulse
    MSDealy(1);
    en = 0;  // E=0 to latch the data
    return;
}

// ------------------------ LCD Ready function -----------------------------------
void lcdready() {
    busy = 1;  // Make P0.7 input port
    rs = 0;  // RS=0 for command register
    rw = 1;  // R/W=1 to read the command register
    while (busy == 1) {  // Wait until busy flag is 0
        en = 0;  // Pulse E=1 to check for the busy flag
        MSDealy(1);
        en = 1;  // Pulse E=0 to latch in the busy flag
    }
    return;
}

// ---------------------------- Delay function -----------------------------------
void MSDealy(unsigned int itime) {
    unsigned int i, j;
    for (i = 0; i < itime; i++) {
        for (j = 0; j < 1275; j++);
    }
}
