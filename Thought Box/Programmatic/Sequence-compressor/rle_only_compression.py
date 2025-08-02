"""
rle_only_compression.py
Simple Run-Length Encoding (RLE) that compresses consecutive repeated characters.
"""

def compress_rle(s: str) -> str:
    result = []
    i = 0
    while i < len(s):
        count = 1
        while i + 1 < len(s) and s[i] == s[i + 1]:
            count += 1
            i += 1
        result.append(f"{count}{s[i]}")
        i += 1
    return ''.join(result)

def decompress_rle(encoded: str) -> str:
    import re
    # Pattern matches groups of digits followed by a single character
    pattern = re.compile(r'(\d+)(.)')
    result = []
    for count, char in pattern.findall(encoded):
        result.append(char * int(count))
    return ''.join(result)

if __name__ == "__main__":
    s = input("Enter a sequence to compress (RLE only): ")
    compressed = compress_rle(s)
    print("Compressed:", compressed)
    decompressed = decompress_rle(compressed)
    print("Decompressed:", decompressed)
