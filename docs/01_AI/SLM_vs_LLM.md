SLM vs LLM — How AI Models Are Classified
==========================================

PRIMARY BASIS: Number of Parameters
Parameters = internal weights learned during training.
More parameters = more knowledge = bigger model.
(No official cutoff — these are loose industry ranges.)


SIZE CLASSIFICATION
-------------------

Category   | Size       | Examples
-----------|------------|----------------------------------
SLM (Small)| Under 7B   | Phi-3 Mini, Gemma 2B, LLaMA 1B
Medium     | 7B - 30B   | Mistral 7B, LLaMA 3 8B
LLM (Large)| 30B - 100B | LLaMA 3 70B, Mixtral 8x7B
Frontier   | 100B+      | GPT-4, Claude 3, Gemini Ultra


KEY DIFFERENCES
---------------

Feature                | SLM              | LLM
-----------------------|------------------|----------------------
Runs on laptop         | YES              | Usually NO
Needs GPU              | Optional         | Required
RAM needed             | 4-8 GB           | 40-80+ GB
Runs locally (Ollama)  | YES              | Rarely
Cost                   | Free/cheap       | Cloud subscription
General knowledge      | Limited          | Broad
Complex reasoning      | Basic            | Strong
Coding ability         | Basic            | Advanced
Specific tasks         | Excellent        | Excellent


WHY THE LINE IS BLURRY
-----------------------
Training data and architecture keep improving.
A 7B model today can outperform a 70B model from 2 years ago.
Example: Phi-3 Mini (3.8B) beats many older LLMs.


SIMPLE ANALOGY
--------------
SLM = Smart junior employee. Fast, efficient, great at specific tasks. Works on a laptop.
LLM = Senior expert with a vast library. Knows everything broadly. Needs a big office (cloud).


BOTTOM LINE
-----------
SLM: Fewer params (under 7B). Runs locally, fast, cheap, task-specific.
LLM: Many params (30B+). Needs cloud or GPU, powerful, general-purpose.
Classification is a rough industry convention — NOT an official standard.
