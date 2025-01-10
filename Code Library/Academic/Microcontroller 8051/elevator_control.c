/* ---------------------------------------------------------------
Objective:
This program demonstrates the basic working of an elevator system. The input is provided via a matrix keypad, and the output is displayed on a 2x16 LCD screen. The program simulates the elevator movement based on the floor number selected through the keypad. 

Hardware:
- Microcontroller: 89s8252
- Crystal Frequency: 11.0592 MHz
- I/O Port Configuration:
  - Port 0: Output for LCD Data
  - Port 1: Not in use
  - Port 2: Input for Matrix Keypad
  - Port 3: Output for LCD Control
- Keypad Mapping:
  1 2 3
  4 5 6
  7 8 9
  0 ; (Up/Down)
---------------------------------------------------------------*/

#include <REG52.H>

// LCD related variables and control pins
sfr ldata = 0x80; // LCD data register
sbit rs = P3^7;    // Register select for LCD
sbit rw = P3^6;    // Read/Write control for LCD
sbit en = P3^5;    // Enable control for LCD
sbit busy = P0^7;  // Busy flag for LCD
sbit carry = PSW^7; // Carry bit in program status word

// Function prototypes
void convert_display(unsigned char);  // Converts hexadecimal to binary (not used in current code)
void MSDelay(unsigned int);            // Delay function
void lcdcmd(unsigned char value);      // Send command to LCD
void lcddata(unsigned char value);     // Send data to LCD
void lcdready();                       // Check if LCD is ready
void down();                           // Function to simulate the elevator moving down
void up();                             // Function to simulate the elevator moving up
unsigned char getkey();                // Function to read key from the matrix keypad

// Global variables
unsigned char i, j, countl, countr, key = 0, Data1 = '0', Data2 = '0', Funct, Ans;
unsigned char idata msg[9] = {"Floor No:"};  // Message to display on LCD
unsigned char idata keypad[4][4] = {        // Mapping of matrix keypad
    '1','2','3','X',
    '4','5','6','X',
    '7','8','9','X',
    'X','0','X','X',
};

void main()
{
    // Initialize the LCD by sending commands
    lcdcmd(0x38);  // 2-line display, 5x7 matrix
    lcdcmd(0x0e);  // Display ON, cursor ON
    lcdcmd(0x01);  // Clear LCD
    lcdcmd(0x06);  // Entry mode, increment cursor
    lcdcmd(0x80);  // Set cursor to the first line, first position
    
    // Display the message "Floor No:" on LCD
    for (j = 0; j < 9; j++) {
        lcddata(msg[j]);  // Display each character of "Floor No:"
    }

    // Set the initial floor to '00' on the LCD
    lcdcmd(0x8A);  // Move cursor to line 1, column 10
    lcddata('0');  // First digit
    lcddata('0');  // Second digit

    // Main loop to continuously read input from keypad
    while(1) {
        do {
            getkey();        // Get input from keypad
            MSDelay(10);    // Small delay to stabilize
            Data1 = key;    // Store the first digit from keypad input
            key = key & 0xF0;  // Mask the upper nibble (clear lower nibble)
        }
        while (key != 0x30);  // Wait for the key '0' to be pressed
        
        carry = 0;  // Reset carry flag
        
        // Compare the current floor (Data1) with the destination floor (Data2)
        if (Data1 < Data2) {
            down();   // If current floor is higher, move down
        } else {
            up();     // If current floor is lower, move up
        }
    }
}

// Function to simulate the elevator moving down one floor at a time
void down() {
    // Loop to move down from the current floor (Data2) to the destination floor (Data1)
    for (i = (Data2 - Data1); i > 0; i--) {
        for (j = 3; j > 0; j--) {
            lcdcmd(0x8E);  // Move the cursor to the display position
            lcddata('v');  // Display 'v' to simulate downward movement
            lcddata('v');  // Display another 'v' for better visualization
            MSDelay(30);   // Delay for a short time to visualize movement
            lcdcmd(0x8E);  // Clear the previous 'v' characters
            lcddata(' ');  // Replace with spaces to simulate empty movement
            lcddata(' ');
            MSDelay(30);   // Delay for a short time
        }
        Data2--;  // Decrease the floor number
        lcdcmd(0x8b);  // Move the cursor to the floor number display position
        lcddata(Data2);  // Display the updated floor number
    }
}

