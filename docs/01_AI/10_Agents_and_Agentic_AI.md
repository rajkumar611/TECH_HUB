
               AGENTS AND AGENTIC AI
         AI Systems That Can Take Actions and Make Decisions

📖 INTRODUCTION

A Traditional LLM:
  └─ Takes input → Processes → Returns text output
  └─ One turn: You ask, it answers
  └─ Can't take real-world actions

An Agent:
  └─ Takes input → Thinks → Takes actions → Thinks → Repeat
  └─ Multi-turn: Can iterate and refine
  └─ Can use tools: search web, run code, access APIs
  └─ Can complete complex multi-step tasks

"Agentic AI" = AI systems that act autonomously

🤖 WHAT IS AN AGENT?

An Agent is an autonomous system that:

1. PERCEIVES: Understands the current situation
2. REASONS: Decides what to do
3. ACTS: Takes action (using tools)
4. OBSERVES: Sees result of action
5. LEARNS: Updates understanding
6. REPEATS: Continues until goal achieved

Real-world analogy:

  Researcher finding information:
  ├─ Perceive: "I need to find a paper about climate change"
  ├─ Reason: "I should search Google Scholar"
  ├─ Act: Search Scholar for paper
  ├─ Observe: Found 5 papers, pick most relevant
  ├─ Reason: "I should read the abstract"
  ├─ Act: Read abstract
  ├─ Observe: "This isn't the right paper"
  ├─ Repeat until finding the right paper

Agents do this automatically!

🛠️ TOOLS (What Agents Can Use)

An Agent needs TOOLS to take actions:

Common Tools:

Calculator:
  └─ Solves: 2+2, complex math
  └─ Example: "Use calculator tool to compute 247 × 38"

Web Search:
  └─ Searches: Current information
  └─ Example: "Search for latest Tesla stock price"

Database Query:
  └─ Retrieves: Structured data
  └─ Example: "Query customer database for John's orders"

Code Execution:
  └─ Runs: Python, JavaScript code
  └─ Example: "Generate image thumbnail using PIL library"

API Calls:
  └─ Integrates: External services
  └─ Example: "Call weather API for Tokyo forecast"

Email:
  └─ Sends: Emails on your behalf
  └─ Example: "Send meeting reminder to team"

Calendar:
  └─ Manages: Your schedule
  └─ Example: "Check if 3pm is free, book meeting"

File Operations:
  └─ Reads/writes: Files
  └─ Example: "Save this report as PDF"

🔄 AGENT LOOP (Step-by-Step)

User: "Find cheapest flight from NYC to LA next week"

┌──────────────────────────────────────────────┐
│ Step 1: LLM THINKS                           │
├──────────────────────────────────────────────┤
│ "I need to search for flights"               │
│ Which tool should I use? Flight search API   │
└──────────────────────────────────────────────┘
              ↓
┌──────────────────────────────────────────────┐
│ Step 2: LLM DECIDES ACTION                   │
├──────────────────────────────────────────────┤
│ Action: search_flights(                      │
│   from="NYC",                                │
│   to="LA",                                   │
│   date="next_week"                           │
│ )                                            │
└──────────────────────────────────────────────┘
              ↓
┌──────────────────────────────────────────────┐
│ Step 3: EXECUTE TOOL                         │
├──────────────────────────────────────────────┤
│ Call flight API                              │
│ Receive: 50 flights with prices              │
└──────────────────────────────────────────────┘
              ↓
┌──────────────────────────────────────────────┐
│ Step 4: LLM OBSERVES RESULT                  │
├──────────────────────────────────────────────┤
│ "I got a list. Now need to find cheapest."   │
│ Cheapest: United Airlines, $185              │
│ Action: Check if seats available?            │
└──────────────────────────────────────────────┘
              ↓
┌──────────────────────────────────────────────┐
│ Step 5: REPEAT IF NEEDED                     │
├──────────────────────────────────────────────┤
│ Call availability_check tool                 │
│ Result: Yes, 3 seats available               │
│ Done! Provide final answer                   │
└──────────────────────────────────────────────┘
              ↓
        FINAL ANSWER:
        "The cheapest flight is United Airlines,
         $185 per person, departing Monday 9am."

📋 TYPES OF AGENTS

