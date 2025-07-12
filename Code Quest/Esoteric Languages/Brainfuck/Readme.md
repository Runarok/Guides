### 🧠 What is Brainfuck?

**Brainfuck** is an **esoteric programming language** created by Urban Müller in 1993. It’s designed to be:

* **Minimalistic** (only 8 commands)
* **Turing-complete**
* And intentionally **hard to read/write**, purely for challenge or fun

---

### 🔧 Syntax (Only 8 Commands):

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `>`    | Move pointer to the right                |
| `<`    | Move pointer to the left                 |
| `+`    | Increment the byte at the pointer        |
| `-`    | Decrement the byte at the pointer        |
| `.`    | Output the byte at the pointer (as char) |
| `,`    | Input one byte and store it at pointer   |
| `[`    | Jump forward if byte at pointer is zero  |
| `]`    | Jump back if byte at pointer is non-zero |

It works on an **array of memory cells**, each initially zero, with a **single data pointer**.

---

## 🐍 Python Version

Run Brainf\*ck code directly in your terminal.

🔗 [View `runBF.py`](./Interpreters/runBF.py)

---

## 🧠 JavaScript Version

Use in any browser or embed into your own tools.

🔗 [View `runBF.js`](./Interpreters/runBF.js)

### 🧪 Example: Hello World

```brainfuck
++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
```

That monstrosity prints:
**`Hello World!`**

---

 <!-- 
🔗 [Launch Live Interpreter](https://your-username.github.io/your-repo/) - Sooner 
 --> 

### Why use it?

* Purely for **challenge, fun, or artistic code**
* It’s used in **code golf**, obfuscation contests, or to troll friends 😈
* Forces deep understanding of memory manipulation
