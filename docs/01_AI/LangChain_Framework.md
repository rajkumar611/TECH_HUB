LANGCHAIN FRAMEWORK (AND RELATED TOOLS)
========================================

WHAT IS LANGCHAIN?
------------------
LangChain is a library/framework for building applications powered by LLMs.
It provides reusable abstractions to connect LLMs with tools, memory, vector databases,
and data sources — enabling RAG systems, AI agents, and pipelines.

LangChain solves: LLMs by themselves only take text in and return text out.
LangChain connects them to the real world.

Reference video: https://www.youtube.com/watch?v=RN0bqpN0U4g


THE 4 LANGCHAIN TOOLS (Interview-Ready)
-----------------------------------------

Tool        | Purpose                         | One-liner
------------|----------------------------------|-------------------------------------------
LangChain   | Build LLM application components | Wire together prompts, tools, memory, data
LangGraph   | Control agent behavior (stateful)| Graph-based control flow for complex agents
LangSmith   | Observe and debug AI workflows   | Tracing, logging, evaluation of LLM calls
LangServe   | Deploy AI apps as HTTP APIs      | Expose LangChain/LangGraph apps as REST


SIMILAR FRAMEWORKS
------------------
- Semantic Kernel  — Microsoft's equivalent, .NET-native, Azure-integrated
- OpenAI Swarm     — Simplest, purpose-built for multi-agent scenarios
- LangChain        — Python-first, most mature, widest ecosystem

All are used for architecting AI systems powered by LLMs.


ARCHITECTURE DIAGRAM
--------------------

Client / UI / Other Systems
        │
        ▼
 ┌─────────────┐
 │  LangServe  │  ← Deployment & APIs
 └──────┬──────┘
        │ HTTP
        ▼
 ┌─────────────────────────────┐
 │     AI Application / Agent  │
 │  ┌───────────┐              │
 │  │ LangGraph │  ← Control & State
 │  └─────┬─────┘              │
 │        ▼                    │
 │  ┌───────────┐              │
 │  │ LangChain │  ← Building Blocks
 │  └─────┬─────┘              │
 │        ▼                    │
 │   LLMs / Tools / RAG        │
 └─────────────────────────────┘
        ▲
        │ Tracing / Metrics
 ┌──────┴──────┐
 │  LangSmith  │  ← Observability
 └─────────────┘


SYSTEM TYPES YOU CAN BUILD
---------------------------
1. Plain Gen AI (no agents) — Just LLM + prompt
2. Single Agent system      — One LLM with tools
3. Multi-agent system       — Multiple LLMs orchestrated together
