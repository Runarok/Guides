    // Global variables
    char t[28], cs[28], g[] = "1101";  // t[] = data, cs[] = checksum, g[] = generator polynomial (e.g., CRC-4)
    // You can change the generator polynomial g[] to other CRC values (e.g., g[] = "101101" for CRC-6)
    int a, e, c;

    #define N strlen(g)  // N is the length of the generator polynomial

    // Main function where the CRC encoding and error detection occurs
    int main() {
        // Prompt user to enter the data (message to encode)
        printf("Enter the Data: ");
        scanf("%s", t);  // Read the message into the variable t[]
        printf("\nThe Generator Polynomial is: %s\n", g);  // Show the generator polynomial g[]

        a = strlen(t);  // Get the length of the input message t[]

        // Append zeros to the original data to prepare it for CRC encoding (appending length of generator - 1 zeros)
        for (e = a; e < a + N - 1; e++) {
            t[e] = '0';  // Appending '0' for CRC processing
        }
        
        printf("\nThe modified data is: %s\n", t);  // Display the modified data after appending zeros
        
        crc();  // Perform CRC calculation
        printf("\nChecksum is: %s\n", cs);  // Display the calculated checksum

        // Append the checksum to the original message to create the final codeword
        for (e = a; e < a + N - 1; e++) {
            t[e] = cs[e - a];  // Add the checksum at the end of the original data
        }
        
        printf("\nThe Final Codeword is: %s\n", t);  // Display the final codeword after appending the checksum

        // Ask the user if they want to simulate error detection
        printf("\nTest Error Detection 0(YES) 1(NO)? :");
        scanf("%d", &e);  // Read whether the user wants to insert an error

        if (e == 0) {
            // If the user chooses to insert an error
            do {
                printf("\nEnter the position where Error is to be inserted: ");
                scanf("%d", &e);  // Get the error position from the user
            } while (e == 0 || e > a + N - 1);  // Ensure the error position is valid
            
            // Flip the bit at the error position (i.e., introduce an error)
            t[e - 1] = (t[e - 1] == '0') ? '1' : '0';  // Toggle the bit at the error position
            printf("\nErroneous Data: %s\n", t);  // Display the erroneous data
        }

        crc();  // Perform CRC again on the potentially erroneous data
        // Check if the checksum indicates any error (i.e., if the remainder is not zero)
        for (e = 0; (e < N - 1) && (cs[e] != '1'); e++);
        
        // If any non-zero remainder is found, an error is detected
        if (e < N - 1)
            printf("\nError Detected\n");  // Error detected
        else
            printf("\nNo Error Detected\n");  // No error detected

        return 0;  // End the program
    }

    // Function to calculate CRC for the given data and generator polynomial
    void crc() {
        // Initialize the checksum (cs) to be the same as the original data (t)
        for (e = 0; e < N; e++) {
            cs[e] = t[e];  // Copy the original data into the checksum array
        }

        // Perform the division process for CRC calculation
        do {
            if (cs[0] == '1')  // If the first bit of checksum is 1, we perform XOR with the generator polynomial
                xor();  // Perform XOR operation

            // Shift the checksum left by 1 bit (i.e., drop the first bit and move all remaining bits left)
            for (c = 0; c < N - 1; c++) {
                cs[c] = cs[c + 1];  // Move each bit left
            }

            // Add the next data bit to the checksum from the original message
            cs[c] = t[e++];  // Append the next bit of the original data to the checksum
        } while (e <= a + N - 1);  // Continue until the end of the original data + the appended zeros
    }

    // XOR function to perform the division step of CRC
    void xor() {
        // XOR operation between the checksum (cs) and the generator polynomial (g)
        for (c = 1; c < N; c++) {
            cs[c] = ((cs[c] == g[c]) ? '0' : '1');  // Perform XOR between corresponding bits
        }
    }