Reactive Agent:
  ├─ Responds to immediate inputs
  ├─ No planning ahead
  ├─ Good for: Simple tasks
  └─ Used in: Customer service bots

Planning Agent:
  ├─ Plans multiple steps ahead
  ├─ Decomposes goal into sub-goals
  ├─ Good for: Complex projects
  └─ Example: "Write research paper" → Break into tasks

Learning Agent:
  ├─ Learns from experience
  ├─ Improves over time
  ├─ Good for: Long-term improvement
  └─ Example: Recommender that learns user preferences

Hierarchical Agent:
  ├─ Multi-level agents (master + workers)
  ├─ Master delegates to workers
  ├─ Good for: Complex organizations
  └─ Example: CEO agent delegates to team agents

Multi-Agent Systems:
  ├─ Multiple agents working together
  ├─ Can specialize (one for sales, one for support)
  ├─ Can collaborate
  └─ Good for: Complex distributed tasks

⚙️ HOW LLMs DECIDE WHICH TOOL TO USE

Tool Specification:

The system tells LLM about tools:

"Available Tools:

  1. search_web(query: str) -> str
     Searches internet and returns results
     Use when: Need current information

  2. calculate(expression: str) -> number
     Evaluates math expressions
     Use when: Need calculation results

  3. get_time() -> str
     Returns current time
     Use when: Need to know time"

LLM Response Format:

When LLM wants to use a tool, it outputs:

  "I need to search for current information.

   Action: search_web
   Input: \"latest AI breakthroughs 2024\""

System parses this, executes tool, returns result:

  "Result: Recent breakthroughs in multimodal AI..."

LLM continues:

  "Based on search results, the latest breakthrough is..."

🚫 AGENT CHALLENGES

Hallucination:
  └─ Agent makes up tool results
  └─ Solution: Force agent to use tools for facts

Wrong Tool Selection:
  └─ Agent picks wrong tool
  └─ Solution: Better tool descriptions

Infinite Loops:
  └─ Agent repeats same action endlessly
  └─ Solution: Add max iteration limit

Slow Execution:
  └─ Too many tool calls = slow
  └─ Solution: Optimize tool selection

Cost:
  └─ Many API calls add up
  └─ Solution: Cache results, batch operations

Security:
  └─ Agent could access sensitive tools incorrectly
  └─ Solution: Permission control, rate limiting

📊 EXAMPLES OF AGENTS

Research Agent:
  └─ Goal: "Write research paper on quantum computing"
  └─ Actions:
      ├─ Search for papers
      ├─ Read abstracts
      ├─ Retrieve full papers
      ├─ Extract key concepts
      ├─ Organize information
      └─ Write paper

Customer Service Agent:
  └─ Goal: "Help customer with issue"
  └─ Actions:
      ├─ Search knowledge base
      ├─ Query database for customer info
      ├─ Check inventory
      ├─ Propose solutions
      ├─ Offer discounts
      └─ Schedule follow-up

Travel Planner Agent:
  └─ Goal: "Plan vacation to Europe"
  └─ Actions:
      ├─ Search flights
      ├─ Search hotels
      ├─ Look up attractions
      ├─ Check weather
      ├─ Create itinerary
      └─ Book if confirmed

Code Generation Agent:
  └─ Goal: "Build a web scraper"
  └─ Actions:
      ├─ Generate code
      ├─ Run code
      ├─ Test code
      ├─ Debug if errors
      ├─ Optimize
      └─ Provide final solution

🎓 KEY TAKEAWAYS

1. Agents iterate: Think → Act → Observe → Repeat
2. Tools enable agents to take real-world actions
3. Common tools: Search, Calculator, Code, APIs, Database
4. Agent loop: LLM decides action, system executes, LLM observes
5. Different agent types: Reactive, Planning, Learning, Hierarchical
6. LLM decides which tool via prompt/output
7. Challenges: Hallucination, wrong tool, loops, cost
8. Multi-agent systems can specialize and collaborate
9. Agents power modern AI assistants
10. Careful design needed for security and reliability

🤔 THINK ABOUT IT

- Why must you limit agent iterations?
- What could go wrong if agent has access to all tools?
- How would you make agent more reliable?

NEXT UP: Module 11 - Practical Tools and Frameworks

