/*
3. To interface the motor using a relay with Arduino/Raspberry Pi and write a program to ‘turn ON’ the motor when the push button is pressed.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Pin connection: GPIO 22 to any switch (SW), GPIO 27 to any relay (P26)
● Click on Verify, Upload & check the output in serial monitor (press the switch and see the changes).
*/

/* Program to turn ON the motor when the push button is pressed using a relay */

#define BUTTON_PIN 22 // In ESP32, GPIO22 is connected to the button's pin
#define RELAY_PIN 27  // In ESP32, GPIO27 is connected to the relay's pin

void setup() {
  Serial.begin(9600);  // Initialize serial communication
  pinMode(BUTTON_PIN, INPUT);  // Set the button pin to input with internal pull-up resistor
  pinMode(RELAY_PIN, OUTPUT);  // Set the relay pin to output mode
}

void loop() {
  int buttonState = digitalRead(BUTTON_PIN);  // Read the state of the button

  if (buttonState == LOW) {  // If button is pressed (LOW state)
    digitalWrite(RELAY_PIN, HIGH);  // Turn on the relay (motor ON)
    Serial.println("The button is being pressed - Motor ON");
  }
  else if (buttonState == HIGH) {  // If button is not pressed (HIGH state)
    digitalWrite(RELAY_PIN, LOW);  // Turn off the relay (motor OFF)
    Serial.println("The button is unpressed - Motor OFF");
  }
}
