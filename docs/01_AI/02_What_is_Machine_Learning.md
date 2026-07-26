# What is Machine Learning?

Understanding how machines learn from data

## 📖 Introduction

Machine Learning (ML) is the core of artificial intelligence. Instead of
telling a computer exactly what to do, ML lets the computer learn from
examples and improve on its own.

Think of it like learning to ride a bike. No one can explain EXACTLY how
to balance perfectly, but through practice, your brain learns the pattern.
ML works the same way—through examples!

## 🔑 The Three Types of Machine Learning

1️⃣  SUPERVISED LEARNING
    └─ "Learning with a teacher giving correct answers"

    How it works:
    ├─ You show the machine MANY examples with correct labels
    ├─ Example: 1000 cat and dog photos labeled "cat" or "dog"
    ├─ Machine learns: "Cats have whiskers, pointy ears..."
    └─ Now it can identify cats/dogs in new photos

    Real-world uses:
    ├─ Spam detection (email labeled as spam/not spam)
    ├─ Medical diagnosis (images labeled as healthy/disease)
    ├─ House price prediction (houses with prices)
    └─ Credit approval (past loans with approved/rejected)

2️⃣  UNSUPERVISED LEARNING
    └─ "Learning without being told the right answer"

    How it works:
    ├─ Show machine data WITHOUT labels
    ├─ Example: 1000 customer records, no labels
    ├─ Machine finds patterns: "These customers buy together..."
    └─ Discovers groups/patterns humans didn't know existed

    Real-world uses:
    ├─ Customer segmentation (finding customer groups)
    ├─ Recommendation systems (finding similar products)
    ├─ Fraud detection (finding unusual patterns)
    └─ Gene classification (finding genetic clusters)

3️⃣  REINFORCEMENT LEARNING
    └─ "Learning through rewards and punishment"

    How it works:
    ├─ Machine takes actions in an environment
    ├─ Gets reward (good action) or penalty (bad action)
    ├─ Over time, learns to maximize rewards
    └─ Like training a dog—reward for good behavior!

    Real-world uses:
    ├─ Game AI (AlphaGo learned to beat world champion)
    ├─ Robot control (learn to walk, manipulate objects)
    ├─ Self-driving cars (learn to drive safely)
    └─ Trading algorithms (learn to make profitable trades)

🎯 SUPERVISED LEARNING IN DETAIL (Most Common Type)

Three Main Tasks:

A) CLASSIFICATION
   Question: What category does this belong to?
   Examples:
   ├─ Email: Spam or Not Spam?
   ├─ Image: Cat, Dog, or Bird?
   ├─ Movie: Horror, Comedy, or Drama?
   └─ Medical: Disease or Healthy?

B) REGRESSION
   Question: What number will this be?
   Examples:
   ├─ Temperature tomorrow (will be 25°C)
   ├─ House price (will be $300,000)
   ├─ Stock price next month (will be $150)
   └─ Student score (will get 85/100)

C) RANKING
   Question: In what order should these be?
   Examples:
   ├─ Search results (most relevant first)
   ├─ Recommendations (most likely to like first)
   └─ News feed (most interesting first)

📚 THE ML WORKFLOW (Step-by-Step)

Step 1: COLLECT DATA
    └─ Gather examples (thousands, millions of them!)
    └─ More data = better learning (usually)

Step 2: PREPARE DATA
    └─ Clean it (remove mistakes)
    └─ Format it (organize consistently)
    └─ Label it (for supervised learning)

Step 3: SPLIT DATA
    └─ Training Set: 70-80% (machine learns from this)
    └─ Test Set: 20-30% (check if learning worked)

Step 4: TRAIN THE MODEL
    └─ Machine finds patterns in training data
    └─ Adjusts internal parameters (weights)
    └─ This is "learning"

Step 5: EVALUATE
    └─ Test on the test set
    └─ Measure accuracy: "Got 92% correct!"

Step 6: DEPLOY & USE
    └─ Put it in the real world
    └─ Make predictions on new data

🧮 WHAT IS A "MODEL" ANYWAY?

A machine learning MODEL is essentially:
  ├─ A mathematical equation that learned from your data
  ├─ Contains MILLIONS of numbers (called weights/parameters)
  ├─ Takes input → processes through equation → gives output
  └─ These numbers are the "knowledge" it learned

Example:
  Old: If age > 18 AND salary > 50,000 → Approve credit
       (Humans wrote this rule)

  ML:  Input: age, income, credit_history
       Output: Approval probability (78% likely)
       (Model learned the complex pattern from 100,000 examples)

⚖️ THE ACCURACY PARADOX

A tricky problem in ML:

OVERFITTING: Model memorized training data
  ├─ Train accuracy: 99%
  ├─ Real-world accuracy: 60%
  └─ Like memorizing answers but not understanding the concept

UNDERFITTING: Model didn't learn well enough
  ├─ Train accuracy: 65%
  ├─ Real-world accuracy: 66%
  └─ Like studying but not hard enough

JUST RIGHT: Good balance
  ├─ Train accuracy: 92%
  ├─ Real-world accuracy: 90%
  └─ Like understanding the concept deeply

🔄 KEY ML ALGORITHMS

Linear Regression (Predicting numbers)
  └─ Used for: House prices, temperature prediction
  └─ Simplest type of ML

Logistic Regression (Classification, despite the name)
  └─ Used for: Yes/No decisions (spam/not spam)
  └─ Very common in real projects

Decision Trees (Making decisions step-by-step)
  └─ Used for: Credit approval, medical diagnosis
  └─ Easy to explain to humans

Random Forest (Many decision trees combined)
  └─ Used for: Complex predictions
  └─ Usually very accurate

K-Nearest Neighbors (Find similar examples)
  └─ Used for: Recommendations
  └─ "You're like these other people, so..."

Support Vector Machines (Finding boundaries)
  └─ Used for: Complex classification
  └─ Good for many types of data

📊 EXAMPLE: PREDICTING STUDENT GRADES

Task: Predict if student will score A, B, C based on hours studied

Data Collection:
  Student 1: 5 hours studied → Grade A
  Student 2: 2 hours studied → Grade C
  Student 3: 4 hours studied → Grade B
  ... (1000 more examples)

Training:
  Machine learns: More hours = Higher grade (simplified)
  Actually learns complex: time, sleep, previous marks, etc.

Prediction:
  New student says: "I studied 4.5 hours"
  Model predicts: "You'll probably get an A" (based on pattern)

🎓 KEY TAKEAWAYS

1. ML learns patterns from examples, not programmed rules
2. Three types: Supervised, Unsupervised, Reinforcement
3. Supervised learning for predictions and classifications
4. ML workflow: Collect → Prepare → Train → Evaluate → Deploy
5. A model is essentially learned mathematical equations
6. Balance is key: not too simple, not too complex

🤔 THINK ABOUT IT

- Why does a spam filter need thousands of examples, not just the rules?
- What data would you need to predict a student's college major?
- Why is it dangerous if your model overfits?

NEXT UP: Module 03 - Deep Learning Fundamentals

