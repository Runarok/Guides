An **FPGA** (Field-Programmable Gate Array) is an integrated circuit designed to be configured by a customer or designer after manufacturing. It allows for custom digital circuit designs and is widely used in hardware prototyping, embedded systems, and high-performance computing.

### Key Concepts:

* **Field-Programmable**: You can reprogram it *after* it’s manufactured.
* **Gate Array**: It's composed of logic gates that can be interconnected.

### Structure:

* **CLBs** (Configurable Logic Blocks): Perform logic operations.
* **I/O Blocks**: Interface with external components.
* **Routing Matrix**: Connects CLBs and I/O blocks.
* **DSPs / RAM blocks**: For arithmetic and memory functions.

### Use Cases:

* Prototyping custom chips (ASICs)
* Signal processing (e.g., SDR)
* Cryptography
* AI/ML acceleration
* Robotics and control systems

### Programming Languages:

* **HDL** (Hardware Description Languages):

  * **VHDL**
  * **Verilog**

### **F — Field**

* **Meaning**: Programmable "in the field," meaning *after* the device has been manufactured and deployed.
* **Why it matters**: Unlike fixed-function chips, you can update or reconfigure the chip as needed in real-world use.

---

### **P — Programmable**

* **Meaning**: The chip's internal logic and interconnections can be programmed by the user.
* **Why it matters**: You can make it perform specific tasks or mimic other hardware without building a new chip.

---

### **G — Gate**

* **Meaning**: Refers to digital logic gates (like AND, OR, NOT) that form the building blocks of digital circuits.
* **Why it matters**: These gates are used to build everything from adders to CPUs inside the FPGA.

---

### **A — Array**

* **Meaning**: A grid-like structure of many configurable logic elements (gates, flip-flops, etc.).
* **Why it matters**: This arrangement gives FPGAs their flexibility and power.

---


### **WHAT** is an FPGA?

* **FPGA** stands for **Field-Programmable Gate Array**.
* It's a **reconfigurable digital circuit** that allows users to create custom hardware logic after manufacturing.
* Think of it as a **blank canvas of logic gates** that you can program to behave like any digital circuit—processor, signal processor, controller, etc.

---

### **WHY** use an FPGA?

* **Flexibility**: You can reprogram it anytime for different functions.
* **Performance**: Executes tasks in hardware, making it faster than software in many cases.
* **Parallelism**: Multiple operations can run simultaneously (unlike CPUs).
* **Prototyping**: Used to test digital designs before making ASICs (custom chips).
* **Customization**: Perfect for specialized applications like image processing, AI, robotics, cryptography, and real-time control.

---

### **WHERE** is FPGA used?

* **Telecommunications** – baseband processing, 5G, SDR (Software-Defined Radio)
* **Aerospace & Defense** – radar, sonar, encryption
* **Automotive** – ADAS (Advanced Driver Assistance Systems), real-time control
* **Medical Devices** – imaging systems, portable diagnostics
* **Finance** – low-latency trading
* **Consumer Electronics** – video/image processing, gaming hardware
* **Data Centers** – acceleration of AI/ML workloads, custom processing pipelines
  

---

✅ FPGA Setup and Programming using Quartus (Lite, Standard, Pro)


---

🔧 1. Quartus Editions Overview

Edition	License Needed	Supported Devices	Notes

Lite	❌ No	Simple boards (e.g., MAX 10)	Free to use
Standard	✅ Yes	Simple + mid-range devices	Requires paid license
Pro	✅ Yes	High-end, complex devices	For large-scale, pro work


➡️ We’ll use Quartus Lite for MAX 10 FPGA in this tutorial.


---

🖥️ 2. Creating a New Project in Quartus

1. Launch Intel Quartus Prime Lite.


2. Go to File → New Project Wizard.


3. Click Next.



Fill These Important Fields:

Project Name: Choose a name (e.g., led_blink).

Project Directory: Choose folder location.

Top-Level Entity Name: Must match your Verilog module name (e.g., led_blink).

Click Next.


4. Select Empty Project, then click Next.


5. Skip file adding for now → click Next.




---

📦 3. Set Device Family

1. Choose:

Family: MAX 10

Name Filter: Type 10M50DAF484C7G



2. Select device and click Next.




---

⚙️ 4. EDA Tools Setup

Leave everything as default.

Click Next.


🧾 5. Finish Setup

Review the summary.

Click Finish.


> ✅ Pop-up: "Open Intel Quartus Prime projects only from trusted sources?"
Click Yes




---

📄 6. Create Verilog HDL File

1. Go to File → New → Verilog HDL File


2. Write your Verilog code inside.


3. Save it with the same name as your top-level entity.




---

📈 7. Run Analysis & Elaboration

1. Right-click your design file → Start Analysis & Elaboration


2. Summary will show → You may review or skip.




---

🔍 8. View RTL (Logic Diagram)

Go to Tools → Netlist Viewers → RTL Viewer

You’ll see a logic-level block diagram of your design.



---

📌 9. Assign Pins (Pin Planner)

1. Go to Assignments → Pin Planner


2. Reference your FPGA board’s datasheet to set:

Input/Output pins (e.g., LEDs, switches)

Voltage standards



3. Apply and close.




---

🔄 10. Run Analysis & Synthesis

Right-click or go to Processing → Start → Start Analysis & Synthesis



---

🔍 11. View Technology Map

Go to Tools → Netlist Viewers → Technology Map Viewer (post-mapping)

You’ll see:

Lookup tables

Truth tables

Click on boxes to open Properties and inspect logic



> Go to Table of Contents → Resource Usage Summary for logic utilization.




---

🔧 12. Run Fitter

Right-click project → Start Fitter

Or: Processing → Start → Start Fitter

Summary appears — review or skip.



---

💠 13. View on Chip (Chip Planner)

Go to Tools → Chip Planner

Zoom in to see how your logic is mapped physically on the FPGA.



---

📦 14. Assemble Bitstream

Right-click project → Start Assembler

Or: Processing → Start → Start Assembler

This generates the .sof file for programming the board.



---

🔌 15. Setup USB Blaster Driver (First Time Only)

1. Open Device Manager


2. Look for Other Devices → USB (unrecognized device)


3. Right-click → Update Driver


4. Browse to:
C:\intelFPGA_lite\...\drivers\usb-blaster (where Quartus is installed)


5. Install driver successfully.




---

🚀 16. Program FPGA

1. Go to Tools → Programmer


2. Hardware Setup → Select USB-Blaster


3. Add the .sof file (auto-detected)


4. Click Start to program your board


5. Verify the output (e.g., LED blinking)


---
