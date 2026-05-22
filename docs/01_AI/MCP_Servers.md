MCP SERVERS (Model Context Protocol)
=====================================

WHAT IS MCP?
------------
MCP (Model Context Protocol) is a standard protocol that allows AI agents (LLMs)
to communicate with external tools and services in a consistent way.

Think of MCP as: A standardized plug-and-socket system for AI agents and external services.


KEY CONCEPTS
------------

MCP Client:
- Part of the AI agent's architecture.
- Connects to MCP Servers to call external tools.

MCP Server:
- A software component that wraps an external API or service.
- Exposes tools to the AI agent via the MCP protocol.
- Example: A GitHub MCP Server wraps the GitHub API so the AI can read repos, create PRs, etc.

Connector:
- The business/product term for an MCP Server, used by vendors.
- "MCP Server" = technical term. "Connector" = product/branding term.
- Example: Google's "Google Drive Connector" is an MCP Server wrapping the Google Drive API.


HOW IT WORKS
------------
Vendor builds MCP Server/Connector
        ↓
Wraps their existing REST APIs
        ↓
Exposes via MCP protocol
        ↓
AI Agent's MCP Client connects to it
        ↓
Agent can now use the vendor's service


EXAMPLES
--------
- Google Drive Connector → AI can read/write Google Drive files
- GitHub Connector       → AI can read repos, create issues, PRs
- Slack Connector        → AI can send/read Slack messages
- Playwright MCP Server  → AI can control browser for automated testing (custom-built)


PLAYWRIGHT + MCP NOTE
---------------------
Microsoft built Playwright as a testing library, but did NOT build an MCP Server for it.
If a team wants an AI agent to control/automate Playwright tests:
- They need to build their own custom Playwright MCP Server.
- This wraps the Playwright API so the AI agent can call it.
- This is for early adopters who want AI-driven test automation.


MCP CREATION RESOURCES
-----------------------
- Create and consume MCP server from chatbot:
  https://www.youtube.com/watch?v=q3_SQXeUMFM
  https://www.youtube.com/watch?v=U-74IGIp3iw
