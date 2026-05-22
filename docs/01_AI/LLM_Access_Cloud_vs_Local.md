LLM ACCESS — CLOUD vs LOCAL
============================

CLOUD SERVICES
--------------
Model lives on their servers. You call via an API key. Internet is required. Pay per token.

Service          | Provider  | Models              | Notes
-----------------|-----------|---------------------|---------------------
Azure OpenAI     | Microsoft | GPT-4o, GPT-4       | Enterprise, Azure-integrated
Amazon Bedrock   | AWS       | Claude, LLaMA       | Enterprise, multi-model
Google Vertex AI | Google    | Gemini              | Enterprise, GCP-integrated
Groq             | Groq Inc. | LLaMA, Mistral      | Speed-focused (LPU hardware)


LOCAL TOOLS
-----------
Model lives on YOUR machine. No API key. No internet after download. Free and private.

Tool           | Description
---------------|--------------------------------------------
Hugging Face   | Largest model hub (500K+ models). Downloads raw weights. Needs Python code to run.
Ollama         | Easiest local runner. One command to download and run. No coding needed.


QUICK COMPARISON
-----------------

Feature            | Cloud Services    | Local Tools
-------------------|-------------------|-------------------
Model location     | Their servers     | Your machine
API key needed     | Yes               | No
Internet needed    | Yes               | No (after download)
Cost               | Pay per token     | Free
Privacy            | Data sent out     | Fully private
Setup effort       | Easy              | Needs RAM/GPU
Model ownership    | No                | Yes


WHEN TO CHOOSE WHAT
--------------------

Choose CLOUD if:
- You need quick setup with no hardware investment.
- Working on production apps or enterprise projects.
- Need support, uptime guarantees, compliance.

Choose LOCAL if:
- Privacy is critical (data cannot leave your machine).
- You want to avoid API costs.
- You have adequate hardware (GPU or 8GB+ RAM).
