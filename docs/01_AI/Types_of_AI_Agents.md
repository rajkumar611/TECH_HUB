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
