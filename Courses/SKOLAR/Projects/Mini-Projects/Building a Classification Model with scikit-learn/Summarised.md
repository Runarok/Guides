Mini-Project 2:Building a Classification Model with scikit-learn
- Objective:The objectiveof this assignment is to build a classification model using scikit-learn to predict a binary outcome based on a dataset and evaluate the model's performance.
Instructions:
- Dataset:You can choose a dataset from sklearn'sbuilt-in datasets, or you can select a dataset of your choice from a reliable source. Ensure that the dataset contains both features and a binary target variable (e.g., 0 or 1, Yes or No, etc.). (This step is very very important for learning and hands on.Give students liberty to search and choose the data, it is important for students to find dataset on their own. They will be doing it on a monthly basis in their real job.)
- Using this dataset: https://www.kaggle.com/datasets/uciml/iris/data

Tasks:
- Data Loading:Load the dataset into a pandas DataFrame (if not using a built-in sklearn dataset). Display the first few rows to get a sense of the data.
```
import pandas as pd
Load the dataset
df = pd.read_csv('Iris.csv')

Display the first few rows
print(df.head())
```
This code reads the Iris.csv file into a pandas DataFrame and then prints the first five rows using df.head(). Make sure the Iris.csv file is in the same directory as your script, or provide the full path to the file.

- Data Preprocessing: Perform necessary data preprocessing steps such as handling missing values, encoding categorical variables (if any), and scaling/normalizing numerical features.
```
# Check for missing values
print("\nMissing values in the dataset:")
print(df.isnull().sum())

# Encode the categorical 'Species' column
label_encoder = LabelEncoder()
df['Species'] = label_encoder.fit_transform(df['Species'])

print("\nEncoded 'Species' column:")
print(df['Species'].head())

# Scale the numerical features
scaler = StandardScaler()
df[['SepalLengthCm', 'SepalWidthCm', 'PetalLengthCm', 'PetalWidthCm']] = scaler.fit_transform(
    df[['SepalLengthCm', 'SepalWidthCm', 'PetalLengthCm', 'PetalWidthCm']]
)

print("\nScaled numerical features:")
print(df.head())

# Dropping the 'Id' column as it's not useful for modeling
df.drop(columns=['Id'], inplace=True)

print("\nFinal preprocessed dataset:")
print(df.head())
```
Missing Values: We first check for missing values using df.isnull().sum(), which will give us a count of missing values for each column.\
Encoding Categorical Variables: The Species column is encoded using LabelEncoder, converting species names into numerical labels.\
Feature Scaling: We use StandardScaler to scale the numerical features, ensuring they have a mean of 0 and a standard deviation of 1. This is often beneficial for algorithms like k-NN or SVM.\
Dropping the Id Column: The Id column is just an identifier and doesn't contain useful information for modeling, so it's dropped.

- Data Splitting:Split the dataset into two parts: a training set (70-80% of the data) and a testing set (20-30% of the data).
```
# Split the dataset: 80% training and 20% testing
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)

# Display the shapes of the resulting datasets
print(f"Training features shape: {X_train.shape}")
print(f"Training labels shape: {y_train.shape}")
print(f"Testing features shape: {X_test.shape}")
print(f"Testing labels shape: {y_test.shape}")
```  
Explanation:
Label Encoding: The Species column is encoded into integers using LabelEncoder, which is necessary for machine learning models that require numerical input.\
Feature Scaling: The numerical features are standardized using StandardScaler for better performance of certain models.\
Dropping the Id Column: This column is not useful for modeling and is therefore dropped.\
Splitting the Dataset: The train_test_split function is used to split the dataset into training and testing sets. We use an 80-20 split, which is a common practice. The stratify=y parameter ensures that the split maintains the same class distribution in both the training and testing sets.\
Random State: Setting random_state=42 ensures that the split is reproducible. You can change this number or omit it to get a different random split each time.

