# Arduino Motor Control with Obstacle Avoidance - Complete Code

## Version 1: Basic Obstacle Avoidance (Recommended for Beginners)

This code makes the robot move forward, stop when it detects an obstacle within 20cm, reverse, turn, and continue.

```cpp
// Pin Definitions for L298N Motor Driver
#define ENA 5    // PWM pin for Motor A speed
#define IN1 4    // Motor A direction pin 1
#define IN2 3    // Motor A direction pin 2
#define ENB 6    // PWM pin for Motor B speed
#define IN3 7    // Motor B direction pin 1
#define IN4 2    // Motor B direction pin 2

// Pin Definitions for HC-SR04 Ultrasonic Sensor
#define TRIG_PIN 8
#define ECHO_PIN 9

// Configuration Constants
#define OBSTACLE_DISTANCE 20    // Stop if obstacle within 20cm
#define NORMAL_SPEED 180        // Normal driving speed (0-255)
#define TURN_SPEED 150          // Speed during turns
#define SENSOR_TIMEOUT 30000    // Ultrasonic sensor timeout (30ms)

// Global Variables
long duration;
int distance;

void setup() {
  // Initialize motor control pins
  pinMode(ENA, OUTPUT);
  pinMode(ENB, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  
  // Initialize ultrasonic sensor pins
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  
  // Initialize serial communication for debugging
  Serial.begin(9600);
  
  // Initial stop state
  stopRobot();
  delay(1000);
  
  Serial.println("Robot initialized and ready!");
}

void loop() {
  // Get distance reading from ultrasonic sensor
  distance = getDistance();
  
  // Print distance for debugging
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");
  
  // Decision logic
  if (distance > OBSTACLE_DISTANCE || distance == 0) {
    // Path is clear - move forward
    moveForward();
  } else {
    // Obstacle detected - avoid it
    Serial.println("Obstacle detected! Avoiding...");
    avoidObstacle();
  }
  
  delay(100);  // Small delay for stability
}

// ===== ULTRASONIC SENSOR FUNCTION =====
int getDistance() {
  // Send trigger pulse
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  
  // Read echo pulse
  duration = pulseIn(ECHO_PIN, HIGH, SENSOR_TIMEOUT);
  
  // Return 0 if no reading (timeout)
  if (duration == 0) {
    return 0;
  }
  
  // Calculate distance in cm (speed of sound = 0.034 cm/μs)
  int dist = duration * 0.034 / 2;
  return dist;
}

// ===== MOVEMENT FUNCTIONS =====

void moveForward() {
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, NORMAL_SPEED);
  analogWrite(ENB, NORMAL_SPEED);
}

void moveBackward() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENA, NORMAL_SPEED);
  analogWrite(ENB, NORMAL_SPEED);
}

void turnLeft() {
  // Left motor backward, right motor forward
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, TURN_SPEED);
  analogWrite(ENB, TURN_SPEED);
}

void turnRight() {
  // Left motor forward, right motor backward
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENA, TURN_SPEED);
  analogWrite(ENB, TURN_SPEED);
}

void stopRobot() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, 0);
  analogWrite(ENB, 0);
}

// ===== OBSTACLE AVOIDANCE LOGIC =====
void avoidObstacle() {
  // Stop immediately
  stopRobot();
  delay(500);
  
  // Reverse for 1 second
  Serial.println("Reversing...");
  moveBackward();
  delay(1000);
  
  // Stop
  stopRobot();
  delay(500);
  
  // Turn right for 0.7 seconds (approximately 90 degrees)
  Serial.println("Turning right...");
  turnRight();
  delay(700);
  
  // Stop after turn
  stopRobot();
  delay(300);
  
  Serial.println("Resuming forward motion...");
}
```

---

## Version 2: Advanced Obstacle Avoidance with Path Selection

This version checks left and right directions to choose the best path.

