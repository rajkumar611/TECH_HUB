BLAZOR WEBASSEMBLY

WHAT IS BLAZOR?

Blazor is a Microsoft framework that lets you build web applications using C#
instead of JavaScript. It runs in the browser using WebAssembly (WASM).

Blazor WebAssembly is a Single Page Application (SPA) — just like React or Angular,
but written entirely in C#.

WHAT IS WEBASSEMBLY (WASM)?

WebAssembly is a binary format that modern browsers can execute natively.
All modern browsers include a WebAssembly engine built-in.

It allows languages other than JavaScript to run in the browser.
Blazor uses WASM to run a .NET runtime directly inside the browser.

HOW BLAZOR WEBASSEMBLY WORKS

Step-by-step boot process:

1. Browser loads index.html  (one HTML file — this is the SPA entry point)
2. Browser JS engine starts Blazor boot JS
3. Browser WASM engine initialises
4. Browser downloads:
   - dotnet.wasm     → the .NET runtime compiled to WebAssembly
   - app.wasm        → your app (in AOT mode)
   - *.dll files     → IL assemblies (your C# code)
5. Browser executes WASM code
6. .NET runtime starts
7. Your C# code runs inside the browser

Browser internals:
   Browser
   ├── JavaScript Engine   → executes .js files
   ├── WebAssembly Engine  → executes .wasm files
   │    └── .NET Runtime (WASM)
   │         └── Executes / interprets your .dll (IL) files
   └── DOM / CSS Engine    → updated via render-tree diffs

TWO EXECUTION MODES

Mode 1: Interpreter Mode (Default — most common)
   Browser → executes WASM
   WASM contains → .NET runtime
   .NET runtime → interprets IL (your DLLs) at runtime

Mode 2: AOT (Ahead-Of-Time Compiled)
   IL is compiled to WASM at build time
   Browser → executes that WASM directly (no IL interpretation at runtime)
   Result: Faster execution, but larger download size

Either way — the browser only ever executes WASM, never IL directly.

SPA MODEL

Blazor WebAssembly follows the same SPA model as React and Angular:
- The server sends ONE HTML file (index.html) — no page reloads
- The entire app (DLLs, WASM runtime, JS, CSS) downloads to the browser
- All routing and rendering happens in the browser
- Only API calls go back to the server

Routable components → act like pages (with @page "/route")
Non-routable components → act like reusable controls / widgets

DOM AND RENDERING

DOM = the browser's live tree of the page elements.

Blazor builds a virtual render tree (like React's virtual DOM).
When state changes, Blazor:
1. Computes a diff between old and new render tree
2. Updates only the changed parts of the real DOM
3. Uses JS interop when it needs to access browser-specific APIs

AUTHENTICATION WITH AZURE AD (AAD)

Blazor WebAssembly uses MSAL (Microsoft Authentication Library) to authenticate
users via Azure Active Directory (AAD).

MSAL handles:
- Login redirect to login.microsoftonline.com
- Token caching in the browser
- Silent token refresh (no manual management needed)

AAD tokens are stored in the browser and MSAL refreshes them silently.
Your app receives a valid access token whenever it calls an API.

BLAZOR vs REACT / ANGULAR

Feature          | Blazor WASM           | React / Angular
-----------------|-----------------------|-----------------------
Language         | C#                    | JavaScript / TypeScript
Runtime          | .NET via WebAssembly  | JavaScript engine
First load       | Larger (downloads .NET runtime) | Smaller
Full-stack       | Same C# for UI + API | Different language for API
Auth             | MSAL + AAD native     | JWT / OAuth libraries
Target           | .NET teams            | JS-first teams

KEY FACTS TO REMEMBER

- Blazor = C# SPA framework (runs in browser via WebAssembly)
- WASM = a binary format all modern browsers can execute
- Browser downloads: dotnet.wasm + your DLLs → C# code runs client-side
- No JavaScript needed for app logic (JS interop available when needed)
- Same SPA model as React/Angular — no full page reloads
- MSAL handles Azure AD authentication automatically