- Model Selection:Choose at least two classification algorithms from sklearn (e.g., Logistic Regression, Decision Trees, Random Forest, Support Vector Machines, etc.). Train each model on the training data.
```
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Initialize the models
logistic_model = LogisticRegression()
random_forest_model = RandomForestClassifier()

# Train the Logistic Regression model
logistic_model.fit(X_train, y_train)

# Train the Random Forest model
random_forest_model.fit(X_train, y_train)

# Make predictions on the training set
logistic_train_pred = logistic_model.predict(X_train)
random_forest_train_pred = random_forest_model.predict(X_train)

# Calculate accuracy for both models
logistic_accuracy = accuracy_score(y_train, logistic_train_pred)
random_forest_accuracy = accuracy_score(y_train, random_forest_train_pred)

# Display the accuracy results
print(f"Logistic Regression Training Accuracy: {logistic_accuracy:.2f}")
print(f"Random Forest Training Accuracy: {random_forest_accuracy:.2f}")
```  
Logistic Regression: This is a linear model used for binary classification, but it can also handle multi-class problems like the Iris dataset.\
Random Forest: This is an ensemble method that constructs multiple decision trees and merges them to improve accuracy and control overfitting.\
Model Training: Both models are trained using the fit method on the training data.\
Accuracy Calculation: The accuracy of each model is calculated using accuracy_score, which compares the predicted labels with the actual labels from the training set.

- Model Evaluation:Evaluate the performance of each model on the testing set using appropriate classification metrics such as accuracy, precision, recall, F1-score, and ROC AUC. Compare the performance of the models and discuss which one performs better.
```
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, roc_auc_score, classification_report

# Calculate metrics for Logistic Regression
logistic_accuracy = accuracy_score(y_test, logistic_test_pred)
logistic_precision = precision_score(y_test, logistic_test_pred, average='weighted')
logistic_recall = recall_score(y_test, logistic_test_pred, average='weighted')
logistic_f1 = f1_score(y_test, logistic_test_pred, average='weighted')
logistic_roc_auc = roc_auc_score(pd.get_dummies(y_test), pd.get_dummies(logistic_test_pred), multi_class='ovr')

# Calculate metrics for Random Forest
random_forest_accuracy = accuracy_score(y_test, random_forest_test_pred)
random_forest_precision = precision_score(y_test, random_forest_test_pred, average='weighted')
random_forest_recall = recall_score(y_test, random_forest_test_pred, average='weighted')
random_forest_f1 = f1_score(y_test, random_forest_test_pred, average='weighted')
random_forest_roc_auc = roc_auc_score(pd.get_dummies(y_test), pd.get_dummies(random_forest_test_pred), multi_class='ovr')

# Display the results
print("Logistic Regression Metrics:")
print(f"Accuracy: {logistic_accuracy:.2f}")
print(f"Precision: {logistic_precision:.2f}")
print(f"Recall: {logistic_recall:.2f}")
print(f"F1 Score: {logistic_f1:.2f}")
print(f"ROC AUC: {logistic_roc_auc:.2f}")

print("\nRandom Forest Metrics:")
print(f"Accuracy: {random_forest_accuracy:.2f}")
print(f"Precision: {random_forest_precision:.2f}")
print(f"Recall: {random_forest_recall:.2f}")
print(f"F1 Score: {random_forest_f1:.2f}")
print(f"ROC AUC: {random_forest_roc_auc:.2f}")
```  
The predict method is used to generate predictions for testing sets for both models. The metrics calculated include accuracy, precision, recall, F1 score, and ROC AUC. Accuracy indicates overall performance, while precision and recall help understand the trade-off between false positives and false negatives. F1 score balances precision and recall, while ROC AUC indicates better model performance in class distinction.\

In most cases, Random Forest models perform better than Logistic Regression, especially in terms of accuracy and F1 score, due to their ensemble nature and ability to capture complex data patterns. However, the final decision should consider the specific context of the problem and the importance of each metric based on the application.

Cross-Validation:
```
# Perform k-fold cross-validation
logistic_cv_scores = cross_val_score(logistic_model, X, y, cv=5)  # 5-fold cross-validation
random_forest_cv_scores = cross_val_score(random_forest_model, X, y, cv=5)  # 5-fold cross-validation

# Display the results
print("Logistic Regression Cross-Validation Scores:")
print(f"Mean Accuracy: {logistic_cv_scores.mean():.2f} ± {logistic_cv_scores.std():.2f}")

print("\nRandom Forest Cross-Validation Scores:")
print(f"Mean Accuracy: {random_forest_cv_scores.mean():.2f} ± {random_forest_cv_scores.std():.2f}")
```
Explanation:\
Cross-Validation: We use cross_val_score to perform k-fold cross-validation. The cv=5 parameter indicates that we want to split the dataset into 5 folds.\
Mean and Standard Deviation: The mean accuracy and standard deviation of the cross-validation scores are calculated and printed for both models. This gives us an idea of the model's performance and its variability across different subsets of the data.
