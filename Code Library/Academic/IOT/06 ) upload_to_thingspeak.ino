/*
6. Write a program on Arduino/Raspberry Pi to upload temperature and humidity data to ThingSpeak cloud.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Install ThingSpeak by Mathworks
● Pin connection: GPIO 4 to DHT11
● Go to google→Open ThingSpeak→create account→login
● Create new channel, replace the channel number & API key in the program (myChannelNumber & myWriteAPIKey)
● Replace network SSID & network password in the program
● Click on Verify, Upload & check the output (temp & hum values stored in cloud) in the serial monitor.
*/

#include <WiFi.h>
#include "ThingSpeak.h" // Always include ThingSpeak header file after other header files and custom macros
#include "DHT.h"

char ssid[] = "IOT LAB";   // your network SSID (WiFi name)
char pass[] = "Reddy@143";   // your network password

unsigned long myChannelNumber = 2417272; // Replace with your ThingSpeak channel number
const char * myWriteAPIKey = "ZFOBMH8RPAD6OUDB"; // Replace with your ThingSpeak API key

// Initialize DHT11 sensor
#define DHTPIN 4   // Digital pin connected to the DHT sensor
#define DHTTYPE DHT11 // DHT 11 sensor type

// Create an instance of the DHT class
DHT Dht(DHTPIN, DHTTYPE);
WiFiClient  client;

float temp = 0;
float hum = 0;

void setup() {
  Serial.begin(9600);  // Initialize serial communication
  WiFi.mode(WIFI_STA);  // Set WiFi to Station mode
  ThingSpeak.begin(client);  // Initialize ThingSpeak
  
  Dht.begin();  // Initialize DHT11 sensor

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
  delay(2000); // Wait for 2 seconds before taking another reading

  // Read temperature and humidity from the DHT11 sensor
  temp = Dht.readTemperature();
  hum = Dht.readHumidity();

  if (isnan(temp) || isnan(hum)) {
    Serial.println("Failed to read from DHT sensor!");
    delay(1000);
    return;
  }

  // Print temperature and humidity to the Serial Monitor
  Serial.print("Temperature: ");
  Serial.println(temp);
  Serial.print("Humidity: ");
  Serial.println(hum);
  Serial.println();

  // Set fields for ThingSpeak
  ThingSpeak.setField(1, temp);  // Set field 1 to temperature
  ThingSpeak.setField(2, hum);   // Set field 2 to humidity

  // Update the ThingSpeak channel
  int x = ThingSpeak.writeFields(myChannelNumber, myWriteAPIKey);
  if(x == 200){
    Serial.println("Channel update successful.");
  } else {
    Serial.println("Problem updating channel. HTTP error code " + String(x));
  }

  delay(15000); // Wait 15 seconds before updating the channel again
}
