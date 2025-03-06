/*
7. Write a program on Arduino/Raspberry Pi to retrieve temperature and humidity data from ThingSpeak cloud.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Install ThingSpeak by Mathworks
● Pin connection: GPIO 4 to DHT11
● Go to google→Open ThingSpeak→create account→login
● Create new channel, replace the channel number & API key in the program (myChannelNumber & readAPIKey)
● Replace network SSID & network password in the program
● Click on Verify, Upload & check the output (temp & hum values stored in cloud) in the serial monitor.
*/

#include <WiFi.h>
#include "ThingSpeak.h"

char ssid[] = "IOT LAB";   // your network SSID (WiFi name)
char pass[] = "Reddy@143";   // your network password

unsigned long myChannelNumber = 2417272; // Replace with your ThingSpeak channel number
const char * readAPIKey = "4AZ1XP68KC1EB53E"; // Replace with your ThingSpeak API read key

WiFiClient client;
int field[2] = {1, 2}; // Field 1 for temperature, Field 2 for humidity

float temp = 0;
float hum = 0;

void setup() {
  Serial.begin(9600);  // Initialize serial communication
  WiFi.mode(WIFI_STA);  // Set WiFi to Station mode
  ThingSpeak.begin(client);  // Initialize ThingSpeak
  
  // Connect to WiFi
  if(WiFi.status() != WL_CONNECTED){
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    while(WiFi.status() != WL_CONNECTED){
      WiFi.begin(ssid, pass);  // Connect to the WiFi network
      Serial.print(".");
      delay(5000);  // Wait for 5 seconds before retrying
    }
    Serial.println("\nConnected to WiFi.");
  }
}

void loop() {
  Serial.println("Waiting...");

  // Read multiple fields from ThingSpeak
  int x = ThingSpeak.readMultipleFields(myChannelNumber, readAPIKey);
  
  if(x == 200) {
    // Get temperature and humidity values from ThingSpeak fields
    temp = ThingSpeak.getFieldAsFloat(field[0]);  // Field 1: Temperature
    hum = ThingSpeak.getFieldAsFloat(field[1]);   // Field 2: Humidity
    
    // Print temperature and humidity values to the Serial Monitor
    Serial.println("TEMPERATURE : " + String(temp));
    Serial.println("HUMIDITY : " + String(hum));
  } else {
    // Print error message if unable to read from ThingSpeak
    Serial.println("Problem reading channel. HTTP error code " + String(x));
  }

  Serial.println();  // Print an empty line for clarity
  delay(15000);  // Wait 15 seconds before fetching the data again
}
