RAG AND VECTOR DATABASES
=========================

WHAT IS RAG?
------------
RAG = Retrieval-Augmented Generation.
Instead of relying only on an LLM's trained knowledge, RAG:
1. Retrieves relevant documents from a database.
2. Feeds those documents as context to the LLM.
3. LLM generates an answer based on both the retrieved docs and its training.

Use case: Answering questions from your company's own documents.


HOW CLAUDE VS CHATGPT HANDLE DOCUMENT UPLOADS
----------------------------------------------

Claude:
- Has a huge context window (200,000 tokens = ~150,000 words).
- Loads the entire document directly into the context window.
- No chunking, no embedding, no vector DB needed.

ChatGPT / MS Copilot:
- Smaller context window (128K tokens).
- Uses RAG internally: splits doc into chunks → converts to vectors → stores in temp vector DB → retrieves relevant chunks per question.


WHAT ARE VECTORS AND EMBEDDINGS?
---------------------------------
- Vector = a list of numbers representing the meaning of text. Example: [0.2, -0.5, 0.8, ...]
- Embedding = the process of converting text into a vector using an embedding model.
- One document = one vector (typically 1536 numbers for OpenAI models).
- Semantically similar text produces numerically similar vectors.


VECTOR DATABASES
-----------------
Vectors are stored in specialized vector databases for fast similarity search.
Examples: Pinecone, Weaviate, Milvus, Chroma, FAISS, Azure Cognitive Search.

The developer/engineer building the app decides which vector DB to use.
The LLM itself does not choose or bundle with any vector DB.

Azure equivalent: Azure Cognitive Search (used in Azure AI 102 course).


SEMANTIC SEARCH
---------------
- Regular search: keyword matching (like Ctrl+F).
- Semantic search: finds results based on MEANING, not exact words.
- Example: Search "How to cook pasta" finds "cooking spaghetti" results.
- Made possible by vector similarity: query → vector → find similar vectors → return docs.


VECTOR INDEXING
---------------
With millions of vectors, searching all of them is too slow.
Vector Indexing organizes them for fast similarity search.

Common index types:
- Flat (Brute-force): Compares every vector exactly. Best for small datasets.
- IVF (Inverted File Index): Groups into clusters. Balanced speed/accuracy.
- HNSW (Hierarchical Navigable Small World): Multi-layer graph traversal. Most popular in production.
- PQ (Product Quantization): Compresses vectors. Best for memory-constrained environments.

HNSW analogy: Like a highway system — expressway at top for fast navigation, local roads at bottom for precision.

Popular databases and their default index:
- Pinecone, Weaviate, Qdrant, Chroma: HNSW
- FAISS (Meta): IVF with PQ or Flat
- pgvector (Postgres): Both IVF and HNSW


RAG PIPELINE (FULL FLOW)
-------------------------
1. User submits a query.
2. Query converted to a vector using an embedding model.
3. Vector index (HNSW) finds Top-K most similar vectors.
4. Matching document chunks retrieved.
5. Chunks + user query sent to the LLM as context.
6. LLM generates the final answer.


PRODUCTION NOTE
---------------
For production apps with many documents and many users:
- Always use RAG regardless of which LLM you use.
- The context window is temporary and not scalable.
