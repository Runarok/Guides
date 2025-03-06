/*
1(ii). To interface Push button/Digital sensor (IR/LDR) with Arduino/Raspberry Pi and write a program to ‘turn ON’ LED when push button is pressed or at sensor detection.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Pin connection: GPIO 2 to RGB LED, GPIO 16 to any Switch(SW)
● Click on Verify, Upload & check the output in serial monitor and kit (press the switch and see the changes)
*/

/* Program to turn ON LED when Push Button is pressed */

#define BUTTON_PIN 16  // ESP32 pin GPIO16, which is connected to the push button
#define LED_PIN    2   // ESP32 pin GPIO2, which is connected to the LED

// The below is a variable to read the button status
int button_state = 0;   // Variable for reading the button state (HIGH or LOW)

void setup() {
  // initialize the LED pin as an output:
  pinMode(LED_PIN, OUTPUT);
  
  // initialize the button pin as a pull-up input:
  // The pull-up input pin will be HIGH when the button is open (not pressed)
  // and LOW when the button is pressed.
  pinMode(BUTTON_PIN, INPUT);
  
  // Start serial communication for debugging:
  Serial.begin(9600);
}

void loop() {
  // Read the state of the button:
  button_state = digitalRead(BUTTON_PIN);
  Serial.print("BUTTON VALUE: ");
  Serial.println(button_state);  // Print the button state to the serial monitor
  delay(100);  // Delay to avoid flooding the serial monitor

  // Control LED according to the state of the button
  if (button_state == LOW) {       // If button is pressed (LOW state)
    digitalWrite(LED_PIN, HIGH);   // Turn ON the LED
  } else {                         // Otherwise, button is not pressed
    digitalWrite(LED_PIN, LOW);    // Turn OFF the LED
  }
}
