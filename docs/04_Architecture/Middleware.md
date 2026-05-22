MIDDLEWARE
===========

WHAT IS MIDDLEWARE?
--------------------
Middleware is a software layer that sits between two systems, processes a request
(or response), and then PASSES IT FORWARD to the next layer.

Key distinction:
- Middleware: processes and PASSES FORWARD → not the final destination
- API Endpoint: processes and RETURNS a response → IS the final destination

Analogy — Post Office:
You send a letter. It doesn't go directly to the recipient.
The post office (middleware) checks the address, sorts it, logs it, and passes it
to the delivery person. The post office doesn't deliver the letter itself.

Analogy — Bank:
You want to withdraw money. The teller is your destination (API endpoint).
Before you reach the teller:
- Security guard checks your ID (authentication middleware)
- Desk checks your account access (authorization middleware)
Both layers process and pass you forward — they don't withdraw money.


TYPES OF MIDDLEWARE
--------------------
1. Authentication Middleware
   - Checks if the request has a valid token or credentials
   - If valid: adds user identity to the request and passes it forward
   - If invalid: stops the request and returns 401 Unauthorized
   - Does NOT handle business logic

2. Authorization Middleware
   - Checks if the authenticated user has permission to do what they're asking
   - If authorized: passes request forward
   - If not: stops the request and returns 403 Forbidden

3. Logging Middleware
   - Records that the request happened (timestamp, user, endpoint, status)
   - Always passes the request forward (never blocks)

4. Rate Limiting Middleware
   - Counts how many requests a user/IP has made in a time window
   - If within limit: passes forward
   - If exceeded: stops with 429 Too Many Requests

5. API Gateway (as middleware)
   - Sits between client and many backend services
   - Validates auth, routes requests, enforces rules, logs
   - Then routes to the correct backend service
   - The gateway itself is middleware — it doesn't do the business work


WHY REGULAR API ENDPOINTS ARE NOT MIDDLEWARE
---------------------------------------------
An API endpoint like GET /customers/5 receives the request, handles it completely,
and returns the data. The request ENDS there.

Middleware's defining trait: it passes requests forward.
Endpoint's defining trait: it handles requests completely.

Authentication, API Gateways, and logging layers are middleware.
User endpoints, product endpoints, and business logic handlers are NOT middleware.


ASP.NET CORE MIDDLEWARE PIPELINE
----------------------------------
In ASP.NET Core, middleware is registered in Program.cs and forms a pipeline.
Each request passes through all middleware layers before reaching the endpoint.

Request arrives
  → Logging Middleware (logs the request)
  → Authentication Middleware (validates token)
  → Authorization Middleware (checks permissions)
  → Rate Limiting Middleware (checks request count)
  → Your Endpoint (processes business logic, returns response)
  ← Response travels back through the pipeline

Key principle: ORDER MATTERS.
Authentication must come before authorization.
Logging should come first to capture all requests.

Example in ASP.NET Core Program.cs:
  app.UseAuthentication();  // Must come before UseAuthorization
  app.UseAuthorization();
  app.MapControllers();     // Actual endpoints


MIDDLEWARE vs API GATEWAY
--------------------------
Both are middleware in the conceptual sense, but at different scales:

Middleware in a single app:
  - Layers within one application's request pipeline
  - Examples: auth, logging, rate limiting in your ASP.NET Core app

API Gateway (as system-level middleware):
  - Sits between clients and multiple backend services
  - Routes requests to the correct service
  - Centralised auth, logging, rate limiting across all services


KEY FACTS TO REMEMBER
----------------------
- Middleware = processes request and passes it forward (not the final destination)
- Endpoint = handles the request completely (is the final destination)
- Authentication, authorization, logging, rate limiting = middleware
- Business logic endpoints = NOT middleware
- ASP.NET Core uses a middleware pipeline: order of registration matters
- API Gateway is "middleware at the system level" — sits between clients and services
