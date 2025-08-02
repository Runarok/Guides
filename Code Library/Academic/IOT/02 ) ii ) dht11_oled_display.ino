/*
2(ii). To interface OLED with Arduino/Raspberry Pi and write a program to print temperature and humidity readings on it.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Pin connection: GPIO 4 to DHT11 O/P, GPIO 14 to CS of 1.8 TFT display, GPIO 12 to RES of 1.8 TFT display, GPIO 13 to A0 of 1.8 TFT display, GPIO 22 to SCK of 1.8 TFT display, GPIO 21 to SDA of 1.8 TFT display, LED of 1.8 TFT display to 3.3 V or 5 V.
● Install DHT sensor library by Adafruit
● Install Adafruit ST7735 library
● Click on Verify, Upload & check the output in serial monitor and kit (displays Temperature & Humidity values).
*/

/* Program to read temperature and humidity from DHT11 sensor and display the values on a TFT display */

#include <Adafruit_ST7735.h>  // Include display library
#include "DHT.h"              // Include DHT sensor library
#include <SPI.h>               // Include SPI library for communication

// DHT11 Sensor setup
#define DHTPIN 4     // Digital pin connected to the DHT11 sensor
#define DHTTYPE DHT11   // Define the sensor type as DHT11
DHT Dht(DHTPIN, DHTTYPE); // Initialize the DHT sensor

float temp = 0;  // Variable to store temperature value
float hum = 0;   // Variable to store humidity value

// Display pins configuration
#define Display_CS     14  // Chip select pin for display
#define Display_RES    12  // Reset pin for display
#define Display_A0     13  // A0 pin for display
#define Display_SCK    22  // SCK pin for display
#define Display_SDA    21  // SDA pin for display

// Initialize the display object
Adafruit_ST7735 Display = Adafruit_ST7735(Display_CS, Display_A0, Display_SDA, Display_SCK, Display_RES);

void setup(void) {
  Serial.begin(9600);  // Initialize serial communication
  Serial.println("DHT11 Test!");  // Print test message to serial monitor
  Dht.begin();  // Initialize the DHT sensor

  // Initialize the display
  Display.initR(INITR_BLACKTAB);  // Initialize the ST7735S TFT display
  Display.setTextWrap(true);  // Enable text wrapping
  Display.setRotation(1);  // Set display rotation
}

void loop() {
  delay(2000);  // Wait for 2 seconds between measurements

  // Read temperature and humidity values from the sensor
  temp = Dht.readTemperature();  // Get temperature in Celsius
  hum = Dht.readHumidity();     // Get humidity as a percentage

  // Check if the sensor readings are valid
  if (isnan(temp) || isnan(hum)) {
    Serial.println("DHT11 sensor pin not connected properly!");  // Print error message if invalid
    return;  // Exit the loop if sensor is not connected properly
  }

  // Print the temperature and humidity values to the serial monitor
  Serial.print("Temperature (°C): ");
  Serial.println(temp);
  Serial.print("Humidity (%RH): ");
  Serial.println(hum);
  Serial.println();

  // Update the display with the latest temperature and humidity readings
  Display.fillScreen(ST7735_BLACK);  // Clear the screen with black color
  Display.setTextSize(1);  // Set the text size to 1 (small text)

  // Display temperature on the screen
  Display.setCursor(10, 10);  // Set the cursor to position (10, 10)
  Display.setTextColor(ST7735_RED);  // Set text color to red
  Display.print("Temperature: ");  // Print the label

  Display.setCursor(100, 10);  // Set the cursor to position (100, 10)
  Display.setTextColor(ST7735_YELLOW);  // Set text color to yellow
  Display.println(temp);  // Print the temperature value

  // Display humidity on the screen
  Display.setCursor(10, 30);  // Set the cursor to position (10, 30)
  Display.setTextColor(ST7735_RED);  // Set text color to red
  Display.print("Humidity: ");  // Print the label

  Display.setCursor(100, 30);  // Set the cursor to position (100, 30)
  Display.setTextColor(ST7735_YELLOW);  // Set text color to yellow
  Display.println(hum);  // Print the humidity value

  delay(2000);  // Wait for 2 seconds before the next loop
}
