// 10. Write a program to create a UDP server on Arduino/Raspberry Pi and respond with humidity data to the UDP client when requested.
// Description:
// This program creates a UDP server on an ESP32 board and listens for incoming UDP packets. 
// When the server receives a request with the message "get_humidity", it reads the humidity data from a DHT11 sensor 
// connected to GPIO 4 and sends the data back to the UDP client. The ESP32 connects to a Wi-Fi network, and the program
// uses the `WiFiUDP` library for UDP communication and the `DHT` library for sensor interaction.

// Steps:
// ● Write the program
// ● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
// ● Download SocketTest V 3
// ● Pin connection: GPIO 4 to DHT11
// ● Replace network SSID & network password in the program
// ● Go to SocketTest→UDP→Type IP address of the system→Type port no. given in the program
// ● Click on start listening
// ● Upload the program
// ● In serial monitor, ESP IP address will be displayed
// ● Paste it in the SocketTest Client IP address space and give the same port number
// ● Type the message as get_humidity in the message space
// ● Click on Send
// ● Output must be observed in the serial monitor

#include <WiFi.h>
#include <WiFiUdp.h>
#include <DHT.h>

// Replace with your network credentials
char ssid[] = "IOT LAB";   // Your network SSID (name)
char pass[] = "Reddy@143"; // Your network password

// Replace with your DHT sensor type and pin
#define DHTPIN 4    // Digital pin connected to the DHT sensor
#define DHTTYPE DHT11 // DHT 11 sensor type

// Initialize the DHT11 sensor
DHT Dht(DHTPIN, DHTTYPE);

// UDP server port
#define UDP_PORT 5000

// Create an instance of the UDP object
WiFiUDP udp;

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

  // Print the ESP32 IP address to the Serial Monitor
  Serial.print("ESP32 IP address: ");
  Serial.println(WiFi.localIP());

  // Start the UDP server
  udp.begin(UDP_PORT);
  Serial.println("UDP server started");

  // Initialize the DHT sensor
  Dht.begin();
}

void loop() {
  // Wait for incoming UDP packets
  int packetSize = udp.parsePacket();
  if (packetSize) {
    // Read the incoming packet data
    char packetData[packetSize];
    udp.read(packetData, packetSize);
    String request = String(packetData);

    // Check if the request is "get_humidity"
    if (request == "get_humidity") {
      // Read the humidity from the DHT sensor
      hum = Dht.readHumidity();

      // Send the humidity data back to the UDP client
      udp.beginPacket(udp.remoteIP(), udp.remotePort());
      udp.printf("Humidity: %.2f%%", hum);
      udp.endPacket();

      // Print the sent humidity data to the serial monitor
      Serial.printf("Sent humidity data: %.2f%%\n", hum);
    }
  }
}
