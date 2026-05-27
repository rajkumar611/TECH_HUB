TYPES OF AI AGENTS
==================

An AI Agent = LLM + Tools

The agent uses a language model (LLM) for reasoning and tools (like search, code execution, APIs) to take actions.


5 TYPES OF AI AGENTS
---------------------

1. Simple Reflex Agent
   - Reacts directly to input with no memory.
   - Example: Motion sensors that turn lights on/off.

2. Model-Based Reflex Agent
   - Has internal memory to track the current state.
   - Example: Alexa, Siri, a robot vacuum cleaner.

3. Goal-Based Agent
   - Works toward a specific objective using planning.
   - Example: GPS navigation, drone delivery.

4. Utility-Based Agent
   - Considers multiple options and picks the best one.
   - Example: Self-driving cars, chess engines.

5. Learning Agent
   - Learns from past experience and improves over time.
   - Example: Recommendation systems, modern LLMs.


HOW THESE MAP TO ENTERPRISE AI (e.g., Claude Code in SDLC)
-----------------------------------------------------------

Agent Type        | Example Use Case in Software Development
------------------|------------------------------------------
Simple Reflex     | Auto-formatter (lint on save)
Model-Based       | AI that remembers conversation context
Goal-Based        | "Build a REST API for user auth"
Utility-Based     | "Compare 3 architectural options and pick the best"
Learning Agent    | System that improves test coverage over iterations


KEY INSIGHT
-----------
In enterprise SDLC workflows, you typically combine Goal-Based + Utility-Based agents,
with Learning agents for long-term improvement.

Each agent type also needs governance and guardrails:
- Learning agents can drift without supervision.
- Utility agents need cost controls.
- All agents need human approval checkpoints for critical decisions.

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