```cpp
// Pin Definitions for L298N Motor Driver
#define ENA 5
#define IN1 4
#define IN2 3
#define ENB 6
#define IN3 7
#define IN4 2

// Pin Definitions for HC-SR04 Ultrasonic Sensor
#define TRIG_PIN 8
#define ECHO_PIN 9

// Configuration Constants
#define OBSTACLE_DISTANCE 25
#define CRITICAL_DISTANCE 15
#define NORMAL_SPEED 180
#define SLOW_SPEED 120
#define TURN_SPEED 150
#define SENSOR_TIMEOUT 30000

// Global Variables
long duration;
int distance;

void setup() {
  pinMode(ENA, OUTPUT);
  pinMode(ENB, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  
  Serial.begin(9600);
  stopRobot();
  delay(1000);
  
  Serial.println("Advanced Robot initialized!");
}

void loop() {
  distance = getDistance();
  
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");
  
  if (distance > OBSTACLE_DISTANCE || distance == 0) {
    moveForward();
  } else if (distance > CRITICAL_DISTANCE) {
    // Slow down when getting close
    moveForwardSlow();
  } else {
    // Obstacle too close - smart avoidance
    Serial.println("Obstacle detected! Scanning...");
    smartAvoidance();
  }
  
  delay(50);
}

// ===== SENSOR FUNCTION =====
int getDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  
  duration = pulseIn(ECHO_PIN, HIGH, SENSOR_TIMEOUT);
  if (duration == 0) return 0;
  
  int dist = duration * 0.034 / 2;
  return dist;
}

// ===== MOVEMENT FUNCTIONS =====
void moveForward() {
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, NORMAL_SPEED);
  analogWrite(ENB, NORMAL_SPEED);
}

void moveForwardSlow() {
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, SLOW_SPEED);
  analogWrite(ENB, SLOW_SPEED);
}

void moveBackward() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENA, NORMAL_SPEED);
  analogWrite(ENB, NORMAL_SPEED);
}

void turnLeft() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, TURN_SPEED);
  analogWrite(ENB, TURN_SPEED);
}

void turnRight() {
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENA, TURN_SPEED);
  analogWrite(ENB, TURN_SPEED);
}

void stopRobot() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, 0);
  analogWrite(ENB, 0);
}

// ===== SMART OBSTACLE AVOIDANCE =====
void smartAvoidance() {
  stopRobot();
  delay(300);
  
  // Reverse a bit
  moveBackward();
  delay(800);
  stopRobot();
  delay(300);
  
  // Scan right
  Serial.println("Scanning right...");
  turnRight();
  delay(400);  // Turn ~45 degrees
  stopRobot();
  delay(200);
  int rightDistance = getDistance();
  Serial.print("Right distance: ");
  Serial.print(rightDistance);
  Serial.println(" cm");
  
  // Return to center
  turnLeft();
  delay(400);
  stopRobot();
  delay(200);
  
  // Scan left
  Serial.println("Scanning left...");
  turnLeft();
  delay(400);  // Turn ~45 degrees
  stopRobot();
  delay(200);
  int leftDistance = getDistance();
  Serial.print("Left distance: ");
  Serial.print(leftDistance);
  Serial.println(" cm");
  
  // Return to center
  turnRight();
  delay(400);
  stopRobot();
  delay(200);
  
  // Choose best path
  if (rightDistance > leftDistance && rightDistance > OBSTACLE_DISTANCE) {
    Serial.println("Turning right - better path");
    turnRight();
    delay(700);  // Turn ~90 degrees
  } else if (leftDistance > OBSTACLE_DISTANCE) {
    Serial.println("Turning left - better path");
    turnLeft();
    delay(700);  // Turn ~90 degrees
  } else {
    Serial.println("Both sides blocked - turning around");
    turnRight();
    delay(1400);  // Turn ~180 degrees
  }
  
  stopRobot();
  delay(300);
}
```

---

## Version 3: Simple Test Program (For Testing Components)

Use this to verify motors and sensor work correctly before running full obstacle avoidance.

