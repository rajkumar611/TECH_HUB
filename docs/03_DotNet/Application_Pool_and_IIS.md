APPLICATION POOL, IIS, AND WEB HOSTING
========================================

IIS ARCHITECTURE
-----------------

Windows Server (the machine)
   └── IIS (the web server software)
         └── Application Pools
               └── Worker Processes (w3wp.exe)

Each App Pool gets its own worker process (w3wp.exe).
Each worker process loads its own .NET runtime.
This is how different apps can run different .NET versions on the same server.


APPLICATION POOL
-----------------
An Application Pool is a logical container in IIS that isolates web apps.
- Each app runs in its own worker process (w3wp.exe).
- If one app crashes or leaks memory, others are NOT affected.
- Benefits: Isolation, security, independent configuration, independent recycling.

Request flow:
Client → IIS → Application Pool → w3wp.exe → .NET Runtime → ThreadPool → Thread executes → Response


WEB GARDEN vs WEB FARM
------------------------

Web Garden = Multiple worker processes on ONE server.
  - One machine → One IIS → One App Pool → Multiple w3wp.exe processes
  - Scales UP (uses more CPU cores on one machine)
  - CAUTION: Breaks session state and shared cache

Web Farm = Multiple servers each running IIS.
  Load Balancer → Server 1 → IIS → w3wp.exe
               → Server 2 → IIS → w3wp.exe
               → Server 3 → IIS → w3wp.exe
  - Scales OUT (more machines for load + redundancy)
  - The production standard in enterprise

One-liner: Web Garden = scale up on one machine. Web Farm = scale out across machines.


IIS EXPRESS vs IIS SERVER
--------------------------

Feature           | IIS Express          | IIS Server
------------------|----------------------|------------------------
Process           | iisexpress.exe       | w3wp.exe
Purpose           | Local development    | Production web server
Port              | localhost:5000       | 80, 443 (public)
User              | Your Windows account | Service account
Debugging         | Full support         | Not supported
Lifespan          | Runs while F5 active | Runs continuously 24/7
Errors shown      | Full stack trace     | Generic error page
Configuration     | Simple .config       | IIS Manager GUI

In development: Press F5 → iisexpress.exe starts → You debug at localhost.
In production: Code deployed → w3wp.exe runs 24/7 → Handles real user traffic.

w3wp.exe is installed once. IIS launches multiple instances (one per App Pool).
Each instance loads its own .NET runtime version.


ASYNC IN IIS
------------
Each request normally uses one ThreadPool thread.
With async, the thread is released at await, allowing the server to handle more requests.
The key to ASP.NET scalability.
