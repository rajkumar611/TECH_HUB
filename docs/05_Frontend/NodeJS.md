NODE.JS — COMPLETE GUIDE

WHAT IS NODE.JS?

Node.js is a runtime environment that executes JavaScript code on the SERVER side.

JavaScript is the language.
Node.js is the runtime that runs JavaScript outside the browser.

Analogy:
- .NET CLR executes C# code on the server → Node.js executes JavaScript on the server
- C# is the language; CLR is the runtime
- JavaScript is the language; Node.js is the runtime

Before Node.js: JavaScript only ran inside browsers (client-side).
After Node.js: JavaScript can run on servers, building backend APIs and services.

THE PARALLEL WITH .NET

.NET world                  | JavaScript world
----------------------------|---------------------------
C# language                 | JavaScript / TypeScript language
.NET / CLR runtime          | Node.js runtime
ASP.NET Core (framework)    | Express.js (framework)
ASP.NET Core controllers    | Express routes

Equivalent code:
ASP.NET Core (C#):
  [HttpGet("api/products/{id}")]
  public async Task<IActionResult> GetProduct(int id)
  { return Ok(product); }

Node.js + Express (JavaScript):
  app.get('/api/products/:id', (req, res) => {
    res.json(product);
  });

Both approaches return JSON from a REST endpoint — they're architecturally equivalent.

NODE.JS vs ASP.NET CORE

Feature         | Node.js (JavaScript)      | ASP.NET Core (C#)
----------------|---------------------------|---------------------------
Type safety     | Dynamic (runtime errors)  | Static (compile-time errors)
Performance     | Very fast (event-driven)  | Very fast (async I/O)
Ecosystem       | npm (massive)             | NuGet
Best for        | I/O-heavy APIs, microservices | Enterprise, large teams
Full-stack      | Same JS for frontend + backend | Different language for frontend

.NET is statically typed: type errors caught at compile time.
JavaScript/Node.js is dynamically typed: types resolved at runtime (more flexible, less safe).

HOW REACT TALKS TO NODE.JS

React component
  → fetch() or axios API call
  → Node.js (Express) endpoint
  → Returns JSON
  → React updates the UI

React and Node.js are a common pairing (MERN stack = MongoDB, Express, React, Node.js),
but React works with any backend that returns JSON (.NET, Java, Python, etc.).

EXPRESS.JS

Express.js is the most popular framework built on Node.js — it's to Node.js what
ASP.NET Core is to .NET. It makes building REST APIs simple and fast.

  const express = require('express');
  const app = express();

  app.get('/api/users', (req, res) => {
    res.json([{ id: 1, name: 'Raj' }]);
  });

  app.listen(3000);

WHAT NODE.JS IS USED FOR

- REST API backends
- Microservices
- CLI tools
- Real-time applications (chat, notifications — often with Socket.io)
- Serverless functions (AWS Lambda, Azure Functions with JS)
- Build tools (webpack, vite, eslint all run on Node.js)

KEY FACTS TO REMEMBER

- Node.js = runtime environment for server-side JavaScript (NOT a language, NOT a framework)
- JavaScript = the language; Node.js = the runtime
- Express.js = the framework for building APIs on Node.js (like ASP.NET Core for .NET)
- Node.js is single-threaded but non-blocking (event loop) = excellent for I/O-heavy workloads
- JavaScript is dynamically typed; C# (.NET) is statically typed
- MERN stack: MongoDB + Express + React + Node.js (full JS stack)
- React works with any backend (Node.js, .NET, Java, Python) — they all return JSON
