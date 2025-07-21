# lexer.py - Tokenizes input strings into tokens

import string

def tokenize(line):
    tokens = []
    i = 0
    while i < len(line):
        c = line[i]
        if c.isspace():
            i += 1
            continue
        elif c in "+-*/=()":
            tokens.append(c)
            i += 1
        elif c.isdigit():
            num = c
            i += 1
            while i < len(line) and line[i].isdigit():
                num += line[i]
                i += 1
            tokens.append(num)
        elif c in string.ascii_letters:
            var = c
            i += 1
            while i < len(line) and (line[i] in string.ascii_letters or line[i].isdigit() or line[i] == "_"):
                var += line[i]
                i += 1
            tokens.append(var)
        else:
            raise ValueError(f"Invalid character: {c}")
    return tokens