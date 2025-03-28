/*
1(i).  To interface LED/Buzzer with Arduino/Raspberry Pi and write a program to ‘turn ON’ LED for 1 sec after every 2 seconds.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Pin connection: GPIO 2 to any RGB LED
● Click on Verify, Upload & check the output in serial monitor and kit.
*/

/* Program to turn ON LED for 1 sec after every 2 seconds */

#define LED 2  // Define the GPIO pin for LED (GPIO 2 in this case)

void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);  // Set the LED pin as output
  Serial.begin(9600);  // Initialize serial communication at 9600 baud rate
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(LED, HIGH);  // Turn the LED on
  Serial.println("LED ON");  // Print "LED ON" to the serial monitor
  delay(1000);  // Wait for 1 second

  digitalWrite(LED, LOW);  // Turn the LED off
  Serial.println("LED OFF");  // Print "LED OFF" to the serial monitor
  delay(1000);  // Wait for 1 second
}
