# 🧠 Quiz Engine

A modular, object-oriented quiz engine designed for flexibility, extensibility, and real-time exam flow simulation. The system enables the creation, execution, and evaluation of quizzes with intelligent scoring and adaptive learning logic.

---

## 🔧 System Overview

This platform is built as a highly customizable and extensible quiz engine with the following key components:

* **📄 `Question`**: Core unit encapsulating various question types, options, and validation logic.
* **🧩 `Quiz`**: Manages a collection of questions, quiz-level rules, visibility, and scoring.
* **🧠 `QuizResult`**: Tracks user responses, time, and scoring; implements basic cheating detection.
* **🔗 `QuestionLinkedList`**: Custom doubly linked list for efficient reordering and shuffling of questions.
* **🗃️ `UserScoreHashMap`**: Custom-built hashmap to store and analyze user scores across quizzes.
* **🚦 `ExamFlowQueue`**: Simulates real-time exam handling with queuing, session management, and cleanup.
* **🧮 Scoring Algorithms**: Multiple scoring strategies including weighted, negative, and adaptive scoring.
* **🎯 Quiz Generators**: Random and adaptive quiz generation based on user performance analytics.

---

## 🧭 Learning Path

The system is structured to support modular development and comprehension. Components are introduced incrementally for clarity and maintainability.

---

### ✅ Step 1: `Question` Class

The `Question` class serves as the core data structure for all quiz content. It supports:

* Multiple Choice, True/False, and Short Answer formats
* Difficulty-based metadata
* Intelligent answer checking and scoring multipliers

#### Core Fields

```python
self.question_id: str
self.text: str
self.question_type: str  # 'multiple_choice', 'true_false', 'short_answer'
self.difficulty_level: int  # Scale: 1 (easy) to 5 (hard)
self.options: list  # For multiple-choice questions
self.correct_answer: Union[int, str]
self.explanation: str
self.points: float
self.category: str
self.tags: list[str]
self.created_at: datetime
self.usage_count: int
self.success_rate: float
```

#### Key Methods

* `add_option(text, is_correct)`
* `check_answer(user_answer)`
* `check_short_answer(user_text)`
* `calculate_similarity(text1, text2)`
* `update_statistics(correct: bool)`
* `get_difficulty_multiplier()`

---

### ✅ Step 2: `Quiz` Class

Manages a collection of questions via a custom linked list and provides quiz-level logic.

```python
self.questions: QuestionLinkedList
self.total_points: float
self.shuffle_questions: bool
self.shuffle_options: bool
...
```

#### Key Methods

* `add_question(question)`
* `remove_question(question_id)`
* `get_questions(shuffle: bool = False)`
* `calculate_score(user_answers)`
* `generate_certificate_data()`
* `publish() / unpublish()`

---

### ✅ Step 3: `QuestionLinkedList`

A custom doubly linked list for managing the order of questions efficiently.

#### Methods

* `append(question)`
* `prepend(question)`
* `insert_at_position(index, question)`
* `remove_by_id(question_id)`
* `move_question(from_idx, to_idx)`
* `shuffle()`

---

### ✅ Step 4: `QuizResult`

Tracks a single user’s interaction with a quiz attempt. Provides analytics and anomaly detection.

#### Tracks

* Answers per question
* Time taken
* Cheating indicators:

  * Rapid answer submission
  * Unusual similarity patterns
  * Repeated incorrect submissions

#### Methods

* `record_answer(question_id, user_answer)`
* `calculate_score()`
* `detect_cheating()`
* `get_detailed_results()`

---

### ✅ Step 5: `UserScoreHashMap`

A hashmap optimized for score tracking and analytics. Built with bucketed chaining and auto-resizing.

#### Key Methods

* `store_score(user_id, quiz_id, score)`
* `get_score(user_id, quiz_id)`
* `get_user_scores(user_id)`
* `get_quiz_scores(quiz_id)`
* `get_top_scores(quiz_id, limit)`
* `calculate_user_statistics(user_id)`

---

### ✅ Step 6: `ExamFlowQueue`

A real-time exam session manager that simulates queued, active, and completed user flows.

#### Methods

* `enqueue_user(user_id)`
* `start_next_exam()`
* `submit_answer(user_id, question_id, answer)`
* `complete_exam(user_id)`
* `get_queue_status()`
* `cleanup_expired_sessions(timeout=2_hours)`

---

