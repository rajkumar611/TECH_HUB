GENERAL TECHNOLOGY CONCEPTS
=============================

GO (GOLANG)
------------
What it is:
Go is a fast, simple, compiled programming language created by Google.
Designed for building scalable, concurrent systems.

Key characteristics:
- Compiled directly to machine code (very fast)
- Built-in concurrency using lightweight "goroutines" (like mini-threads, but much cheaper)
- Simple syntax — intentionally minimal and readable
- Garbage collected (like .NET and Java)
- Small runtime: compiled directly into the binary — no separate runtime to install

Common uses:
- Cloud infrastructure tools (Docker, Kubernetes, Terraform are all written in Go)
- High-performance APIs and microservices
- CLI tools
- Network servers

Go vs .NET:
Go compiles to a single binary with a built-in runtime — no CLR installation needed.
.NET requires the .NET runtime to be installed on the machine.


MICROSOFT GRAPH API
--------------------
What it is:
Microsoft Graph API is a single unified gateway to the entire Microsoft 365 ecosystem.

One API endpoint (graph.microsoft.com) gives access to:
- SharePoint (files, sites, lists)
- Teams (channels, messages, members)
- OneDrive (files)
- Outlook (emails, calendar, contacts)
- Azure AD (users, groups, directory)
- Planner, To Do, Forms, and more

Why it matters:
When clients ask "how do we integrate Office 365 with our custom system?",
the answer is almost always "use Microsoft Graph API."

It acts as an API Gateway (see Architecture notes) for all Microsoft 365 services.
Authentication is done via Azure AD (OAuth 2.0 and JWT tokens).


OAUTH AND JWT
--------------
OAuth:
OAuth is a protocol/process for granting access to resources without sharing passwords.
It issues tokens that represent authorisation to access something.

Example: "Sign in with Google" → you grant an app access to your Google profile
without giving it your Google password. Google issues a token instead.

JWT (JSON Web Token):
JWT is a common TOKEN FORMAT used by OAuth (and other systems).
It is a compact, self-contained token that carries claims (user ID, roles, expiry).

Relationship:
- OAuth = the process for granting access
- JWT = the token format commonly used to represent that access

Note: OAuth can also issue opaque tokens (random strings that don't contain readable data).
JWT is just the most common choice.


FIDDLER AND POSTMAN
--------------------
Fiddler:
- Captures and inspects REAL HTTP/HTTPS traffic from your running applications
- Acts as a proxy between your app and the network
- Shows all requests, responses, headers, and payloads in real time
- Useful for debugging live traffic and troubleshooting APIs

Postman:
- Creates and sends test API requests manually
- Used to test API endpoints during development
- Supports collections of tests, environments, and automation
- Does NOT capture live traffic from your apps

One-liner: Fiddler = spy on real traffic; Postman = manually test your APIs.


MERN STACK
-----------
MERN is a full-stack JavaScript development stack:

M = MongoDB      → NoSQL database (stores data as JSON-like documents)
E = Express.js   → Framework for building REST APIs with JavaScript
R = React.js     → Library for building the frontend UI
N = Node.js      → Runtime for executing JavaScript on the server

All four layers use JavaScript/TypeScript, making MERN a unified, full-JS stack.
Developers can use the same language across frontend and backend.


DJANGO AND DJANGO ORM
----------------------
Django = Python web framework (equivalent to ASP.NET Core in .NET)
Django ORM = the built-in ORM inside Django (equivalent to Entity Framework in .NET)

Comparison:
  Language       | .NET (C#)                | Python
  Web framework  | ASP.NET Core             | Django
  ORM            | Entity Framework (EF)    | Django ORM

Key difference:
- ASP.NET Core does NOT include Entity Framework — EF is optional and added separately
- Django DOES include its ORM by default — Django ORM is always part of Django

Important: When people say "Django for Python like EF for C#", they mean Django ORM
specifically, not the Django framework itself.


KEY FACTS TO REMEMBER
----------------------
- Go = fast, compiled, concurrent language from Google (Docker/Kubernetes are built with Go)
- Microsoft Graph API = single gateway for all Microsoft 365 services
- OAuth = protocol for granting access via tokens; JWT = the most common token format
- Fiddler = inspects real HTTP traffic; Postman = manually tests APIs
- MERN = MongoDB + Express + React + Node.js (full JavaScript stack)
- Django = Python web framework; Django ORM = the built-in ORM (like EF in .NET)
