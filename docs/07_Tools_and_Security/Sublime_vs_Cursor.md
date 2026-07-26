SUBLIME TEXT vs CURSOR

SUBLIME TEXT

What it is:
A lightweight, fast, general-purpose text/code editor.

Key characteristics:
- Extremely fast and low memory usage
- Great for quick edits, config files, scripting, multi-language coding
- Plugin ecosystem available (via Package Control)
- NOT AI-native: no built-in LLM, no AI code generation or refactoring
- Runs well offline with no special infrastructure

Best for:
- Quick edits across many file types
- Config files and YAML/JSON editing
- Lightweight scripting
- Developers who prefer speed and simplicity
- Offline environments

CURSOR

What it is:
A modern AI-powered code editor built on top of Visual Studio Code.
Designed specifically for AI-assisted coding, refactoring, debugging, and code generation.

Key characteristics:
- Built on VS Code (inherits all VS Code extensions and familiar UI)
- Deep LLM integration:
  - Inline code suggestions (like GitHub Copilot but more integrated)
  - Codebase-aware chat (ask questions about your entire codebase)
  - Multi-file refactoring with AI
  - Automated bug fixes and explanations
- Essentially = VS Code + AI superpowers
- Heavier than Sublime due to AI processing

Best for:
- Large, complex codebases
- AI-assisted development workflows
- Refactoring and modernising existing code
- Developers who want productivity acceleration through AI
- Teams adopting AI-first development practices

COMPARISON TABLE

Feature            | Sublime Text          | Cursor
-------------------|-----------------------|---------------------------
Type               | Text/code editor      | AI-powered code editor
Base               | Standalone            | Built on VS Code
AI capabilities    | None built-in         | Deep LLM integration (chat, refactor, generate)
Performance        | Extremely fast, light | Fast but heavier (AI overhead)
Memory usage       | Very low              | Moderate (VS Code base + AI)
Extensions         | Package Control       | VS Code extensions + AI tooling
Use case           | Quick edits, scripts  | Large codebases, AI-assisted dev
Learning curve     | Very easy             | Easy (if you know VS Code)
Offline work       | Yes, fully offline    | Limited (AI features need internet)
Best for           | Speed, simplicity     | AI-driven productivity

ONE-LINER SUMMARY

Sublime Text is a fast, lightweight text editor for manual coding and quick edits.
Cursor is an AI-powered coding environment built for modern, assisted development.

RELATED: CLAUDE CODE vs GITHUB COPILOT

(Both are AI coding tools, different from Sublime/Cursor)

Claude Code: Anthropic's agentic coding tool — works in the terminal, writes and
edits files autonomously, runs tests, and completes multi-step tasks.

GitHub Copilot: Microsoft/GitHub's inline AI suggestion tool — integrated into VS Code
and other IDEs, suggests code as you type.

Key difference:
Claude Code = autonomous agent (does the work)
GitHub Copilot = inline assistant (helps you as you code)
