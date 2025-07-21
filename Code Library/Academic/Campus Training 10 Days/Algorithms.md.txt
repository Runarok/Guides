## 🧠 **Supervised Learning (Classification & Regression)**

These algorithms **learn from labeled data** (i.e., input with corresponding correct output).

### 1. **Linear Regression**

* **Goal:** Predict continuous values (e.g., prices, temperatures).
* **How it works:** Fits a straight line (y = mx + b) that best describes the relationship between input and output.
* **Use Case:** Predict house prices based on area and location.

---

### 2. **Logistic Regression**

* **Goal:** Predict binary outcomes (Yes/No, 0/1).
* **How it works:** Uses a sigmoid function to output probabilities between 0 and 1.
* **Use Case:** Predict whether a student will pass or fail based on attendance.

---

### 3. **Decision Tree Classifier**

* **Goal:** Classify data by learning decision rules.
* **How it works:** Builds a tree where each node represents a feature decision (e.g., "Income > 50K?").
* **Use Case:** Loan approval system based on income, credit score, etc.

---

### 4. **K-Nearest Neighbors (KNN)**

* **Goal:** Classify data based on proximity to other labeled data.
* **How it works:** Finds the ‘k’ nearest data points and assigns the majority class.
* **Use Case:** Recognize handwritten digits.

---

### 5. **Support Vector Machine (SVM)**

* **Goal:** Find a boundary (hyperplane) that best separates classes.
* **How it works:** Maximizes the margin between classes.
* **Use Case:** Spam vs non-spam email classification.

---

### 10. **Naive Bayes Classifier**

* **Goal:** Classify data using probabilities.
* **How it works:** Assumes features are independent and applies Bayes’ Theorem.
* **Use Case:** Sentiment analysis, spam filtering.

---

### 11. **Random Forest Simulation**

* **Goal:** Improve accuracy using an ensemble of decision trees.
* **How it works:** Trains multiple trees on random subsets and combines their predictions.
* **Use Case:** Disease prediction, fraud detection.

---

### 12. **Gradient Boosting Simulation**

* **Goal:** Sequentially correct errors made by previous models.
* **How it works:** Each new tree focuses on correcting mistakes of the previous one.
* **Use Case:** Ranking, credit scoring.

---

## 🔍 **Unsupervised Learning (Clustering & Dimensionality Reduction)**

These algorithms work **without labels**, finding hidden patterns.

### 6. **K-Means Clustering**

* **Goal:** Group data into K clusters based on similarity.
* **How it works:** Assigns points to clusters by minimizing distance to the cluster center.
* **Use Case:** Customer segmentation, market targeting.

---

### 7. **DBSCAN Clustering**

* **Goal:** Detect clusters of varying shape and noise.
* **How it works:** Groups points closely packed together and labels outliers.
* **Use Case:** Anomaly detection, spatial data clustering.

---

### 9. **PCA (Principal Component Analysis)**

* **Goal:** Reduce dimensions while preserving important info.
* **How it works:** Transforms data to new axes (principal components).
* **Use Case:** Visualizing high-dimensional data, speeding up ML.

---

### 8. **TF-IDF (Term Frequency-Inverse Document Frequency)**

* **Goal:** Convert text into numerical values.
* **How it works:** Measures word importance in a document relative to a corpus.
* **Use Case:** Search engines, text mining.

---

## ⏳ **Time Series & Sampling**

### 13. **Time Series Prediction (Sliding Window Average)**

* **Goal:** Forecast future values in time-based data.
* **How it works:** Averages the last ‘n’ data points to predict the next.
* **Use Case:** Stock price forecasting, weather prediction.

---

### 14. **Sliding Window Maximum**

* **Goal:** Find the maximum in each sliding window of size k.
* **How it works:** Moves a fixed-size window across data and tracks the maximum.
* **Use Case:** Real-time data monitoring.

---

### 15. **Reservoir Sampling**

* **Goal:** Sample k items from a large stream where size is unknown.
* **How it works:** Maintains a sample set and randomly replaces entries.
* **Use Case:** Streaming data analytics, online surveys.

---

## 🛍️ **Algorithms in Practice**

### 16. **Apriori Algorithm**

* **Goal:** Find frequent itemsets in transactions.
* **How it works:** Uses support/confidence to find associations (e.g., if A, then B).
* **Use Case:** Market basket analysis (e.g., Amazon’s "frequently bought together").

---

### 17. **A/B Testing Simulation**

* **Goal:** Compare two versions of a variable (e.g., website layout) to see which performs better.
* **How it works:** Divides users into groups and compares results statistically.
* **Use Case:** Website optimization, UX design testing.

---

### 18. **Dynamic Programming (Pollution Reduction Steps)**

* **Goal:** Solve complex problems by breaking them into simpler subproblems.
* **How it works:** Uses memoization or tabulation to store and reuse results.
* **Use Case:** Optimize number of steps to reduce pollution levels, path finding.

---

### 19. **Trie (Prefix Tree for Autocomplete)**

* **Goal:** Store words for efficient search, especially prefixes.
* **How it works:** Tree-like structure where each node is a character.
* **Use Case:** Autocomplete systems, spell checkers.

---

---
Made with ♥ by Runarok