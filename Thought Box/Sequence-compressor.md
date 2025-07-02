# 🔁 Sequence Compression — Shortest Reversible Format

> Inspired by [this YouTube Short](https://youtube.com/shorts/F8aSFGoUuMg)

---

## 📌 Problem

Given a string, compress consecutive repeated characters into the shortest possible format — using `[count][character]` pairs — such that the output is fully reversible.

---

## ⚙️ How It Works

The string is scanned left to right. When a character repeats, it is replaced with the number of repetitions followed by the character. This continues until the full string is converted.

---

## 💻 JavaScript (Node.js)

```js
const readline = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

function compressShort(str) {
  let result = '';
  let i = 0;
  while (i < str.length) {
    let count = 1;
    while (i + 1 < str.length && str[i] === str[i + 1]) {
      count++;
      i++;
    }
    result += count + str[i];
    i++;
  }
  return result;
}

function decompressShort(encoded) {
  let result = '', num = '';
  for (let i = 0; i < encoded.length; i++) {
    if (/\d/.test(encoded[i])) {
      num += encoded[i];
    } else {
      result += encoded[i].repeat(parseInt(num));
      num = '';
    }
  }
  return result;
}

readline.question("Enter a sequence to compress: ", (input) => {
  const compressed = compressShort(input);
  console.log("Compressed:", compressed);
  console.log("Decompressed:", decompressShort(compressed));
  readline.close();
});
````

---

## 🐍 Python

```python
def compress_short(s):
    result = ''
    i = 0
    while i < len(s):
        count = 1
        while i + 1 < len(s) and s[i] == s[i + 1]:
            count += 1
            i += 1
        result += f"{count}{s[i]}"
        i += 1
    return result

def decompress_short(encoded):
    import re
    parts = re.findall(r'(\d+)(.)', encoded)
    return ''.join(char * int(count) for count, char in parts)

if __name__ == "__main__":
    s = input("Enter a sequence to compress: ")
    compressed = compress_short(s)
    print("Compressed:", compressed)
    print("Decompressed:", decompress_short(compressed))
```
