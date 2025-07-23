## **1\. Academic Project: Mini Language Interpreter**

### **📘 Description:**

Build a mini interpreter that:

* Parses simple expressions and assignments.

* Uses:

  * **Stack** for expression evaluation (postfix),

  * **Queue** for input processing or deferred execution,

  * **HashMap** to store variables and their values,

  * **Binary Tree** to represent and print parsed expression trees.

📁 Folder: `mini_interpreter/`

| mini\_interpreter/├── main.py├── lexer.py├── parser.py├── evaluator.py├── symbol\_table.py├── expression\_tree.py├── queue\_executor.py└── tests/    └── test\_cases.txt |
| :---- |

### **`🧩 Components:`**

#### **`1. lexer.py`**

* `Tokenizes input strings into tokens (numbers, variables, operators).`

* `Example: "a = (5 + 3) * 2" → ['a', '=', '(', '5', '+', '3', ')', '*', '2']`

#### **`2. parser.py`**

* `Converts infix to postfix (Shunting Yard algorithm using Stack).`

* `Builds an expression tree (Binary Tree) from postfix.`

* `Exports:`

| def infix\_to\_postfix(tokens: List\[str\]) \-\> List\[str\]def build\_expression\_tree(postfix\_tokens: List\[str\]) \-\> TreeNode |
| :---- |

#### **`3. expression_tree.py`**

* `TreeNode class for binary expression tree.`

* `Traversals (infix, prefix, postorder) to verify correctness.`

#### **`4. symbol_table.py`**

* `Implements a HashMap for variable storage.`

* `SymbolTable.set(name, value) and SymbolTable.get(name)`

#### **`5. evaluator.py`**

* `Evaluates postfix expressions using Stack.`

* `Supports variable lookup from symbol_table.`

#### **`6. queue_executor.py`**

* `Implements a Queue of assignment statements.`

* `Allows "deferring" code execution (used to simulate real interpreter behavior).`

* `Functions:`

| enqueue\_statement(line: str)process\_queue() |
| :---- |

#### **`7. main.py`**

* `CLI or loop-based interpreter shell:`

`> a = 5`  
`> b = a + 3 * (2 + 1)`  
`> print b`

`8. tests/test_cases.txt`

`a = 10`  
`b = 5`  
`c = a + b * (3 + 2)`  
`print c`

`✅ 2. Real-World Interview Project: Job Application Tracker System`

### **`🏢 Description:`**

**`Simulate a system to track job applications:`**

* **`HashMap for company/job listings.`**

* **`Queue for applications waiting to be processed.`**

* **`Stack for undoing applied jobs.`**

* **`Binary Tree to organize jobs by salary or relevance score.`**

`📁 Folder: job_tracker/`

`job_tracker/`  
`├── main.py`  
`├── job.py`  
`├── job_manager.py`  
`├── application_queue.py`  
`├── undo_stack.py`  
`├── job_tree.py`  
`├── job_store.py`  
`└── tests/`  
    `└── test_jobs.py`

### **`🧩 Components:`**

#### **`1. job.py`**

* `Job class with attributes: id, title, company, salary, score, status.`

#### **`2. job_store.py (HashMap)`**

* `Stores jobs in a dictionary with job_id as key.`

* `add_job, get_job, delete_job, list_all_jobs.`

#### **`3. application_queue.py (Queue)`**

* `Simulates user applying to jobs.`

* `Methods:`

  * `enqueue(job_id)`

  * `dequeue() (apply job)`

  * `peek()`

#### **`4. undo_stack.py (Stack)`**

* `Records last applied job.`

* `Allows undo (pop) last application.`

#### **`5. job_tree.py (Binary Tree)`**

* `Organizes jobs by score or salary.`

* `In-order traversal returns jobs sorted by score.`

* `Functions:`

  * `insert_job(job)`

  * `in_order()`

#### **`6. job_manager.py`**

* `Combines job_store, application_queue, undo_stack, and job_tree.`

* `Manages:`

  * `Job creation`

  * `Application process`

  * `Undo last action`

  * `Listing jobs by score`

#### **`7. main.py`**

* `Menu interface:`

`1. Add Job`  
`2. Apply to Job`  
`3. Undo Last Application`  
`4. List Jobs by Score`  
`5. Exit`

`📌 Sample Flow`

| JobManager.add\_job(Job(id="101", title="SWE", company="Google", salary=50, score=90))JobManager.add\_job(Job(id="102", title="DevOps", company="AWS", salary=55, score=85))JobManager.enqueue\_application("101")JobManager.process\_next\_application()JobManager.undo\_last\_application()JobManager.print\_sorted\_jobs\_by\_score() |
| :---- |

## **`✅ Summary`**

| `Feature` | `Academic: Interpreter` | `Interview: Job Tracker` |
| ----- | ----- | ----- |
| `Stack` | `Postfix Eval` | `Undo Applied Jobs` |
| `Queue` | `Execution Queue` | `Applications Queue` |
| `HashMap` | `Symbol Table` | `Job Store (Job ID ↔ Job Data)` |
| `Binary Tree` | `Expression Tree` | `Jobs sorted by score/salary` |
| `Modular` | `Lexer, Parser, Evaluator` | `Manager, Job Store, Tree, Stack` |
| `Real-World Simulation` | `Basic Programming Language` | `Job Portal / ATS System Simulation` |