```cpp
// Pin Definitions
#define ENA 5
#define IN1 4
#define IN2 3
#define ENB 6
#define IN3 7
#define IN4 2
#define TRIG_PIN 8
#define ECHO_PIN 9

void setup() {
  pinMode(ENA, OUTPUT);
  pinMode(ENB, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  
  Serial.begin(9600);
  Serial.println("=== Component Test Program ===");
  Serial.println("Testing will begin in 3 seconds...");
  delay(3000);
}

void loop() {
  // Test 1: Ultrasonic Sensor
  Serial.println("\n--- Test 1: Ultrasonic Sensor ---");
  for (int i = 0; i < 10; i++) {
    int dist = getDistance();
    Serial.print("Distance reading ");
    Serial.print(i + 1);
    Serial.print(": ");
    Serial.print(dist);
    Serial.println(" cm");
    delay(500);
  }
  
  // Test 2: Forward Movement
  Serial.println("\n--- Test 2: Moving Forward ---");
  moveForward();
  delay(2000);
  stopRobot();
  delay(1000);
  
  // Test 3: Backward Movement
  Serial.println("\n--- Test 3: Moving Backward ---");
  moveBackward();
  delay(2000);
  stopRobot();
  delay(1000);
  
  // Test 4: Turn Left
  Serial.println("\n--- Test 4: Turning Left ---");
  turnLeft();
  delay(1000);
  stopRobot();
  delay(1000);
  
  // Test 5: Turn Right
  Serial.println("\n--- Test 5: Turning Right ---");
  turnRight();
  delay(1000);
  stopRobot();
  delay(1000);
  
  Serial.println("\n=== All Tests Complete ===");
  Serial.println("Repeating tests in 5 seconds...\n");
  delay(5000);
}

int getDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  
  long duration = pulseIn(ECHO_PIN, HIGH, 30000);
  if (duration == 0) return 0;
  
  return duration * 0.034 / 2;
}

void moveForward() {
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, 180);
  analogWrite(ENB, 180);
}

void moveBackward() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENA, 180);
  analogWrite(ENB, 180);
}

void turnLeft() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, 150);
  analogWrite(ENB, 150);
}

void turnRight() {
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENA, 150);
  analogWrite(ENB, 150);
}

void stopRobot() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
  analogWrite(ENA, 0);
  analogWrite(ENB, 0);
}
```

---

## Hardware Connections Reference

### L298N Motor Driver Connections:
- **ENA** (Enable A) → Arduino Pin 5 (PWM)
- **IN1** → Arduino Pin 4
- **IN2** → Arduino Pin 3
- **ENB** (Enable B) → Arduino Pin 6 (PWM)
- **IN3** → Arduino Pin 7
- **IN4** → Arduino Pin 2
- **12V** → External power supply (7-12V)
- **GND** → Common ground with Arduino
- **5V** → Can power Arduino if jumper connected
- **Motor A** → Left motor
- **Motor B** → Right motor

### HC-SR04 Ultrasonic Sensor Connections:
- **VCC** → Arduino 5V
- **TRIG** → Arduino Pin 8
- **ECHO** → Arduino Pin 9
- **GND** → Arduino GND

---

## Tuning Parameters

Adjust these values based on your robot's behavior:

1. **OBSTACLE_DISTANCE (20-30 cm)**: Distance to start avoiding obstacles
2. **NORMAL_SPEED (150-200)**: Forward driving speed
3. **TURN_SPEED (120-180)**: Turning speed (lower = sharper turns)
4. **Turn delays (500-1500 ms)**: Adjust for 90-degree or 180-degree turns

## Troubleshooting

- **Robot doesn't move**: Check motor driver connections and power supply
- **Moves in wrong direction**: Swap IN1/IN2 or IN3/IN4 connections
- **One motor faster**: Adjust ENA/ENB speed values individually
- **Sensor always reads 0**: Check TRIG/ECHO connections and 5V power
- **Robot veers left/right**: Motors may have different speeds - adjust ENA/ENB values separately

## Usage Instructions

1. **Start with Version 3** (Test Program) to verify all components work
2. **Use Version 1** for reliable basic obstacle avoidance
3. **Use Version 2** if you want smarter path selection
4. Upload code, open Serial Monitor at 9600 baud to see debug messages
5. Place robot on the floor and watch it navigate!
