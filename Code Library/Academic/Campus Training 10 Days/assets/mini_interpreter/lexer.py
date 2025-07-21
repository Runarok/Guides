# lexer.py
# Tokenizes input strings into a list of tokens: numbers, variables, operators, parentheses, and assignment.

import string

def tokenize(line):
    """
    Tokenizes an input line into a list of tokens.
    Handles numbers, variable names, operators (+-*/), parentheses, and =.
    Ignores whitespace.
    """
    tokens = []
    i = 0
    while i < len(line):
        c = line[i]
        if c.isspace():
            # Skip whitespace
            i += 1
            continue
        elif c in "+-*/=()":
            # Single-character operator or parenthesis
            tokens.append(c)
            i += 1
        elif c.isdigit():
            # Number (integer)
            num = c
            i += 1
            while i < len(line) and line[i].isdigit():
                num += line[i]
                i += 1
            tokens.append(num)
        elif c in string.ascii_letters:
            # Variable name (letters, digits, or underscores)
            var = c
            i += 1
            while i < len(line) and (line[i] in string.ascii_letters or line[i].isdigit() or line[i] == "_"):
                var += line[i]
                i += 1
            tokens.append(var)
        else:
            raise ValueError(f"Invalid character in input: {c}")
    return tokens