// Function to simulate the elevator moving up one floor at a time
void up() {
    // Loop to move up from the current floor (Data2) to the destination floor (Data1)
    for (i = (Data1 - Data2); i > 0; i--) {
        for (j = 3; j > 0; j--) {
            lcdcmd(0x8E);  // Move the cursor to the display position
            lcddata('^');  // Display '^' to simulate upward movement
            lcddata('^');  // Display another '^' for better visualization
            MSDelay(30);   // Delay for a short time to visualize movement
            lcdcmd(0x8E);  // Clear the previous '^' characters
            lcddata(' ');  // Replace with spaces to simulate empty movement
            lcddata(' ');
            MSDelay(30);   // Delay for a short time
        }
        Data2++;  // Increase the floor number
        lcdcmd(0x8b);  // Move the cursor to the floor number display position
        lcddata(Data2);  // Display the updated floor number
    }
}

// Delay function to create pauses between actions
void MSDelay(unsigned int value)
{
    unsigned int x, y;
    for (x = 0; x < 900; x++)  // Outer loop for delay
        for (y = 0; y < value; y++);  // Inner loop for finer control of delay
}

// Function to send a command to the LCD
void lcdcmd(unsigned char value)
{
    lcdready();           // Ensure LCD is ready
    ldata = value;       // Place the command in the LCD data register
    rs = 0;              // RS = 0 for command mode
    rw = 0;              // RW = 0 for write mode
    en = 1;              // Enable the LCD to accept the command
    MSDelay(1);          // Short delay
    en = 0;              // Disable the LCD after command is accepted
    return;
}

// Function to send data to the LCD
void lcddata(unsigned char value)
{
    lcdready();           // Ensure LCD is ready
    ldata = value;       // Place the data in the LCD data register
    rs = 1;              // RS = 1 for data mode
    rw = 0;              // RW = 0 for write mode
    en = 1;              // Enable the LCD to accept the data
    MSDelay(1);          // Short delay
    en = 0;              // Disable the LCD after data is accepted
    return;
}

// Function to check if the LCD is ready to accept data/commands
void lcdready()
{
    busy = 1;             // Set busy flag
    rs = 0;               // RS = 0 to access command register
    rw = 1;               // RW = 1 to read command register (check busy flag)
    while (busy == 1) {   // Wait until the busy flag is cleared
        en = 0;
        MSDelay(1);       // Short delay
        en = 1;
    }
    return;
}

// Function to read key from the matrix keypad
unsigned char getkey()
{
    unsigned char colloc, rowloc;
    TMOD = 0x20;  // Set timer mode
    TH1 = -3;     // Set baud rate for serial communication
    SCON = 0x50;  // Set serial control for communication
    TR1 = 1;      // Start the timer
    P2 = 0xff;    // Set the P2 port to high (release all keys)
    
    // Wait until all keys are released
    do {
        P2 = 0x0f;      // Set lower nibble to 0 to check for key press
        colloc = P2;    // Read the value from P2
        colloc &= 0x0f; // Mask the upper nibble to check for key press
    } while (colloc != 0x0f);  // Loop until no key is pressed

    // Check for key press
    do {
        do {
            MSDelay(1);       // Wait for a brief time
            colloc = P2;      // Read the value from P2
            colloc &= 0x0f;   // Mask the upper nibble to check for key press
        } while (colloc == 0x0f);  // Wait until key press is detected
        
        MSDelay(1);  // Short delay for stabilization
        colloc = P2; // Read the value from P2 again
        colloc &= 0x0f;  // Mask the upper nibble to check for key press
    } while (colloc == 0x0f);  // Avoid any spikes from key press
    
    // Determine which row and column corresponds to the pressed key
    while (1) {
        P2 = 0xfE;  // Set the row to check
        colloc = P2;
        colloc &= 0xf0; // Mask to check column press
        if (colloc != 0xf0) {
            rowloc = 0;
            break;
        }
        P2 = 0xfd;
        colloc = P2;
        colloc &= 0xf0;
        if (colloc != 0xf0) {
            rowloc = 1;
            break;
        }
        P2 = 0xfb;
        colloc = P2;
        colloc &= 0xf0;
        if (colloc != 0xf0) {
            rowloc = 2;
            break;
        }
        P2 = 0xf7;
        colloc = P2;
        colloc &= 0xf0;
        rowloc = 3;
        break;
    }
    
    // Identify which key was pressed based on the row and column
    if (colloc == 0xe0) key = (keypad[rowloc][0]);
    else if (colloc == 0xd0) key = (keypad[rowloc][1]);
    else if (colloc == 0xb0) key = (keypad[rowloc][2]);
    else key = (keypad[rowloc][3]);

    return key;
}
