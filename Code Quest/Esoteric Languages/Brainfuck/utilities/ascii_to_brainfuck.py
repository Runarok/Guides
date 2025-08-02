for ascii_code in range(0, 256):
    if ascii_code == 10:
        symbol = "LF (newline)"
    elif ascii_code == 13:
        symbol = "CR (carriage return)"
    elif ascii_code == 32:
        symbol = "SPACE"
    elif ascii_code == 127:
        symbol = "DEL"
    else:
        char_repr = chr(ascii_code)
        symbol = char_repr if char_repr.isprintable() else f"ASCII {ascii_code}"

    brainfuck_code = "+" * ascii_code + "."
    print(f"// {symbol} ({ascii_code})")
    print(brainfuck_code)
    print()