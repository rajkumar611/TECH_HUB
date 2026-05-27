Machine learning models are evaluated using metrics like Precision, Recall, and F1 Score, and are used in production during Inference.

Precision tells how correct your positive (YES) predictions are.
Recall tells how many actual positive (YES) cases are correctly identified.
F1 Score balances Precision and Recall into a single value.
Inference is the process of using a trained model to make predictions on new data.

Example (Spam Detection):
Email  Actual      Predicted
1      Spam        Spam
2      Spam        Spam
3      Spam        Not Spam
4      Spam        Spam
5      Not Spam    Spam
6      Not Spam    Not Spam
7      Not Spam    Not Spam
8      Not Spam    Spam
9      Spam        Spam
10     Not Spam    Not Spam

Counts:
TP (True Positive)  = 4  (1, 2, 4, 9)
FP (False Positive) = 2  (5, 8)
TN (True Negative)  = 3  (6, 7, 10)
FN (False Negative) = 1  (3)

Precision = TP / (TP + FP) = 4 / 6 = 0.67
Recall = TP / (TP + FN) = 4 / 5 = 0.8
F1 Score = 2 × (Precision × Recall) / (Precision + Recall) ≈ 0.73

Inference Example (new data):
Email  Actual      Predicted
11     Spam        Spam
12     Not Spam    Not Spam
13     Spam        Spam

Meaning:
Precision shows how reliable positive predictions are.
Recall shows how well the model captures actual positives.
F1 Score gives a balanced measure between precision and recall.
Inference is where the trained model is used to make predictions on unseen data.

Summary:
Train the model → Evaluate using Precision, Recall, F1 Score → Deploy → Use Inference to predict new data.