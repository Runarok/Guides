# 1. Information Processing (Core Concept)

### Definition

* **Data** → raw facts
* **Information** → processed data presented meaningfully

### Conceptual analogy

* **Cake baking**

  * Ingredients = data
  * Recipe = program
  * Baker = CPU
  * Cake = information

---

# 2. Information Processing Cycle

## 2.1 Data Collection

* First step of processing
* Data sources:

  * Environment (via sensors)
  * Input devices (keyboard, mouse, touch, camera)
  * Files & databases
  * Previously processed data
  * Computer-generated data

### Key idea

* Data must be in a **usable format**
* Raw data is **converted to machine-readable form**

---

## 2.2 Data Processing

* Done by **software programs**
* Executed by **CPU**
* Programs = instructions that define:

  * What data to use
  * Order of operations
  * Duration & conditions

### Performance depends on:

* Processor speed
* Bus size
* Cache size
* Architecture

---

## 2.3 Storage

### Temporary Storage (Memory)

* **RAM (Random Access Memory)**
* Volatile → cleared when power is off
* Stores currently used data & programs

### Permanent Storage

* Drives (HDD, SSD)
* Flash storage
* Phone storage
* Retains data after shutdown

### Storage formats

* Files
* Databases

---

## 2.4 Output (Information Presentation)

### Output forms

* Visual (screens, print)
* Audio (sound, music)
* Physical actions (robots, machines)

---

# 3. Operating System (OS)

## 3.1 Definition

An **Operating System** is a collection of procedures that:

* Allows **multiple users** to share computing resources
* Manages **hardware & software coordination**

---

## 3.2 Core Role of OS

* Acts as **middle layer** between:

  * Hardware
  * Applications
  * Users

---

# 4. Boot Process (System Startup)

### Key terms

* **Boot** = starting the system
* Origin: “pulling oneself up by bootstraps”

### Boot sequence

1. Power ON
2. **BIOS** (Basic Input Output System)

   * Initializes hardware
   * Performs checks
3. **Boot Loader**

   * Locates OS
   * Loads kernel into RAM
4. **Kernel takes control**
5. Drivers, services, applications loaded
6. Runtime state reached (system usable)

### Rebooting

* **Hard reboot**: power cut
* **Soft reboot**: RAM cleared, power maintained

---

# 5. Kernel (Heart of the OS)

## Definition

* Core component of OS
* Always resident in memory
* Full control over system resources

### Responsibilities

* Memory control
* Process scheduling
* Device communication
* Security enforcement

---

# 6. OS Functional Responsibilities

1. **Memory Management**
2. **Processor Scheduling**
3. **Device Management** (via drivers)
4. **File Management**
5. **Security & Permissions**
6. **Resource Allocation**
7. **Error Handling**
8. **Application Platform**

---

# 7. OS Architecture Layers

1. Hardware
2. Kernel
3. Shell (interface)
4. Utilities & Applications

---

# 8. Kernel Types

## 8.1 Monolithic Kernel

* Kernel & services in same space
* Fast execution
* Larger OS
* Example: **Linux**

## 8.2 Microkernel

* Minimal kernel
* Services run in user space
* Modular, secure
* Message-based communication

## 8.3 Hybrid Kernel

* Combines monolithic speed + microkernel modularity
* Example: **Microsoft Windows**

## 8.4 Nanokernel

* Extremely small
* Hardware abstraction only

## 8.5 Exokernel

* Minimal abstractions
* Application-specific customization

---

# 9. Kernel Space vs User Space

* **Kernel Space**

  * Privileged
  * Direct hardware access
* **User Space**

  * Applications
  * Isolated for safety

Purpose: prevent total system failure if an app crashes.

---

# 10. Device Drivers

### What they are

* Software layer between hardware & OS
* Abstract hardware as files

### Why they exist

* Prevent each app from managing hardware itself
* Improve efficiency & compatibility

### Example

* Brightness change:

  * OS writes value → driver
  * Driver translates to hardware signal

---

# 11. Operating System Categories

### Three major families

1. Unix-like systems
2. Linux
3. Windows

---

# 12. Unix-Like Systems

## Types

1. **Genetic Unix** – original codebase
2. **Branded Unix** – commercial variants
3. **Functional Unix** – Unix-like behavior

---

# 13. macOS

* Unix-derived (BSD roots)
* Developed by **Apple Inc.**
* Written in:

  * C
  * C++
  * Objective-C
  * Swift
* Known for:

  * Stability
  * Security
  * Performance

---

# 14. Free Software Movement

## Key Figure

* **Richard Stallman**

### Contributions

* GNU Project (1983)
* Free Software Foundation (1985)
* GNU General Public License (GPL)

---

# 15. Linux

### Characteristics

* Open source
* Kernel + distributions
* Highly customizable

### Distributions

* Desktop: Linux Mint, Ubuntu
* Lightweight: Puppy Linux
* Enterprise: Red Hat, SUSE

### Desktop environments

* GNOME
* KDE
* XFCE
* MATE

### Usage

* ~96% of servers
* Supercomputers
* Embedded systems
* IoT devices

---

# 16. Android

* Based on Linux kernel
* Developed by **Google**
* Uses:

  * Linux Kernel
  * Android Runtime (ART)
* Runs apps inside a **virtual machine**
* Requires more RAM due to abstraction layers

### Market impact

* ~2 billion users
* ~85% smartphone market share
* Used in phones, cars, TVs, consoles, cameras

---

# 17. Virtual Machines

### Definition

* OS running on top of another OS

### Terms

* Host OS → hardware access
* Guest OS → virtualized environment

### Trade-off

* Compatibility ↑
* Performance ↓

---

# 18. Windows

* Proprietary OS by **Microsoft**
* Written in:

  * C (kernel)
  * C++
  * C#
* Market share:

  * ~77% desktop OS
* Closed source
* Apps typically released here first

---

# 19. APIs (Application Programming Interfaces)

### Purpose

* Allow developers to access OS functionality
* Avoid rewriting low-level code

### Importance

* Critical in proprietary OS
* Central to Android development

---

# 20. Why This Matters to Programmers

* OS = code written by programmers
* Understanding OS internals helps:

  * Choose correct platform
  * Avoid unsupported designs
  * Write efficient code
  * Prevent wasted time & cost

---

# 21. Final Core Takeaway

* Information processing = **input → process → store → output**
* OS is the **most important software**
* Kernel is the **brain**
* Drivers are the **translators**
* APIs are the **bridges**
* Knowing OS internals = **better engineering decisions**

---
