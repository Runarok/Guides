def brainfuck(code, input_str=""):
    tape = [0] * 30000  # Memory tape with 30,000 cells
    output = ""         # Output string
    ptr = 0             # Memory pointer
    ip = 0              # Instruction pointer
    inp = 0             # Input pointer
    loop_stack = []     # Stack for loop tracking

    while ip < len(code):
        cmd = code[ip]

        if cmd == '>':
            ptr += 1  # Move pointer to the right
        elif cmd == '<':
            ptr -= 1  # Move pointer to the left
        elif cmd == '+':
            tape[ptr] = (tape[ptr] + 1) % 256  # Increment value at cell
        elif cmd == '-':
            tape[ptr] = (tape[ptr] - 1) % 256  # Decrement value at cell
        elif cmd == '.':
            output += chr(tape[ptr])  # Output ASCII character
        elif cmd == ',':
            # Read one character from input
            tape[ptr] = ord(input_str[inp]) if inp < len(input_str) else 0
            inp += 1

        elif cmd == '[':
            if tape[ptr] == 0:
                # Jump to the instruction after the matching ']'
                open_brackets = 1
                while open_brackets:
                    ip += 1
                    if code[ip] == '[':
                        open_brackets += 1
                    elif code[ip] == ']':
                        open_brackets -= 1
            else:
                loop_stack.append(ip)  # Save loop start index

        elif cmd == ']':
            if tape[ptr] != 0:
                ip = loop_stack[-1]  # Jump back to matching '['
            else:
                loop_stack.pop()     # Exit loop

        ip += 1  # Move to next command

    return output  # Return output string


"""
# Example Usage

if __name__ == "__main__":
    Code = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
    print(brainfuck(Code))

# NOTE:
# This block is commented out to prevent auto-execution when importing this file as a module.
# Remove the triple quotes to run directly.
# If you want to use the `brainfuck` function from another script, simply:
#     from runBF import brainfuck
"""

