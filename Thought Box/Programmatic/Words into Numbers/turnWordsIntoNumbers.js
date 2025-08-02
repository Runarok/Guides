function wordsToNumber(str) {
    // Define basic mappings for numbers 0–19
    const units = {
        "zero": 0, "one": 1, "two": 2, "three": 3, "four": 4,
        "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9,
        "ten": 10, "eleven": 11, "twelve": 12, "thirteen": 13,
        "fourteen": 14, "fifteen": 15, "sixteen": 16, "seventeen": 17,
        "eighteen": 18, "nineteen": 19
    };

    // Mappings for tens (20, 30, ..., 90)
    const tens = {
        "twenty": 20, "thirty": 30, "forty": 40,
        "fifty": 50, "sixty": 60, "seventy": 70,
        "eighty": 80, "ninety": 90
    };

    // Mappings for scale multipliers
    const scales = {
        "hundred": 100,
        "thousand": 1000,
        "million": 1_000_000,
        "billion": 1_000_000_000
    };

    // Normalize input: lowercase, replace hyphens with spaces, split into words
    let words = str.toLowerCase().replace(/-/g, " ").split(/\s+/);
    let total = 0;    // Final number result
    let current = 0;  // Temporary accumulator for each segment

    for (let word of words) {
        if (units[word] !== undefined) {
            // Add unit value (0–19)
            current += units[word];
        } else if (tens[word] !== undefined) {
            // Add tens value (20, 30, ..., 90)
            current += tens[word];
        } else if (word === "hundred") {
            // Multiply current value by 100
            current *= 100;
        } else if (scales[word]) {
            // Multiply current by scale (thousand, million, etc.), add to total
            current *= scales[word];
            total += current;
            current = 0; // Reset current segment
        }
    }

    // Add any remaining number in current
    return total + current;
}

// Example
// console.log(wordsToNumber("Five Hundred Thousand")); // Output: 500000
