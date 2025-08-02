"""
pattern_compression.py
Improved compression that detects repeated substrings and compresses them
into the shortest reversible format.
"""

import re

def compress_pattern(s: str) -> str:
    n = len(s)
    if n == 0:
        return ""
    
    # Base case: no compression possible
    best = s

    # Try all substring lengths from 1 to n//2
    for length in range(1, n // 2 + 1):
        compressed = ""
        i = 0
        while i < n:
            # Current substring candidate
            substr = s[i:i+length]

            # Count how many times substr repeats consecutively
            count = 1
            while i + count*length + length <= n and s[i + count*length:i + (count+1)*length] == substr:
                count += 1

            if count > 1:
                # Compress as count + [substr]
                compressed += f"{count}[{substr}]"
                i += count * length
            else:
                compressed += s[i]
                i += 1
        
        # Update best if shorter
        if len(compressed) < len(best):
            best = compressed

    return best

def decompress_pattern(s: str) -> str:
    pattern = re.compile(r'(\d+)\[([A-Z]+)\]')
    
    # Keep replacing until no more patterns left
    while True:
        match = pattern.search(s)
        if not match:
            break
        count, substr = match.groups()
        expanded = substr * int(count)
        s = s[:match.start()] + expanded + s[match.end():]
    return s

if __name__ == "__main__":
    s = input("Enter a sequence to compress (pattern-aware): ")
    compressed = compress_pattern(s)
    print("Compressed:", compressed)
    decompressed = decompress_pattern(compressed)
    print("Decompressed:", decompressed)
