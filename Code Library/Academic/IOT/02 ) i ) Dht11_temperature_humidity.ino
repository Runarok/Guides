/*
2(i). To interface DHT11 sensor with Arduino/Raspberry Pi and write a program to print temperature and humidity readings.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Pin connection: GPIO 4 to DHT11 O/P
● Install DHT sensor library by Adafruit
● Install Adafruit ST7735 library
● Click on Verify, Upload & check the output in serial monitor (displays Temperature & Humidity values)
*/

/* Program to read temperature and humidity from DHT11 sensor and print values */

#include "DHT.h"

// Define pin connected to DHT11 sensor
#define DHTPIN 4     // Digital pin connected to the DHT sensor
#define DHTTYPE DHT11 // Define the sensor type (DHT11)
 
// Initialize the DHT sensor
DHT Dht(DHTPIN, DHTTYPE);

float temp = 0;  // Variable to store temperature
float hum = 0;   // Variable to store humidity

void setup() {
  Serial.begin(9600);  // Initialize serial communication
  Serial.println("DHT11 Test!");  // Print message to serial monitor
  Dht.begin();  // Initialize the DHT sensor
}

void loop() { 
  // Wait 2 seconds between measurements
  delay(2000);  

  // Read the temperature and humidity from the sensor
  temp = Dht.readTemperature();  // Get temperature in Celsius
  hum = Dht.readHumidity();     // Get humidity percentage

  // Check if the readings are valid
  if (isnan(temp) || isnan(hum)) {
    Serial.println("DHT11 sensor pin not connected properly!");  // If invalid, print error message
    delay(1000);  // Wait for 1 second before retrying
    return;
  }

  // Print temperature and humidity values to the serial monitor
  Serial.print("Temperature (°C): ");
  Serial.println(temp);
  Serial.print("Humidity (%RH): ");
  Serial.println(hum);
  Serial.println();  // Print a blank line for clarity
}
