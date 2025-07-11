# 🔁 Sequence Compression — Pattern-Based Reversible Format

> Inspired by [this YouTube Short](https://youtube.com/shorts/F8aSFGoUuMg)

---

## 📌 Problem Statement

Given a string consisting of uppercase letters, the goal is to compress the string into the shortest possible representation by identifying repeated characters and repeated patterns (substrings).

The compressed form should be:

* **Fully reversible**: You must be able to reconstruct the original string exactly from the compressed output.
* **Unambiguous**: There should be no confusion about how many times a pattern repeats or where patterns begin and end.
* **As concise as possible**: The compressed string should be shorter than or equal in length to the original string, using any notation or approach that meets the above criteria.

A key challenge is handling strings like `AB23`, which could be interpreted as either:

* `"AB2"` repeated 3 times, or
* `"AB"` repeated 23 times.

Your compression and decompression logic must ensure there is **no ambiguity** in such cases.

---

### ✅ Examples of What Compression Should Capture

| Input        | Example Compressed Representation | What it Represents                 |
| ------------ | --------------------------------- | ---------------------------------- |
| `AAAAA`      | `5[A]`                            | Five consecutive `A`s              |
| `ABCABCABC`  | `3[ABC]`                          | Three consecutive `ABC` patterns   |
| `ABCABCABAB` | `2[ABC]2[AB]`                     | Combination of repeated substrings |

---

## 🛠️ Solving Process

**Below is an example solution.**
Try solving it on your own first! Challenge yourself to implement your own compressor based on the problem statement before checking my solution.

---

### Old solution: simple Run-Length Encoding (RLE) — compresses repeated characters only

I started with a basic RLE approach that compresses repeated **single characters** only.

*Example:*
`AAAABB` becomes `4A2B`.

While this worked fine for repeated characters, it failed to compress repeated **patterns** like:

* `ABCABCABC` compressed as `1A1B1C1A1B1C1A1B1C`, which is inefficient.

You can find this implementation in [`rle_only_compression.py`](./rle_only_compression.py).

---

### New solution: pattern-aware compression — compresses repeated substrings

To improve, here’s a new method that:

* Checks all possible substring lengths for repeated consecutive occurrences.
* Compresses these repeated substrings using a notation like `3[ABC]` to indicate repetition counts.
* Picks the shortest compressed output among all possible compressions.

This approach ensures unambiguous, fully reversible compression that handles both repeated characters and repeated substrings efficiently.

Decompression uses pattern matching and expansion to restore the original string exactly.

*Note:* Since this approach checks all substring lengths, it can be computationally intensive for very long strings, but it guarantees the shortest lossless compression.

See the full implementation in [`pattern_compression.py`](./pattern_compression.py).

---
