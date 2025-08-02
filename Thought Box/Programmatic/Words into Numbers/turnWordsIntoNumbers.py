def words_to_number(s):
    # Define basic mappings for units (0–19)
    units = {
        "zero": 0, "one": 1, "two": 2, "three": 3, "four": 4,
        "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9,
        "ten": 10, "eleven": 11, "twelve": 12, "thirteen": 13,
        "fourteen": 14, "fifteen": 15, "sixteen": 16, "seventeen": 17,
        "eighteen": 18, "nineteen": 19
    }

    # Mappings for tens (20, 30, ..., 90)
    tens = {
        "twenty": 20, "thirty": 30, "forty": 40,
        "fifty": 50, "sixty": 60, "seventy": 70,
        "eighty": 80, "ninety": 90
    }

    # Mappings for large scale multipliers
    scales = {
        "hundred": 100,
        "thousand": 1_000,
        "million": 1_000_000,
        "billion": 1_000_000_000
    }

    # Normalize input: lowercase, replace hyphens, split into words
    words = s.lower().replace("-", " ").split()
    total = 0       # Final result
    current = 0     # Temporary accumulator for current number chunk

    for word in words:
        if word in units:
            current += units[word]  # Add unit value
        elif word in tens:
            current += tens[word]   # Add tens value
        elif word == "hundred":
            current *= 100          # Multiply current by 100
        elif word in scales:
            current *= scales[word] # Multiply current by scale (e.g., thousand, million)
            total += current        # Add to total
            current = 0             # Reset current chunk

    return total + current          # Add any remaining value to total

# Example
# print(words_to_number("Three hundred million"))  # Output: 300000000
