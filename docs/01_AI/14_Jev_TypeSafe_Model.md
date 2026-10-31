WHAT IS JEV?
------------
- JEV is a newly launched AI model created by Diego Olmeda, who co-invented ChatGPT and worked on RLHF at OpenAI.
- Its creator claims it is up to 200x faster and 400x cheaper than frontier LLMs.
- Major AI platforms have adopted or supported it: Hugging Face's CEO discussed it, Versel added it to its gateway, and LangChain published integration guides.
- JEV does not generate free-form text, write code, or reason step-by-step. It is a System 1 model: fast, intuitive decision-making rather than deep reasoning.
- Its core capability is classification and decision-making: classify, route, score, rank, and assign confidence.

WHY IT MATTERS
--------------
- Many agentic workflows involve repeated small decisions rather than long text generation.
- Example: Claude Code building a project must think, decide, check outputs, and take multiple turns. JEV can handle many of these decision points.
- The intended pattern is: LLM proposes options -> JEV decides -> code executes.
- This can make agent workflows faster and cheaper without replacing LLMs.
- One explanation: JEV is like a highly intelligent classifier, or a "smart switch statement," rather than a general-purpose LLM replacement.

HOW JEV WORKS
-------------
- JEV is still a language model, but it uses a different training and architecture approach.
- Instead of autoregressive token generation, it produces parallel batch probability distributions.
- It uses a new reinforcement-learning paradigm called RLCD: Reinforcement Learning for Calibrated Decisions.
- Its architecture is broadly transformer-based and similar to an LLM, but with meaningful customizations—roughly 60-70% similar, with 20-30% modified.
- Diego Olmeda's background in RLHF appears relevant to this new decision-focused training approach.

JEV OUTPUT TYPES
----------------
1. bool
   - Yes/no decisions.
   - Returns a probability between 0 and 1.

2. choice
   - Selecting from fixed options.
   - Picks one category, such as auto, property, or health.

3. score
   - Categorical rating.
   - Returns 0, 1, or 2 based on defined thresholds.

4. Distribution
   - Confidence over options.
   - Behaves like a softmax output, assigning probabilities across categories.

- In the insurance example, severity is defined as: minor under $1,000, moderate from $1,000 to $10,000, and major above $10,000.
- JEV's output resembles a softmax classifier, but it is semantic and general-purpose rather than a narrowly trained neural classifier.

SPEED AND COST
--------------
- In the video's Google Colab demo, JEV was only about 2x faster because it used GPT-3.5, a lightweight and fast model.
- The creator's claimed 20x-200x speedup is more likely when compared with heavier reasoning models such as Claude Opus or similar frontier models.
- JEV has effectively zero output-token cost because it outputs compact probability distributions rather than long generated text.
- The founder reportedly said output cost was so insignificant that they did not charge for it.
- LLMs usually charge more for output than input; JEV reverses much of that cost profile because its output is minimal.
- JEV prompts may be longer and more precise because developers specify the state, task, categories, and scoring rules.

HALLUCINATION AND RELIABILITY
-----------------------------
- JEV is less prone to "hallucination" in the traditional sense because it does not freely generate text; it selects from defined options.
- However, it can still make mistakes because it remains a probabilistic AI model.
- In the guardrail demo, the presenter observed occasional incorrect approvals, so testing and evaluation remain essential.
- Developers should apply the same caution used with LLMs, especially for high-stakes decisions.

ACCESS AND MODEL AVAILABILITY
-----------------------------
- JEV can be accessed through the TypeSafe console: console.typesafe.ai.
- Access appears to be available through signup, though availability may vary by user.
- The console includes a playground with examples such as resume screening.
- Currently, there is one model: JEV latest—unlike LLM providers that offer many model variants.

KEY TAKEAWAYS
-------------
- JEV is not an LLM replacement; it is a fast, cheap decision layer that complements LLMs.
- It is best for tasks with well-scoped, structured outputs and a limited set of possible answers.
- It is especially useful in multi-turn agent workflows, routing, scoring, classification, guardrails, and structured extraction.
- Using JEV alongside LLMs can reduce cost and latency while preserving LLMs for generation and complex reasoning.

DEMO: INSURANCE CLAIM PROCESSING
--------------------------------
- The demo builds an insurance-claim automation agent that assesses three things: fraud risk, claim type, and claim severity.
- Based on those signals, it routes the claim to one of three paths: automatic processing, senior review, or fraud handling.
- A traditional LLM approach uses a prompt and structured-output schema, returning fields such as fraud: false, claim_type: auto, and severity: moderate.
- The limitation is that an LLM response may lack confidence scores and clear justification for its classification.
- JEV provides richer, probabilistic outputs: for example, a 17% fraud risk with strong signal, plus confidence scores for each classification.

USE CASE: DYNAMIC MODEL ROUTING
-------------------------------
- JEV can route requests between cheap/fast models and powerful/expensive models.
- LangChain provides a JEV-based model router where developers define routing criteria.
- Example: an e-commerce customer-support assistant uses a fast model for order-status checks, FAQs, and simple questions.
- It uses a powerful model for billing disputes, refund exceptions, and policy edge cases.
- In the demo, JEV automatically selected the powerful model for a more complex query.

USE CASE: GUARDRAILS
--------------------
- JEV can act as a guardrail for dangerous or sensitive tool calls.
- LangChain provides an experimental middleware wrapper for tool guardrails.
- Developers can wrap risky tools and have JEV evaluate suspicious requests before execution.
- Because this is experimental, teams should thoroughly test it before relying on it in production.

USE CASE: RESUME SCREENING
--------------------------
- JEV can screen resumes by extracting structured signals such as years of experience, technical depth, mentorship evidence, LLM experience, and talent profile.
- Talent-profile options include front-end engineer, back-end engineer, and full-stack engineer.
- The resume is supplied as the state; the screening criteria are supplied as questions.
- JEV returns a JSON-like structured decision, making it suitable for high-volume resume-screening agents.
- For this use case, the video suggests JEV could replace an LLM entirely because the output is structured and constrained.

OTHER USE CASES
---------------
- JEV's cookbooks also cover: re-ranking, line-by-line search, structure recovery, and function calling.
- Function calling works well when the user must choose from a limited set of options.
- Instead of using an LLM to generate a full JSON function call, JEV can make the selection faster and more cheaply.