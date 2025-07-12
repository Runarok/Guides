function brainfuck(code, input = "") {
  // Initialize a tape of 30,000 cells filled with 0 (standard in Brainfuck)
  const tape = new Array(30000).fill(0);

  const output = [];  // To collect output characters
  let ptr = 0;        // Tape pointer (data pointer)
  let ip = 0;         // Instruction pointer (points to the current command)
  let inp = 0;        // Input pointer (tracks current character from `input`)
  const loopStack = [];  // Stack to track positions of loop starts (`[`)

  // Remove any characters from the code that aren't valid Brainfuck commands
  const validCode = [...code].filter(c => "+-<>[],.".includes(c)).join("");

  // Main interpreter loop: iterate over the Brainfuck code
  while (ip < validCode.length) {
    const cmd = validCode[ip];  // Current command

    switch (cmd) {
      case '>':
        ptr++;  // Move the data pointer to the right
        break;

      case '<':
        ptr--;  // Move the data pointer to the left
        break;

      case '+':
        // Increment the byte at the data pointer (wrap around at 255 -> 0)
        tape[ptr] = (tape[ptr] + 1) % 256;
        break;

      case '-':
        // Decrement the byte at the data pointer (wrap around at 0 -> 255)
        tape[ptr] = (tape[ptr] + 255) % 256;
        break;

      case '.':
        // Output the ASCII character at the data pointer
        output.push(String.fromCharCode(tape[ptr]));
        break;

      case ',':
        // Read one character from the input string, defaulting to 0 if input is exhausted
        tape[ptr] = input.charCodeAt(inp++) || 0;
        break;

      case '[':
        if (tape[ptr] === 0) {
          // If current cell is zero, skip forward to the command after the matching ']'
          let open = 1;
          while (open) {
            ip++;
            if (validCode[ip] === '[') open++;
            if (validCode[ip] === ']') open--;
          }
        } else {
          // Otherwise, start of a loop: push the position onto the stack
          loopStack.push(ip);
        }
        break;

      case ']':
        if (tape[ptr] !== 0) {
          // If current cell is non-zero, jump back to the matching '['
          ip = loopStack[loopStack.length - 1];
        } else {
          // Otherwise, end of loop: pop from the stack
          loopStack.pop();
        }
        break;
    }

    ip++;  // Move to the next instruction
  }

  // Join and return the output characters as a single string
  return output.join('');
}


/*
  // Example Usage — Uncomment to run

  const helloWorld = `++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.`;
  console.log(brainfuck(helloWorld)); // Output: Hello World!
  
  // NOTE:
  // This block is commented out to prevent auto-execution when importing or including this script.
  // Remove the comment block to run directly.
  // You can also import the `brainfuck` function in other JavaScript files as needed.
*/
