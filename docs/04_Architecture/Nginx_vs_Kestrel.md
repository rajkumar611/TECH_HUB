NGINX vs KESTREL

WHY TWO SERVERS?

Before .NET Core, one server (IIS) handled everything: hosting, security, routing,
SSL, and running .NET code. One server was enough.

With .NET Core, Microsoft split the responsibility:
- Kestrel = application server (runs your .NET code)
- Nginx/IIS = front-door server (handles the internet)

They do DIFFERENT jobs and complement each other.

KESTREL

What it is:
Kestrel is the built-in, cross-platform, lightweight HTTP server included with
ASP.NET Core. It is the application server that runs your .NET code.

Key characteristics:
- Runs inside your application process (dotnet.exe)
- Built for speed, async I/O, and cross-platform hosting
- Uses the .NET ThreadPool to handle requests
- Created to enable .NET apps to run on Linux, macOS, and in Docker/containers
- Default HTTP server for all ASP.NET Core apps

Kestrel IS designed for:
- Parsing HTTP requests
- Executing middleware pipeline
- Running your .NET application logic
- Async I/O using .NET's async/await

Kestrel is NOT designed for:
- SSL/TLS termination and certificate management
- Load balancing across multiple app instances
- Handling millions of concurrent connections
- DDoS protection
- URL rewriting and caching
- Hosting multiple sites on port 80/443
- Serving static files efficiently

Why not expose Kestrel directly to the internet?
Kestrel lacks the hardened, edge-level capabilities needed for production internet traffic.
In production, Kestrel should always sit behind a reverse proxy.

NGINX

What it is:
Nginx (pronounced "engine-x") is a high-performance, cross-platform web server and
reverse proxy. It is the front-door server for your application.

Key characteristics:
- Event-driven, asynchronous, non-blocking architecture
- A small number of worker processes each handle tens of thousands of connections
- Does NOT tie one thread per request (unlike old IIS)
- Extremely efficient at handling high concurrency
- Cloud-native, widely used in Kubernetes and containers

Nginx IS designed for:
- Terminating SSL/TLS (handles certificates)
- Load balancing across multiple Kestrel instances
- URL rewriting, caching, compression
- Serving static files (HTML, CSS, JS, images)
- Security filtering and DDoS protection
- Hosting multiple sites on port 80/443
- Acting as a reverse proxy for any backend (not just .NET)

When Nginx receives a request:
- It handles SSL termination, security checks, and routing
- Then forwards the request to Kestrel (your .NET app)
- Kestrel processes the business logic and returns the response
- Nginx sends the response back to the client

IIS vs NGINX

Feature          | IIS                              | Nginx
-----------------|----------------------------------|----------------------------------
Platform         | Windows only                     | Cross-platform (Linux, Windows, Mac)
Architecture     | Thread-pool (one thread/request) | Event-driven (non-blocking I/O)
Primary use      | ASP.NET Framework hosting        | Reverse proxy, high-concurrency apps
Concurrency      | Good (with async)                | Excellent
Kubernetes use   | Rare                             | Very common
Admin interface  | IIS Manager GUI                  | Config files

IIS can also act as a reverse proxy for ASP.NET Core with the IIS integration module.
But Nginx is preferred in Linux, cloud, and containerised environments.

THE MODERN PRODUCTION ARCHITECTURE

Old .NET Framework:
  Client → IIS → ASP.NET Framework App
  (IIS did everything)

Modern .NET Core / .NET 5+:
  Client → Nginx (or IIS) → Kestrel → ASP.NET Core App

  Nginx/IIS: front-door layer (SSL, security, routing, load balancing)
  Kestrel:   application layer (business logic, middleware, .NET code)

SUMMARY

Server   | Role                          | Designed for
---------|-------------------------------|-----------------------------------
Kestrel  | Application server            | Running .NET code, async I/O
Nginx    | Reverse proxy / edge server   | SSL, routing, load balancing, security
IIS      | Windows reverse proxy / host  | ASP.NET Framework, Windows enterprise

One-liner:
Nginx/IIS handles the internet. Kestrel runs your app. You need both because they
have different responsibilities.
