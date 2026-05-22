OPENCLAW — AUTONOMOUS AI AGENT
================================

WHAT IS OPENCLAW?
-----------------
OpenClaw is a free, open-source AI agent that runs on your local machine.
It operates autonomously 24/7 and completes tasks via messaging platforms
(WhatsApp, Telegram, Slack, Discord, iMessage).

Unlike a chatbot that answers questions, OpenClaw can DO things:
manage files, execute commands, write code, browse the web, control calendars — all automatically.

Creator: Peter Steinberger (PSPDFKit founder) | License: MIT (free and open-source)
GitHub stars: 310,000+ as of March 2026 (fastest-growing open-source AI project)


HOW IT WORKS
------------
1. Install OpenClaw on your laptop.
2. Run: openclaw channels login --channel whatsapp
3. OpenClaw generates a QR code.
4. Scan it with WhatsApp (Settings → Linked Devices).
5. Now your WhatsApp is linked to your laptop.
6. When someone messages you, OpenClaw reads it, AI processes it, and responds automatically.


WHAT IT CAN DO
--------------
- Email management (filter, summarize, mark as read)
- Calendar scheduling (find slots, send invites)
- File management (find files, summarize documents)
- Code generation (refactor, write tests)
- Web research (search and summarize news)
- Document generation (reports, status updates)
- Continuous monitoring (24/7 alerts)


SUPPORTED AI MODELS
-------------------
You bring your own API key:
- Anthropic Claude (Opus, Sonnet, Haiku)
- OpenAI GPT (4, 5, Mini variants)
- Google Gemini
- Local models via Ollama (free, private, no API cost)


SECURITY RISKS (CRITICAL)
--------------------------
Because OpenClaw responds to anyone who messages your number, it is a security risk.

Risk 1: Unauthorized Access
  Anyone can message your number and trigger the agent.
  Prevention: Use Allowlist mode (only specific contacts allowed).

Risk 2: Prompt Injection
  Attacker embeds malicious instructions in a message.
  Prevention: Restrict permissions; disable shell access.

Risk 3: Broad System Permissions
  Agent can access email, calendar, files, shell commands.
  Prevention: Enable sandbox mode; only allow safe tools.

Risk 4: Data Exposure
  Cloud AI APIs see your data.
  Prevention: Use local models (Ollama) for private data.


SAFE USAGE — KEY SETTINGS
--------------------------
- dmPolicy: "pairing" — New contacts must be approved before responding (RECOMMENDED)
- dmPolicy: "allowlist" — Only specified numbers can interact (MOST SECURE)
- sandbox: true — Restrict system access
- blockedTools: file_delete, bash_exec, credential_access (NEVER allow these)


COMPARISON TABLE
----------------

Feature         | OpenClaw     | GitHub Copilot | Regular Chatbot
----------------|--------------|----------------|----------------
Scope           | System-wide  | IDE only        | Conversation only
Autonomy        | 24/7 agent   | User-triggered  | User-triggered
Memory          | Persistent   | Session-based   | Session-based
Security Risk   | HIGH         | Low             | Low
Cost (software) | Free         | Paid            | Varies


ENTERPRISE LESSON
-----------------
OpenClaw demonstrates agentic AI patterns at small scale.
At enterprise scale (100s of agents, millions of operations), you need:
- Governance: Who can trigger which agents and what are their boundaries?
- Audit trails: What did the agent do, when, and who triggered it?
- Security boundaries: What systems can agents access? What is read-only?
- Cost management: Token usage can scale unpredictably.