### ✅ Step 7: Scoring Algorithms

These algorithms allow flexible scoring policies depending on use case.

#### Available Strategies

```python
calculate_standard_score(user_answers)
calculate_difficulty_weighted_score(user_answers)
calculate_negative_marking_score(user_answers, penalty_per_wrong)
calculate_adaptive_score(user_answers, question_success_rates)
```

Adaptive scoring considers:

* Difficulty level
* Inverse success rate of each question (more points for less commonly solved questions)

---

### ✅ Step 8: Quiz Generators

Generates quizzes using user performance history or random sampling.

#### Methods

* `generate_random_quiz(question_pool, num_questions)`
* `generate_adaptive_quiz(user_id, question_pool, score_history)`
* `analyze_user_weaknesses(score_data)`
* `shuffle_question_options(question)`

Adaptive generation prioritizes:

* Low-performing topics (under 70% accuracy)
* Unseen or rarely attempted questions

---

## ✅ Design Principles

* **Encapsulation**: All data and behavior related to a domain are encapsulated in their respective classes.
* **Extensibility**: Scoring and quiz generation algorithms are plug-and-play.
* **Maintainability**: Modular architecture with separation of concerns.
* **Efficiency**: Custom data structures improve performance for large-scale quizzes.
* **Scalability**: Designed to support concurrent quiz sessions and adaptive learning.

---

## Simplified Example - Walkthrough — 10 Question Exam

### 🧱 Step 1: Question Creation

```python
q1 = Question(1, "What is OOP?", "multiple_choice", difficulty=2)
q1.add_option("A paradigm", is_correct=True)
q1.add_option("A datatype")
q1.add_option("A function")
q1.add_option("A variable")

q2 = Question(2, "2 + 2 = ?", "multiple_choice", difficulty=1)
q2.add_option("4", is_correct=True)
q2.add_option("22")
q2.add_option("5")
q2.add_option("3")

# ... Repeat for q3 to q9

q10 = Question(10, "What is a HashMap?", "multiple_choice", difficulty=3)
q10.add_option("Key-value data structure", is_correct=True)
q10.add_option("Sorting algorithm")
q10.add_option("Loop type")
q10.add_option("Encryption method")
```

---

### 🧱 Step 2: Quiz Initialization

```python
quiz = Quiz("Fundamentals", shuffle_questions=True, shuffle_options=True)

quiz.add_question(q1)
quiz.add_question(q2)
# ...
quiz.add_question(q10)
```

---

### 🧱 Step 3: Answer Submission

```python
user_answers = {
    1: "A paradigm",
    2: "4",
    # ...
    10: "Key-value data structure"
}
```

---

### 🧱 Step 4: Score Computation

```python
result = QuizResult(user_id="student_01", quiz=quiz, answers=user_answers)
score = result.compute_score(scoring_mode="difficulty_weighted")
print("Score:", score)

```

---

### 🧱 Step 5: Score Storage

```python
score_db = UserScoreHashMap()
score_db.store_score("student_01", "Fundamentals", score)

# Retrieve history
score_history = score_db.get_user_scores("student_01")
```

---

### 🧱 Step 6: Exam Flow Management

```python
flow = ExamFlowQueue()
flow.enqueue_user("student_01")
flow.start_next_exam()
flow.complete_exam("student_01")
```

---

## 🧠 System Usage Reference

| Component             | Purpose                                                                |
| --------------------- | ---------------------------------------------------------------------- |
| `Question`            | Stores question text, type, difficulty, options, and correct answer.   |
| `Quiz`                | Manages the collection of questions and handles scoring logic.         |
| `QuizResult`          | Stores user answers, computes score, detects cheating.                 |
| `QuestionLinkedList`  | Supports dynamic question navigation and real-time reordering.         |
| `UserScoreHashMap`    | Tracks multiple users' scores across different quizzes.                |
| `ExamFlowQueue`       | Manages the queue of users taking quizzes in real-time.                |
| `Scoring Algorithms`  | Provides multiple scoring modes: standard, weighted, negative marking. |
| `Adaptive Generators` | Builds custom quizzes based on prior user performance or topic tags.   |

---

## 📁 Future Enhancements

* Persistent storage (e.g., SQLite or NoSQL backends)
* User authentication and session recovery
* Web interface (Django/Flask or React)
* AI-powered feedback per quiz attempt
* LLM-based short answer grading

---


