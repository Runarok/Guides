/*
4(i). Write an Arduino/Raspberry Pi program to interface the Soil Moisture Sensor.
4(ii). Write an Arduino/Raspberry Pi program to interface the LDR/Photo Sensor.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Pin connection: GPIO 34 to LDR output pin
● Click on Verify, Upload & check the output in the serial monitor.
● The LDR produces a varying voltage depending on the light intensity, which the ESP32 reads as an integer value between 0 (no light) and 4095 (maximum light intensity).
*/

/* Program to interface LDR (Light Dependent Resistor) with ESP32 and read the light intensity */

#define LDR_PIN 34  // The ADC pin where LDR is connected (can change to any ADC pin on the ESP32)

void setup() {
  // Initialize Serial Monitor at 9600 baud rate for displaying LDR values
  Serial.begin(9600);
 
  // Set the LDR pin as an input for reading the sensor value
  pinMode(LDR_PIN, INPUT);
}

void loop() {
  // Read the analog value from the LDR sensor (range 0-4095)
  int ldrValue = analogRead(LDR_PIN);
 
  // Print the LDR value to the Serial Monitor
  Serial.print("LDR Value: ");
  Serial.println(ldrValue);
 
  // Add a small delay (1 second) before reading again
  delay(1000);
}
