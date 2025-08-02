# Academic & Interview Project Ideas: DSA with Python

---

## 1. Academic Project: Mini Language Interpreter

### 📘 Description

Build a mini interpreter that demonstrates core data structures:

- **Stack**: For postfix expression evaluation.
- **Queue**: For input processing or deferred execution.
- **HashMap**: To store variables and their values.
- **Binary Tree**: For parsed expression trees.

#### 📁 Folder Structure

```
mini_interpreter/
├── main.py
├── lexer.py
├── parser.py
├── evaluator.py
├── symbol_table.py
├── expression_tree.py
├── queue_executor.py
└── tests/
    └── test_cases.txt
```

#### 🧩 Components

**1. lexer.py**
- Tokenizes input strings into tokens (numbers, variables, operators).
- Example:  
  `"a = (5 + 3) * 2"` → `['a', '=', '(', '5', '+', '3', ')', '*', '2']`

**2. parser.py**
- Converts infix to postfix (Shunting Yard algorithm with Stack).
- Builds an expression tree (Binary Tree) from postfix.
- Exports:
    ```python
    def infix_to_postfix(tokens: List[str]) -> List[str]
    def build_expression_tree(postfix_tokens: List[str]) -> TreeNode
    ```

**3. expression_tree.py**
- `TreeNode` class for binary expression tree.
- Traversals: infix, prefix, postorder.

**4. symbol_table.py**
- Implements a HashMap for variable storage.
- API:
    - `set(name, value)`
    - `get(name)`

**5. evaluator.py**
- Evaluates postfix expressions using Stack.
- Supports variable lookup from symbol_table.

**6. queue_executor.py**
- Implements a Queue of assignment statements.
- Allows "deferring" code execution.
- API:
    - `enqueue_statement(line: str)`
    - `process_queue()`

**7. main.py**
- CLI or loop-based interpreter shell:
    ```
    > a = 5
    > b = a + 3 * (2 + 1)
    > print b
    ```

**8. tests/test_cases.txt**
```
a = 10
b = 5
c = a + b * (3 + 2)
print c
```

---

## 2. Real-World Interview Project: Job Application Tracker System

### 🏢 Description

**Simulate a system to track job applications using DSA:**

- **HashMap**: For company/job listings.
- **Queue**: For applications waiting to be processed.
- **Stack**: For undoing applied jobs.
- **Binary Tree**: To organize jobs by salary or relevance score.

#### 📁 Folder Structure

```
job_tracker/
├── main.py
├── job.py
├── job_manager.py
├── application_queue.py
├── undo_stack.py
├── job_tree.py
├── job_store.py
└── tests/
    └── test_jobs.py
```

#### 🧩 Components

**1. job.py**
- `Job` class with: id, title, company, salary, score, status.

**2. job_store.py (HashMap)**
- Stores jobs in a dictionary keyed by job_id.
- Methods: add_job, get_job, delete_job, list_all_jobs.

**3. application_queue.py (Queue)**
- Simulates user applying to jobs.
- Methods: enqueue(job_id), dequeue(), peek().

**4. undo_stack.py (Stack)**
- Records last applied job.
- Allows undo (pop) last application.

**5. job_tree.py (Binary Tree)**
- Organizes jobs by score or salary.
- In-order traversal yields jobs sorted by score.
- API: insert_job(job), in_order().

**6. job_manager.py**
- Combines job_store, application_queue, undo_stack, and job_tree.
- Manages job creation, application, undo last action, listing jobs by score.

**7. main.py**
- Menu interface:
    ```
    1. Add Job
    2. Apply to Job
    3. Undo Last Application
    4. List Jobs by Score
    5. Exit
    ```

##### 📌 Sample Flow

```python
JobManager.add_job(Job(id="101", title="SWE", company="Google", salary=50, score=90))
JobManager.add_job(Job(id="102", title="DevOps", company="AWS", salary=55, score=85))

JobManager.enqueue_application("101")
JobManager.process_next_application()

JobManager.undo_last_application()

JobManager.print_sorted_jobs_by_score()
```

---

## ✅ Summary Table

| Feature      | Academic: Interpreter       | Interview: Job Tracker         |
|--------------|----------------------------|-------------------------------|
| Stack        | Postfix Eval               | Undo Applied Jobs             |
| Queue        | Execution Queue            | Applications Queue            |
| HashMap      | Symbol Table               | Job Store (Job ID ↔ Job Data) |
| Binary Tree  | Expression Tree            | Jobs sorted by score/salary   |
| Modular      | Lexer, Parser, Evaluator   | Manager, JobStore, Tree, Stack|
| Real-World   | Mini Language Simulation   | Job Portal/ATS System         |

---