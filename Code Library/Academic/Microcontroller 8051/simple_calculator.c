/* ---------------------------------------------------------------
   OBJECTIVE:
   REALIZING A SIMPLE CALCULATOR USING MICROCONTROLLER. ADDITION, 
   SUBTRACTION, MULTIPLICATION AND DIVISION IS PERFORMED ON DECIMAL 
   NUMBERS.

   Hardware:
   - Microcontroller: 89S8252
   - Crystal Frequency: 11.0592 MHz

   I/O Port Configuration:
   - Port 0: Output for 7 Segment Display
   - Port 2: Input for Keypad

   The calculator will perform basic arithmetic operations (addition, 
   subtraction, multiplication, and division) on decimal numbers and 
   display the result on a 6-digit seven-segment display.
   
   --------------------------------------------------------------- */

#include <REG51.H>

// Pin assignments for 7-segment control
sbit srck = P1^1;  // Serial Clock Pin
sbit ser = P1^2;   // Serial Data Pin
sbit rck = P1^0;   // Register Clock Pin

// Function Declarations
void display(unsigned char);    // Display routine for 7-segment
void convert_display(unsigned char);  // Conversion from hex to display on 7-segment
void MSDelay(unsigned int);     // Delay routine
void Clear(void);               // Clear display
unsigned char getkey(void);     // Keypad input routine

// Keypad matrix
unsigned char idata keypad[4][4] = {
    '1','2','3','/',
    '4','5','6','*',
    '7','8','9','-',
    'C','0','C','+'
};

// Segment codes for digits 0-9 on a 7-segment display
unsigned char idata disp[10] = {0x40, 0xcf, 0xa4, 0x30, 0x19, 0x12, 0x02, 0xf8, 0x00, 0x10};

// Main program starts here
void main() {
    unsigned char Data1, Data2, Ans, Funct;
    
    // Initialize the display
    Clear();
    
    while (1) {
        // Get first operand (Data1)
        do {
            getkey();  // Get data from the keypad
            MSDelay(10);  // Small delay for stabilization
            Data1 = key;
            key = key & 0xF0;  // Mask upper nibble
        } while (key != 0x30);  // Wait for valid key (numbers 0-9)
        display(disp[key & 0x0F]);  // Display the first operand

        // Get operator (Funct)
        do {
            getkey();  // Get data from the keypad
            MSDelay(10);
            Funct = key;
            key = key & 0xF0;
        } while (key != 0x20);  // Wait for valid operator key
        Clear();  // Clear the display

        // Get second operand (Data2)
        do {
            getkey();  // Get data from the keypad
            MSDelay(10);
            Data2 = key;
            key = key & 0xF0;
        } while (key != 0x30);
        display(disp[key & 0x0F]);  // Display the second operand

        // Perform the calculation based on the operator
        Data1 = Data1 & 0x0F;  // Mask lower nibble for valid digit
        Data2 = Data2 & 0x0F;  // Mask lower nibble for valid digit

        switch (Funct) {
            case ('+'):
                Ans = Data1 + Data2;
                convert_display(Ans);  // Display the result
                break;

            case ('-'):
                Ans = Data1 - Data2;
                convert_display(Ans);  // Display the result
                break;

            case ('*'):
                Ans = Data1 * Data2;
                convert_display(Ans);  // Display the result
                break;

            case ('/'):
                if (Data2 != 0) {
                    Ans = Data1 / Data2;  // Perform division
                } else {
                    Ans = 0xFF;  // Handle division by zero
                }
                convert_display(Ans);  // Display the result
                break;
        }
    }
}

/* Clear the display */
void Clear(void) {
    unsigned int x;
    for (x = 0; x < 6; x++) {
        display(0xFF);
    }
}

/* Delay function */
void MSDelay(unsigned int value) {
    unsigned int x, y;
    for (x = 0; x < 900; x++) {
        for (y = 0; y < value; y++);
    }
}

/* Routine to read matrix keyboard */
unsigned char getkey(void) {
    unsigned char colloc, rowloc;
    TMOD = 0x20;
    TH1 = -3;
    SCON = 0x50;
    TR1 = 1;
    P2 = 0xFF;

    do {
        P2 = 0x0F; // Wait until all keys are released
        colloc = P2;
        colloc &= 0x0F;
    } while (colloc != 0x0F);

    do {
        MSDelay(1);
        colloc = P2;
        colloc &= 0x0F;
    } while (colloc == 0x0F); // Check if any key is pressed

    MSDelay(1);
    colloc = P2;
    colloc &= 0x0F; // Confirm if any key is pressed after delay
    while (colloc == 0x0F); // Avoid spikes

    while (1) {
        P2 = 0xFE; // Get the row presses
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

    // Get the column presses
    if (colloc == 0xE0) key = (keypad[rowloc][0]);
    else if (colloc == 0xD0) key = (keypad[rowloc][1]);
    else if (colloc == 0xB0) key = (keypad[rowloc][2]);
    else key = (keypad[rowloc][3]);
    return key;
}

/* Conversion from hex to decimal for display */
void convert_display(unsigned char value) {
    unsigned char x, d1, d2, d3;
    x = value / 10; // Divide by 10
    d1 = value % 10; // Save low digit (remainder of division)
    d2 = x % 10;
    d3 = x / 10; // Divide by 10 once more
    display(d1);
    display(d2);
    display(d3);
}

/* Routine to display data on the 7-segment display */
void display(unsigned char value) {
    char m;
    char buffer;
    buffer = value;
    for (m = 0; m < 8; m++) {
        if (buffer & 0x80) ser = 1;
        else ser = 0;
        srck = 1;
        buffer <<= 1;
        srck = 0;
    }
    rck = 1;
    rck = 0;
}
