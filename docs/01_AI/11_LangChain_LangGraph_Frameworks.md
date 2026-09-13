╔════════════════════════════════════════════════════════════════╗
║        LANGCHAIN AND LANGGRAPH FRAMEWORKS                     ║
║      Building Production AI Applications with Python          ║
╚════════════════════════════════════════════════════════════════╝

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📖 INTRODUCTION

Building an AI app from scratch is complex:
  ├─ Call LLM APIs
  ├─ Manage prompts
  ├─ Handle errors
  ├─ Chain multiple calls
  ├─ Manage state/memory
  ├─ Integrate tools
  └─ Deploy to production

LangChain = Framework that handles ALL of this!

It's like:
  └─ Flask for web (simplifies building web apps)
  └─ LangChain simplifies building LLM apps

Used by: Startups, enterprises, researchers building AI apps

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 WHAT IS LANGCHAIN?

LangChain is a Python library that provides:

1. LLM Wrappers
   └─ Consistent interface for different LLMs
   └─ Switch between OpenAI, Anthropic, Google easily

2. Prompt Templates
   └─ Create reusable prompts with variables
   └─ Example: "Explain {concept} to {audience}"

3. Memory Management
   └─ Keep conversation history
   └─ Different memory types (short-term, long-term)

4. Chains
   └─ Connect multiple LLM calls in sequence
   └─ Example: Question → Research → Answer

5. Agents
   └─ Build agents with tools
   └─ Automatic tool selection and execution

6. Vector Store Integration
   └─ Connect to vector DBs (Pinecone, Weaviate)
   └─ Makes RAG easy

7. Document Processing
   └─ Load PDFs, web pages, documents
   └─ Split into chunks automatically
   └─ Create embeddings

8. Retrieval
   └─ Query vector stores
   └─ Combine with generation

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔗 LANGCHAIN ARCHITECTURE

Components:

┌─────────────────────────────────────────────────┐
│ Language Models (GPT-4, Claude, Gemini, etc.)   │
└──────────┬──────────────────────────────────────┘
           ↑
┌──────────┴──────────────────────────────────────┐
│ LangChain Framework                             │
├──────────────────────────────────────────────────┤
│ ├─ Prompts                                      │
│ ├─ Chains                                       │
│ ├─ Agents                                       │
│ ├─ Memory                                       │
│ ├─ Tools                                        │
│ └─ Retrievers                                   │
└──────────┬──────────────────────────────────────┘
           ↑
┌──────────┴──────────────────────────────────────┐
│ Your Application Code                           │
├──────────────────────────────────────────────────┤
│ ├─ Chat interface                               │
│ ├─ Web server                                   │
│ ├─ Database                                     │
│ └─ Business logic                               │
└──────────────────────────────────────────────────┘

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💻 SIMPLE LANGCHAIN EXAMPLE

Without LangChain (Tedious):

```python
import openai

response = openai.ChatCompletion.create(
    model="gpt-4",
    messages=[
        {"role": "system", "content": "You are helpful assistant"},
        {"role": "user", "content": "What is AI?"}
    ]
)
print(response['choices'][0]['message']['content'])
```

With LangChain (Easy):

```python
from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate

llm = OpenAI(model_name="gpt-4")
prompt = PromptTemplate(
    input_variables=["topic"],
    template="Explain {topic} to a 12th grade student"
)

chain = prompt | llm
result = chain.invoke({"topic": "machine learning"})
print(result)
```

Much cleaner! Uses pipe operator (|) to chain.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 CHAINS (Connecting Multiple Steps)

Sequential Chain:
  └─ Step 1 → Step 2 → Step 3
  └─ Output of step 1 = Input to step 2
  └─ Example:
      ├─ Step 1: Generate topic ideas
      ├─ Step 2: Expand to outline
      └─ Step 3: Write full article

```python
from langchain.chains import LLMChain
from langchain.prompts import PromptTemplate
from langchain.llms import OpenAI

llm = OpenAI()

# Step 1: Generate ideas
ideas_prompt = PromptTemplate(
    template="Generate 5 ideas for {topic}",
    input_variables=["topic"]
)
ideas_chain = LLMChain(llm=llm, prompt=ideas_prompt)

# Step 2: Expand ideas
expand_prompt = PromptTemplate(
    template="Expand these ideas: {ideas}",
    input_variables=["ideas"]
)
expand_chain = LLMChain(llm=llm, prompt=expand_prompt)

# Run chain
ideas = ideas_chain.run("AI applications")
expanded = expand_chain.run(ideas)
print(expanded)
```

Simple pipeline!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💾 MEMORY (Remembering Conversations)

Types of Memory:

Buffer Memory (Short-term):
  ├─ Keeps last N messages
  ├─ Example: Remember last 5 turns
  ├─ Good for: Chat interfaces

Summary Memory:
  ├─ Summarizes conversation so far
  ├─ Keeps summary + recent messages
  ├─ Good for: Long conversations

Entity Memory:
  ├─ Remembers specific entities
  ├─ Example: Remember user's name is "John"
  ├─ Good for: Personalized interactions

Vector Memory:
  ├─ Stores in vector DB
  ├─ Retrieves relevant past exchanges
  ├─ Good for: Long-term learning

