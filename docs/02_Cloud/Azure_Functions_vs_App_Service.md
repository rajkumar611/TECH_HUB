AZURE FUNCTIONS vs AZURE APP SERVICE

AZURE FUNCTIONS (Serverless)

- Serverless: You don't manage servers, scaling, or maintenance. Azure handles everything.
- You write small, focused functions for specific tasks.
- Runs on-demand (triggered), not 24/7.
- Cost: Pay per execution (very cheap for low usage).

How it works:
Developer writes code locally → Publishes to Azure → Azure picks runtime → Waits for trigger → Function executes.

Trigger Types:
1. HTTP trigger     — Your main app calls the function via HTTP.
2. Timer trigger    — Runs automatically at scheduled times (e.g., midnight cron job).
3. Blob trigger     — Fires when a file is uploaded to Azure Blob Storage.
4. Queue trigger    — Fires when a message arrives in a queue.

Example:
Customer uploads invoice to Azure Storage
        ↓ (No one called the function explicitly)
Azure Storage event → Triggers function automatically
        ↓
Function extracts text from invoice

Note: The main app can be written in one language; Azure Functions can be in another.

AZURE APP SERVICE

- Fully managed platform to host web apps, APIs, and mobile backends.
- Runs continuously 24/7 (unlike Azure Functions which run on-demand).
- You pay a fixed hourly rate based on the tier, regardless of usage.
- Azure manages the server, OS, runtime, security patches, and scaling.
- You just deploy your code.

Use for: Traditional web apps, REST APIs, always-on backend services.

WHEN TO USE WHICH?

Use Azure Functions when:
- The task is short, event-driven, or happens occasionally.
- You want to react to events (file upload, queue message, timer).
- You want serverless cost (pay only when running).

Use Azure App Service when:
- The app needs to run 24/7 (web apps, APIs).
- You want predictable hosting with fixed cost.
- You need more control over runtime and config.

ANALOGY

Azure Functions = A freelancer you call for a specific job. They work, then go home.
Azure App Service = A full-time employee who stays in the office all day.
