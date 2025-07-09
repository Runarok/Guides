function brainfuck(code, input = "") {
  const tape = new Array(30000).fill(0); // Memory tape with 30,000 cells
  const output = [];                     // Stores output characters
  let ptr = 0;                           // Memory pointer
  let ip = 0;                            // Instruction pointer
  let inp = 0;                           // Input character pointer
  const loopStack = [];                 // Stack to handle loop positions

  while (ip < code.length) {
    const cmd = code[ip];

    switch (cmd) {
      case '>': ptr++; break;                          // Move pointer right
      case '<': ptr--; break;                          // Move pointer left
      case '+': tape[ptr] = (tape[ptr] + 1) % 256; break; // Increment cell value
      case '-': tape[ptr] = (tape[ptr] + 255) % 256; break; // Decrement with wrap
      case '.': output.push(String.fromCharCode(tape[ptr])); break; // Output char
      case ',': tape[ptr] = input.charCodeAt(inp++) || 0; break;    // Input char

      case '[': // Start of loop
        if (tape[ptr] === 0) {
          // Skip to matching ] if cell is zero
          let open = 1;
          while (open) {
            ip++;
            if (code[ip] === '[') open++;
            if (code[ip] === ']') open--;
          }
        } else {
          loopStack.push(ip); // Store loop start
        }
        break;

      case ']': // End of loop
        if (tape[ptr] !== 0) {
          ip = loopStack[loopStack.length - 1]; // Jump back to matching [
        } else {
          loopStack.pop(); // Exit loop
        }
        break;
    }

    ip++; // Move to next instruction
  }
  return output.join(''); // Return final output string
}

// Example Usage — Uncomment to Run
// const helloWorld = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.";
// console.log(brainfuck(helloWorld)); // Output: Hello World!
