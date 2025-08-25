// Wiring Assumption for BLDC 6-step control:
// High-side MOSFETs:
//   H1 -> GPIO 14
//   H2 -> GPIO 26
//   H3 -> GPIO 33
// Low-side MOSFETs:
//   L1 -> GPIO 27
//   L2 -> GPIO 25
//   L3 -> GPIO 32

// Define pins for each MOSFET
const int H1 = 14;  // High-side Phase A
const int L1 = 27;  // Low-side Phase A
const int H2 = 26;  // High-side Phase B
const int L2 = 25;  // Low-side Phase B
const int H3 = 33;  // High-side Phase C
const int L3 = 32;  // Low-side Phase C

// Delay between commutation steps in milliseconds
const int STEP_DELAY = 500;  // Adjust for desired step duration on CRO

void setup() {
  // Initialize all control pins as OUTPUT
  pinMode(H1, OUTPUT);
  pinMode(L1, OUTPUT);
  pinMode(H2, OUTPUT);
  pinMode(L2, OUTPUT);
  pinMode(H3, OUTPUT);
  pinMode(L3, OUTPUT);
}

void loop() {
  // Step 1: High = H1, Low = L2
  setPhase(H1, L2);
  delay(STEP_DELAY);

  // Step 2: High = H1, Low = L3
  setPhase(H1, L3);
  delay(STEP_DELAY);

  // Step 3: High = H2, Low = L3
  setPhase(H2, L3);
  delay(STEP_DELAY);

  // Step 4: High = H2, Low = L1
  setPhase(H2, L1);
  delay(STEP_DELAY);

  // Step 5: High = H3, Low = L1
  setPhase(H3, L1);
  delay(STEP_DELAY);

  // Step 6: High = H3, Low = L2
  setPhase(H3, L2);
  delay(STEP_DELAY);
}

// Helper function to enable one high-side and one low-side MOSFET
void setPhase(int highPin, int lowPin) {
  // Turn off all MOSFETs before switching to the next step
  digitalWrite(H1, LOW);
  digitalWrite(H2, LOW);
  digitalWrite(H3, LOW);
  digitalWrite(L1, LOW);
  digitalWrite(L2, LOW);
  digitalWrite(L3, LOW);

  // Enable selected high-side and low-side MOSFETs
  digitalWrite(highPin, HIGH);
  digitalWrite(lowPin, HIGH);
}
