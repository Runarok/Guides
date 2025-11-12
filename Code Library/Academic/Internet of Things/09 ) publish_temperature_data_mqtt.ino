// 9. Write a program on Arduino/Raspberry Pi to publish temperature data to MQTT broker.
// Description:
// This program reads temperature and humidity data from a DHT11 sensor connected to the GPIO 4 pin
// of an ESP32 board and publishes the data to an MQTT broker. The ESP32 connects to a Wi-Fi network,
// and the MQTT broker is set to "test.mosquitto.org" (public broker) on port 1883. The program uses
// the PubSubClient library to handle the MQTT communication and the DHT library for sensor interaction.

// Steps:
// ● Write the program
// ● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
// ● Install PubSubClient by Nick O’Leary 2.8
// ● Pin connection: GPIO 4 to DHT11
// ● Replace network SSID & network password in the program
// ● Install Mqtizer App from play store to your mobile phone
// ● Click on Verify, Upload & check the output in serial monitor and MQTT broker

#include <WiFi.h>
#include <PubSubClient.h>
#include "DHT.h"

// Wi-Fi and MQTT settings
WiFiClient wifiClient;
PubSubClient mqttClient(wifiClient);

#define DHTPIN 4       // Digital pin connected to the DHT sensor
#define DHTTYPE DHT11  // DHT 11 sensor
DHT Dht(DHTPIN, DHTTYPE);

char ssid[] = "IOT LAB";    // Your network SSID (name)
char pass[] = "Reddy@143";  // Your network password

char *mqttServer = "test.mosquitto.org"; // MQTT broker address
int mqttPort = 1883;                    // MQTT port

// Variables to store sensor data
float temp = 0;
float hum = 0;

void setupMQTT() {
  mqttClient.setServer(mqttServer, mqttPort);
  // mqttClient.setCallback(callback); // Uncomment if you need a callback function
}

void reconnect() {
  Serial.println("Connecting to MQTT Broker...");
  while (!mqttClient.connected()) {
    Serial.println("Reconnecting to MQTT Broker..");
    String clientId = "ESP32Client-";
    clientId += String(random(0xffff), HEX);
    
    if (mqttClient.connect(clientId.c_str())) {
      Serial.println("Connected to MQTT Broker.");
    }
  }
}

void setup() {
  Serial.begin(9600);  // Start serial communication
  Dht.begin();         // Initialize DHT sensor
  setupMQTT();         // Set up MQTT connection

  if (WiFi.status() != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    while (WiFi.status() != WL_CONNECTED) {
      WiFi.begin(ssid, pass); // Connect to Wi-Fi network
      Serial.print(".");
      delay(5000);  // Wait for connection
    }
    Serial.println("\nConnected to Wi-Fi.");
  }
}

void loop() {
  if (!mqttClient.connected()) {
    reconnect();  // Reconnect to MQTT broker if disconnected
  }
  mqttClient.loop();  // Keep the MQTT connection alive

  delay(2000);  // Wait for a while before reading the sensor again
  temp = Dht.readTemperature();  // Read temperature
  hum = Dht.readHumidity();      // Read humidity

  // Check if the sensor readings are valid
  if (isnan(temp) || isnan(hum)) {
    Serial.println("DHT11 sensor not connected properly!");
    delay(1000);
    return;
  }

  // Convert temperature to string and publish to MQTT
  char tempString[8];
  dtostrf(temp, 1, 2, tempString);
  Serial.print("Temperature: ");
  Serial.println(tempString);
  mqttClient.publish("Temperature", tempString);

  // Convert humidity to string and publish to MQTT
  char humString[8];
  dtostrf(hum, 1, 2, humString);
  Serial.print("Humidity: ");
  Serial.println(humString);
  mqttClient.publish("Humidity", humString);

  delay(5000);  // Delay before the next reading
}
