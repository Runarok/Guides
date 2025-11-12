// 11. Write a program to create a TCP server on Arduino/Raspberry Pi and respond with humidity data to the TCP client when requested.
// Description:
// This program creates a TCP server on an ESP32 board and listens for incoming TCP connections on port 8888. 
// When the server receives a request with the message "get_humidity", it reads the humidity data from a DHT11 sensor 
// connected to GPIO 4 and sends the data back to the TCP client. The ESP32 connects to a Wi-Fi network, and the program
// uses the `WiFiClient` library for TCP communication and the `DHT` library for sensor interaction.

// Steps:
// ● Write the program
// ● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
// ● Download SocketTest V 3
// ● Pin connection: GPIO 4 to DHT11
// ● Replace network SSID & network password in the program
// ● Go to SocketTest→Server →Type IP address of the system→Type port no. given in the program
// ● Click on start listening
// ● Go to SocketTest→Client →Type IP address of the system→Type port no. given in the program
// ● Click on Connect
// ● Upload the program
// ● Type the message as get_humidity in the message space of client
// ● Click on Send
// ● Output must be observed in the serial monitor

#include <WiFi.h>
#include <WiFiClient.h>
#include <DHT.h>

// Replace with your network credentials
char ssid[] = "IOT LAB";   // Your network SSID (name)
char pass[] = "Reddy@143"; // Your network password

#define DHTPIN 4    // Digital pin connected to the DHT sensor
#define DHTTYPE DHT11 // DHT 11 sensor type

// Initializing the DHT11 sensor
DHT Dht(DHTPIN, DHTTYPE);

// TCP server listening on port 8888
WiFiServer server(8888);

float hum = 0; // Variable to store humidity data

void setup() {
  Serial.begin(9600); // Start serial communication

  // Connect to Wi-Fi network
  if (WiFi.status() != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    while (WiFi.status() != WL_CONNECTED) {
      WiFi.begin(ssid, pass); // Connect to WPA/WPA2 network
      Serial.print(".");
      delay(5000);  // Wait for 5 seconds before retrying
    }
    Serial.println("\nConnected.");
  }

  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());  // Print the ESP32's IP address

  Dht.begin();    // Initialize the DHT sensor
  server.begin(); // Start the TCP server
}

void loop() {
  WiFiClient client = server.available(); // Check if a client has connected
  if (client) {
    Serial.println("New client connected");

    // Wait for data from the client
    while (client.connected()) {
      if (client.available()) {
        String request = client.readStringUntil('\r');  // Read the client's request
        client.flush(); // Clear the buffer

        // Check if the request is "get_humidity"
        if (request.indexOf("get_humidity") != -1) {
          // Read humidity from the DHT sensor
          hum = Dht.readHumidity();

          // Print the humidity data to the serial monitor
          Serial.print("Humidity: ");
          Serial.print(hum);
          Serial.println("%");

          // Send the humidity data back to the client
          client.print("Humidity: ");
          client.print(hum);
          client.println("%");
        }
      }
    }
    client.stop(); // Close the client connection
    Serial.println("Client Disconnected");
  }
}
