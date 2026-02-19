## 1. What a File Is

1. A **file** is the basic unit of data storage in a computer.
2. Everything in a computer system (programs, OS, user data) is stored as files.
3. A file is a **container of binary data (0s and 1s)** formatted so the computer knows:

   * where data starts
   * where data ends
4. The **operating system manages files**.

---

## 2. Why Files Are Necessary

1. Binary data by itself is meaningless without structure.
2. Files separate and organize binary sequences.
3. Files allow:

   * identification of data
   * reuse
   * storage beyond RAM

---

## 3. Storage and File Paths

1. Files are stored on:

   * Internal storage (hard drive / SSD)
   * Removable storage (USB, external drives)
2. Files are accessed using a **file path**.
3. A file path is a string that locates a file in a **directory structure**.

---

## 4. File Directories and Structure

1. All files are organized in a **file directory system**.
2. Directories are structured as a **tree**:

   * Root at the top
   * Subdirectories and files below
3. A file path represents traversal through this tree.

---

## 5. History of Files

1. Term “file” used in computing since the **1940s**.
2. Initially referred to **punched cards**.
3. Later evolved to represent **binary data stored on disks**.
4. Modern meaning: arbitrary binary data stored on storage media.

---

## 6. Operating Systems and Files

1. An operating system itself is a **collection of files**.
2. Types of OS files:

   * Executables (kernel, drivers, applications)
   * Non-executables (configs, documents, images)
3. Files are organized by a **file system**.

---

## 7. File Systems

1. A file system defines:

   * How files are stored
   * How files are retrieved
   * Permissions on files
2. Without a file system, data access would be chaotic.
3. Permissions restrict access to files (read/write/execute).

---

## 8. Key Benefits of Using Files

1. **Reusability** – data can be reused later.
2. **Large Storage Capacity** – storage > RAM.
3. **Time Saving** – avoids repeated manual input.
4. **Portability** – files can be transferred across systems.

---

## 9. Why Programs Need Files

1. Data in memory is lost when the program exits.
2. Files provide **persistent storage**.
3. Real-world programs handle large datasets.
4. Files reduce:

   * user effort
   * human error

---

## 10. File Usage in C Programming

1. C allows:

   * Reading from files
   * Writing to files
2. Enables:

   * Configuration storage
   * Data processing and persistence
3. Most software bundles:

   * Executables
   * Configuration files

---

## 11. Configuration Files

1. Store settings such as:

   * display resolution
   * refresh rate
   * hardware properties
2. Usually stored as **text files**.
3. Loaded automatically when programs start.

---

## 12. File Systems Across Operating Systems

### 12.1 Windows File System

1. Uses **drive letters** (C:, D:)
2. Uses **backslashes (\)** in paths.
3. File path format:

   ```
   C:\folder\subfolder\file.ext
   ```

---

### 12.2 Linux File System

1. No drive letters.
2. All storage unified under **single root (/)**.
3. Devices listed under `/dev`.
4. Uses **forward slashes (/)**.
5. File path format:

   ```
   /folder/subfolder/file.ext
   ```

---

## 13. File Extensions and Encoding

1. File extension indicates format.
2. Text files commonly use:

   * ASCII
   * ANSI
   * Unicode
3. Encoding defines how text maps to binary.

---

## 14. Types of Files in C

### 14.1 Text Files

1. Human-readable.
2. Can be opened by text editors.
3. Advantages:

   * Easy to edit
   * Highly portable
4. Disadvantages:

   * Low security
   * Larger size
   * No compression

---

### 14.2 Binary Files

1. Not human-readable.
2. Stored as raw binary.
3. Advantages:

   * Faster read/write
   * Random access
   * Compact storage
   * Higher security
4. Used for large structured data.

---

## 15. Binary Files and File Pointers

1. Binary files behave like arrays on disk.
2. Support **random access**.
3. C uses a **file pointer**:

   * Points to byte location in file
4. Operations move the pointer automatically.
5. `fseek()` moves pointer manually.

---

## 16. File Operations in C

Five fundamental operations:

1. Create a file
2. Open a file
3. Read from a file
4. Write to a file
5. Close a file

---

## 17. File Pointer in C

1. Files are treated as data structures.
2. A pointer of type `FILE *` is required.
3. Used to communicate between program and file.

---

## 18. Common File Handling Functions in C

### 18.1 File Control

1. `fopen()` – open/create file
2. `fclose()` – close file

---

### 18.2 Writing Functions

1. `fputc()` – write character
2. `fputs()` – write string
3. `fprintf()` – formatted write

---

### 18.3 Reading Functions

1. `fgetc()` – read character
2. `fgets()` – read string
3. `fscanf()` – formatted read
4. `fgetws()` – wide string input

---

### 18.4 File Positioning

1. `fseek()` – move pointer
2. `ftell()` – current position
3. `rewind()` – move to start

---

## 19. File Opening Modes

1. Mode determines file behavior.
2. Example:

   * Read mode cannot create a file.
3. If file does not exist:

   * Some modes create it automatically.

---

## 20. Importance of Closing Files

1. Frees system resources.
2. Prevents accidental data corruption.
3. Systems limit number of open files.

---

## 21. Command Line Arguments in C

### 21.1 Purpose

1. Allow programs to behave differently at runtime.
2. Reduce hardcoded logic.

---

### 21.2 Components

1. `argc` – argument count
2. `argv` – argument vector (array of strings)

---

### 21.3 Usage

1. Arguments passed after program name.
2. Typically processed using loops.
3. Used to configure program behavior dynamically.

---

## 22. Demo Program Overview (File Encryption)

1. Program:

   * Creates a file
   * Writes user input
   * Encrypts file
   * Allows decryption
2. Uses:

   * File I/O
   * Menu-driven logic
   * Switch-case
   * Character arithmetic

---

## 23. Encryption Logic Used

1. Encryption:

   * Adds `100` to each character.
2. Decryption:

   * Subtracts `100`.
3. Demonstrates:

   * File reading
   * File writing
   * Pointer movement

---

## 24. Limitations of the Demo Program

1. Cannot detect encrypted vs decrypted state.
2. Double decryption corrupts data.
3. No state persistence.
4. Limited navigation in menu.

---

## 25. Suggested Improvements

1. Use a **flag stored in file** to track encryption state.
2. Improve menu navigation.
3. Better error handling.
4. Make program more portable.

---

## 26. Final Revision Points

1. Files store persistent binary data.
2. OS manages files via file systems.
3. Directories form a tree structure.
4. C supports text and binary files.
5. Binary files offer speed and random access.
6. File pointers control file navigation.
7. Always close files.
8. Command line arguments enable flexible programs.

---
