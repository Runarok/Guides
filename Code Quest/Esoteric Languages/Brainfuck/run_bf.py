def run_bf(code, input_str=""):
    tape = [0] * 30000
    output = ""
    ptr = 0
    ip = 0
    inp = 0
    loop_stack = []

    while ip < len(code):
        cmd = code[ip]

        if cmd == '>':
            ptr += 1
        elif cmd == '<':
            ptr -= 1
        elif cmd == '+':
            tape[ptr] = (tape[ptr] + 1) % 256
        elif cmd == '-':
            tape[ptr] = (tape[ptr] - 1) % 256
        elif cmd == '.':
            output += chr(tape[ptr])
        elif cmd == ',':
            tape[ptr] = ord(input_str[inp]) if inp < len(input_str) else 0
            inp += 1
        elif cmd == '[':
            if tape[ptr] == 0:
                open_brackets = 1
                while open_brackets:
                    ip += 1
                    if code[ip] == '[':
                        open_brackets += 1
                    elif code[ip] == ']':
                        open_brackets -= 1
            else:
                loop_stack.append(ip)
        elif cmd == ']':
            if tape[ptr] != 0:
                ip = loop_stack[-1]
            else:
                loop_stack.pop()
        ip += 1

    return output


# if __name__ == "__main__":
#    hello_world = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
#    print(run_bf(hello_world))
