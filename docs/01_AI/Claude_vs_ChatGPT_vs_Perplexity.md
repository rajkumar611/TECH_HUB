CLAUDE vs CHATGPT vs PERPLEXITY
================================

CHATGPT vs PERPLEXITY — QUICK COMPARISON
-----------------------------------------

Feature              | ChatGPT              | Perplexity
---------------------|----------------------|---------------------
Made by              | OpenAI               | Perplexity AI
Core identity        | Chatbot first        | Search engine first
Real-time web search | Optional, not default| Always, every answer
Cites sources        | Sometimes            | Always with links
Code writing         | Excellent            | Basic
Essay/writing        | Excellent            | Basic
Image generation     | Yes (DALL-E)         | No
Memory of you        | Yes                  | No
Best for             | Creating, coding     | Finding current info
Model selection      | Yes (choose model)   | Yes (choose who summarizes)

Key difference:
- ChatGPT = AI assistant that can optionally search the web.
- Perplexity = AI-powered search engine that always retrieves from the web.


CLAUDE vs CHATGPT — DOCUMENT UPLOAD APPROACH
----------------------------------------------

Feature                  | Claude           | ChatGPT / MS Copilot
-------------------------|------------------|---------------------
Context window           | 200K tokens      | 128K tokens
Doc upload approach      | Full doc in context | RAG internally
Chunking needed          | No               | Yes
Vector DB needed         | No               | Yes (temporary)
Embedding API            | Not available    | OpenAI Embedding API
Session persistent       | No               | No

Claude does NOT use RAG for document uploads because its context window
(200K tokens = ~150K words) is large enough to fit the entire document.

ChatGPT and MS Copilot use RAG internally:
Document → Chunks → Embeddings → Vector DB → Similarity search → LLM gets relevant chunks.

PRODUCTION RULE: For production apps with many documents and users,
always use RAG regardless of which LLM you choose.
The context window is temporary and does not scale.


AI CODING TOOLS — CLAUDE CODE vs GITHUB COPILOT
-------------------------------------------------

GitHub Copilot:
- IDE-integrated (works inside Visual Studio, VS Code).
- Provides real-time inline code suggestions as you type.
- You drive, it suggests.
- Also supports code generation, new files, tests via chat.
- Can now use Claude's model via model selection.

Claude Code:
- CLI-based (runs from terminal / command prompt).
- Agentic: you delegate tasks (e.g., "Refactor this file", "Add tests").
- Claude reads files, writes code, executes commands, runs tests, and iterates.
- Supports MCP server integrations for connecting to external tools.
- You delegate, it executes.

Key difference:
Copilot = inline assistant, IDE-focused.
Claude Code = autonomous task executor, terminal-based.

They complement each other. Use Copilot for day-to-day coding.
Use Claude Code for complex refactoring or agentic automation tasks.