```python
from langchain.memory import ConversationBufferMemory
from langchain.chains import ConversationChain
from langchain.llms import OpenAI

memory = ConversationBufferMemory()

conversation = ConversationChain(
    llm=OpenAI(),
    memory=memory,
    verbose=True
)

conversation.run("Hi, my name is Alice")
conversation.run("What's my name?")  # AI remembers!
```

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🛠️ TOOLS AND AGENTS

Build agents with LangChain:

```python
from langchain.agents import AgentType, initialize_agent, load_tools
from langchain.llms import OpenAI

llm = OpenAI()

# Load tools
tools = load_tools(["serpapi", "llm-math"])

# Create agent
agent = initialize_agent(
    tools,
    llm,
    agent=AgentType.ZERO_SHOT_REACT_DESCRIPTION,
    verbose=True
)

# Run agent
result = agent.run("What's 2+2? And what's the weather in NYC?")
```

Agent automatically:
  ├─ Picks right tools
  ├─ Uses them correctly
  ├─ Combines results
  └─ Provides answer

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 RAG WITH LANGCHAIN

```python
from langchain.document_loaders import PDFLoader
from langchain.text_splitter import CharacterTextSplitter
from langchain.embeddings import OpenAIEmbeddings
from langchain.vectorstores import Pinecone
from langchain.chains import RetrievalQA
from langchain.llms import OpenAI

# 1. Load documents
loader = PDFLoader("document.pdf")
docs = loader.load()

# 2. Split into chunks
splitter = CharacterTextSplitter(chunk_size=1000)
chunks = splitter.split_documents(docs)

# 3. Create embeddings
embeddings = OpenAIEmbeddings()

# 4. Store in vector DB
vector_store = Pinecone.from_documents(
    chunks,
    embeddings
)

# 5. Create QA chain
qa = RetrievalQA.from_chain_type(
    llm=OpenAI(),
    chain_type="stuff",
    retriever=vector_store.as_retriever()
)

# 6. Ask questions
result = qa.run("What is covered in this document?")
```

Complete RAG pipeline in ~20 lines!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🌳 LANGGRAPH (Advanced Workflows)

LangGraph = Successor to LangChain for complex workflows

Key Differences:

LangChain:
  └─ Linear chains, good for simple flows
  └─ Hard to add loops/conditions

LangGraph:
  ├─ Graph-based, like state machines
  ├─ Easy to add loops/conditions
  ├─ Better for complex agent workflows
  ├─ Can retry, branch, aggregate
  └─ More control over flow

LangGraph Example:

```python
from langgraph.graph import StateGraph
from typing import TypedDict

class AgentState(TypedDict):
    query: str
    results: list
    answer: str

# Create graph
graph = StateGraph(AgentState)

# Add nodes
graph.add_node("search", search_tool)
graph.add_node("analyze", analyze_results)
graph.add_node("generate", generate_answer)

# Add edges with conditions
graph.add_edge("search", "analyze")
graph.add_conditional_edges(
    "analyze",
    lambda x: "retry" if not x["results"] else "generate",
    {"retry": "search", "generate": "generate"}
)

# Compile and run
compiled_graph = graph.compile()
result = compiled_graph.invoke({"query": "Find papers about AI"})
```

More powerful for complex workflows!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚙️ OTHER AI FRAMEWORKS

Semantic Kernel (Microsoft):
  ├─ .NET, Python, TypeScript
  ├─ Skills + Plugins architecture
  ├─ Good for: Enterprise, C# developers

Crew AI:
  ├─ Multi-agent framework
  ├─ Agents with roles and goals
  ├─ Good for: Complex multi-agent systems

Haystack (DeepSet):
  ├─ RAG framework
  ├─ Pipelines for retrieval
  ├─ Good for: Advanced RAG projects

Flowise:
  ├─ No-code visual builder
  ├─ Drag-and-drop workflows
  ├─ Good for: Non-developers

LiteLLM:
  ├─ Lightweight LLM wrapper
  ├─ Unified interface
  ├─ Good for: Cost optimization

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 LANGCHAIN ECOSYSTEM

LangChain Core:
  └─ Base classes, interfaces

LangChain Community:
  └─ Integrations with 200+ LLMs and tools

LangServe:
  └─ Deploy LangChain apps as APIs

LangSmith:
  └─ Debugging, testing, monitoring

Together = Complete platform for building LLM apps!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎓 KEY TAKEAWAYS

1. LangChain simplifies building LLM applications
2. Chains connect multiple steps in sequence
3. Memory keeps conversation context
4. Agents combine LLMs with tools
5. RAG is easy with LangChain built-ins
6. LangGraph for complex, graph-based workflows
7. Other frameworks: Semantic Kernel, Crew AI, Haystack
8. LangServe deploys apps as APIs
9. LangSmith debugs and monitors
10. Python-first, great ecosystem

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🤔 THINK ABOUT IT

- Why is chains better than calling LLM API directly?
- How does memory prevent losing conversation context?
- When would you use LangGraph instead of LangChain?

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NEXT UP: Module 12 - Advanced Topics (Evals, Responsible AI)
