/* ---------------------------------------------------------------
   OBJECTIVE:
   TO DEMONSTRATE THE BASIC INTERFACE BETWEEN AN LCD DISPLAY AND 4X4 
   MATRIX KEYBOARD. INPUT IS VIA A MATRIX KEYPAD AND OUTPUT IS 
   DISPLAYED ON A 2X16 LCD.

   Hardware Configuration:
   - Microcontroller: 89S8252
   - Crystal Frequency: 11.0592 MHz
   - Port 0: Output for LCD Data
   - Port 3: Output for LCD Control (RS, RW, EN)
   - Port 2: Input for Keypad

   --------------------------------------------------------------- */

#include <REG52.H>

sfr ldata = 0x80;  // LCD Data Register (Address for the data)
sbit rs = P3^7;    // Register Select (RS)
sbit rw = P3^6;    // Read/Write (RW)
sbit en = P3^5;    // Enable (EN)
sbit busy = P0^7;  // Busy Flag

// Function Declarations
void MSDelay(unsigned int);    // Delay function
void lcdcmd(unsigned char value);  // Send command to LCD
void lcddata(unsigned char value);  // Send data to LCD
void lcdready(void);   // Check if LCD is ready
unsigned char getkey(void);   // Read key from the matrix keypad

unsigned char j, key = 0;
unsigned char idata msg[13] = {"Key Pressed "};  // Message to display initially

unsigned char idata keypad[4][4] = { 
    '1','2','3','/', 
    '4','5','6','*', 
    '7','8','9','-', 
    'C','0','C','+' 
};

// Main function
void main() {
    // Initialize the LCD
    lcdcmd(0x38);   // Set LCD to 8-bit mode
    lcdcmd(0x0e);   // Display ON, Cursor ON
    lcdcmd(0x01);   // Clear display
    lcdcmd(0x06);   // Increment cursor
    lcdcmd(0x83);   // Set cursor to the beginning of the second row

    // Display initial message
    for (j = 0; j < 13; j++) {
        lcddata(msg[j]);  // Display "Key Pressed "
    }

    while (1) {
        lcdcmd(0xC3);  // Move cursor to a new position on the LCD
        key = getkey();  // Get key from matrix keypad
        lcddata(key);    // Display the pressed key on the LCD
        MSDelay(10);     // Delay to debounce key press
    }
}

// Delay function
void MSDelay(unsigned int value) {
    unsigned int x, y;
    for (x = 0; x < 900; x++) {
        for (y = 0; y < value; y++);
    }
}

// Send command to LCD
void lcdcmd(unsigned char value) {
    lcdready();  // Wait for LCD to be ready
    ldata = value;
    rs = 0;      // Command mode
    rw = 0;      // Write mode
    en = 1;      // Enable LCD
    MSDelay(1);  // Short delay
    en = 0;      // Disable LCD
}

// Send data to LCD
void lcddata(unsigned char value) {
    lcdready();  // Wait for LCD to be ready
    ldata = value;
    rs = 1;      // Data mode
    rw = 0;      // Write mode
    en = 1;      // Enable LCD
    MSDelay(1);  // Short delay
    en = 0;      // Disable LCD
}

// Wait until the LCD is ready for the next operation
void lcdready(void) {
    busy = 1;    // Set busy flag
    rs = 0;      // Command mode
    rw = 1;      // Read mode
    while (busy == 1) {
        en = 0;
        MSDelay(1);  // Short delay
        en = 1;      // Enable LCD to read the busy flag
    }
}

// Read key from matrix keypad
unsigned char getkey(void) {
    unsigned char colloc, rowloc;
    TMOD = 0x20;  // Timer 1 in Mode 2 (Auto-reload)
    TH1 = -3;
    SCON = 0x50;  // Serial mode 1
    TR1 = 1;
    P2 = 0xff;

    // Wait until all keys are released
    do {
        P2 = 0x0f;
        colloc = P2;
        colloc &= 0x0f;
    } while (colloc != 0x0f);

    // Wait for key press and debounce
    do {
        do {
            MSDelay(1);  // Short delay to avoid spikes
            colloc = P2;
            colloc &= 0x0f;
        } while (colloc == 0x0f);  // No key pressed

        MSDelay(1);
        colloc = P2;
        colloc &= 0x0f;
    } while (colloc == 0x0f);  // Ensure key is pressed after delay

    // Identify the row of the pressed key
    while (1) {
        P2 = 0xFE;
        colloc = P2;
        colloc &= 0xF0;
        if (colloc != 0xF0) {
            rowloc = 0;
            break;
        }
        P2 = 0xFD;
        colloc = P2;
        colloc &= 0xF0;
        if (colloc != 0xF0) {
            rowloc = 1;
            break;
        }
        P2 = 0xFB;
        colloc = P2;
        colloc &= 0xF0;
        if (colloc != 0xF0) {
            rowloc = 2;
            break;
        }
        P2 = 0xF7;
        colloc = P2;
        colloc &= 0xF0;
        rowloc = 3;
        break;
    }

    // Identify the column of the pressed key
    if (colloc == 0xE0) key = (keypad[rowloc][0]);
    else if (colloc == 0xD0) key = (keypad[rowloc][1]);
    else if (colloc == 0xB0) key = (keypad[rowloc][2]);
    else key = (keypad[rowloc][3]);

    return key;
}
