/*
8. Write a program to interface LED using Telegram App.
Steps:
● Write the program
● Select the board-->DOIT ESP32 DEVKIT V1-->COM 4 serial port USB
● Install UniversalTelegramBot by Brian Lough
● Install ArduinoJson by Benoit Blanchon
● BOTtoken: 
  o Install telegram app in your mobile
  o Search for BotFather, Type /newbot (To create a new bot)
  o Give a name for your bot (Eg: CPROBO)
  o Give a username for your bot (Eg: CPROBO_bot)
  o You will get a BOTtoken (e.g., 7821273262:AAEYfme2VObXSokSk58DQhVdAvViuJHgeTQ)
  o Come out of Botfather and search for userinfobot in telegram
  o Type /start
  o You will get a Chat_Id (e.g., 7820393453)
  o Come out of userinfo and search for your bot (Type: CPROBO) and Click on start
  o Type /start
  o Follow the commands
*/

#include <WiFi.h>                       // Include the WiFi library to connect to WiFi
#include <WiFiClientSecure.h>            // Include the secure WiFiClient library to communicate securely with Telegram API
#include <UniversalTelegramBot.h>        // Include the Universal Telegram Bot library to interact with Telegram
#include <ArduinoJson.h>                // Include the ArduinoJson library (useful for parsing JSON data)

const char* ssid = "IOT LAB";           // WiFi SSID
const char* password = "Reddy@143";     // WiFi password

#define BOTtoken "Telegram Bot token" // Telegram Bot token received from BotFather
#define CHAT_ID "7820393453"            // Chat ID received from userinfobot to identify your chat

WiFiClientSecure client;               // Create a secure WiFi client
UniversalTelegramBot bot(BOTtoken, client); // Initialize the bot with your BOT token and secure client

int botRequestDelay = 1000;            // Delay between bot requests (in milliseconds)
unsigned long lastTimeBotRan;          // To store the time when the bot last ran

const int ledPin = 2;                  // Define the pin for the LED
bool ledState = LOW;                   // Initialize the LED state as OFF

// Function to handle new messages from Telegram bot
void NewMessagesHandle(int NewMessages) {
  Serial.println("NewMessagesHandle");
  Serial.println(String(NewMessages));

  // Loop through all new messages
  for (int i = 0; i < NewMessages; i++) {
    String chat_id = String(bot.messages[i].chat_id);  // Get the chat ID of the sender
    Serial.println("Chat ID: " + chat_id);

    // Check if the message is from the authorized user
    if (chat_id != CHAT_ID) {
      bot.sendMessage(chat_id, "Unauthorized user", "");  // Send unauthorized message
      continue;  // Skip this message and move to the next
    }

    String text = bot.messages[i].text;  // Get the text of the message
    Serial.println(text);

    String from_name = bot.messages[i].from_name;  // Get the sender's name

    // Respond to the /start command
    if (text == "/start") {
      String welcome = "Welcome, " + from_name + ".\n";
      welcome += "Use the following commands to control the LED.\n\n";
      welcome += "/led_on to turn ON LED\n";
      welcome += "/led_off to turn OFF LED\n";
      welcome += "/state to request current LED state\n";
      bot.sendMessage(chat_id, welcome, "");  // Send the welcome message with available commands
    }

    // Respond to the /led_on command to turn the LED on
    if (text == "/led_on") {
      bot.sendMessage(chat_id, "The LED is turned ON", "");  // Notify user that the LED is ON
      ledState = HIGH;                              // Set the LED state to HIGH (ON)
      digitalWrite(ledPin, ledState);               // Turn the LED on
    }

    // Respond to the /led_off command to turn the LED off
    if (text == "/led_off") {
      bot.sendMessage(chat_id, "The LED is turned OFF", "");  // Notify user that the LED is OFF
      ledState = LOW;                               // Set the LED state to LOW (OFF)
      digitalWrite(ledPin, ledState);               // Turn the LED off
    }

    // Respond to the /state command to check the LED state
    if (text == "/state") {
      if (digitalRead(ledPin)) {
        bot.sendMessage(chat_id, "LED is ON", "");  // If LED is on, notify user
      } else {
        bot.sendMessage(chat_id, "LED is OFF", "");  // If LED is off, notify user
      }
    }
  }
}

void setup() {
  Serial.begin(9600);  // Initialize serial communication for debugging
  pinMode(ledPin, OUTPUT);  // Set the LED pin as an output
  digitalWrite(ledPin, ledState);  // Set the initial LED state (OFF)

  WiFi.mode(WIFI_STA);                // Set WiFi mode to Station (STA)
  WiFi.begin(ssid, password);         // Connect to the WiFi network
  Serial.print("Connecting to ");
  Serial.println(ssid);
  delay(1000);                       // Wait for 1 second
  while (WiFi.waitForConnectResult() != WL_CONNECTED) { 
    Serial.print("."); 
  }
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("Your Local IP address is: ");
  Serial.println(WiFi.localIP());     // Print the local IP address
  client.setCACert(TELEGRAM_CERTIFICATE_ROOT); // Set the root certificate for Telegram's API
}

void loop() {
  if (millis() > lastTimeBotRan + botRequestDelay) {
    // Check for new messages every 1 second
    int NewMessages = bot.getUpdates(bot.last_message_received + 1);

    while (NewMessages) {
      Serial.println("Response Received!");
      NewMessagesHandle(NewMessages);  // Handle new messages
      NewMessages = bot.getUpdates(bot.last_message_received + 1);  // Check for more new messages
    }
    lastTimeBotRan = millis();  // Update the last time the bot ran
  }
}
