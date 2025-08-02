/*
5. Write a program to interface an Ultrasonic Sensor with Arduino /Raspberry Pi.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Pin connection: GPIO 23 to TRIG of ultrasonic sensor & GPIO 22 to ECHO of ultrasonic sensor.
● Click on Verify, Upload & check the output in the serial monitor.
● The LDR produces a varying voltage depending on the light intensity, which the ESP32 reads as an integer value between 0 (no light) and 4095 (maximum light intensity).
*/

/* Program to interface an Ultrasonic Sensor with the ESP32 and measure distance */

#define TRIGGER_PIN 23  // GPIO pin for Trigger
#define ECHO_PIN 22     // GPIO pin for Echo

void setup() {
  // Start the Serial Communication at 9600 baud rate
  Serial.begin(9600);
 
  // Set Trigger pin as OUTPUT and Echo pin as INPUT
  pinMode(TRIGGER_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
}

void loop() {
  // Variable to store the duration of the pulse
  long duration;
  // Variable to store the calculated distance
  float distance;

  // Ensure the Trigger pin is LOW before sending the pulse
  digitalWrite(TRIGGER_PIN, LOW);
  delayMicroseconds(2);  // Wait for 2 microseconds

  // Send a 10 microsecond HIGH pulse to the Trigger pin
  digitalWrite(TRIGGER_PIN, HIGH);
  delayMicroseconds(10);  // Keep the pulse HIGH for 10 microseconds
  digitalWrite(TRIGGER_PIN, LOW);

  // Read the duration of the pulse on the Echo pin (in microseconds)
  duration = pulseIn(ECHO_PIN, HIGH); 
  // Measures how long the Echo pin stays HIGH. This time duration represents the time it takes for the ultrasonic sound wave to travel to the object and return.

  // Calculate the distance in centimeters using the formula:
  // Distance = (duration / 2) * (speed of sound in cm per microsecond)
  // Speed of sound = 0.0343 cm/us
  distance = (duration / 2.0) * 0.0343;

  // Print the distance to the Serial Monitor
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

  // Delay for a short time before the next reading
  delay(500);  // 500 ms delay between measurements
}
