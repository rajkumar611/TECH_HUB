REST API — COMPLETE GUIDE

WHAT IS REST?

REST = Representational State Transfer.
It is an architectural style (not a technology) created by Roy Fielding in his
2000 PhD dissertation.

REST defines HOW to properly use HTTP for building web services:
- Use HTTP verbs (GET, POST, PUT, PATCH, DELETE) with clear meaning
- Use URLs as nouns (resources), not as action names
- Be stateless: each request is independent, no session on the server

Before REST, developers sent everything via POST regardless of the operation.
REST established clear rules about which HTTP method to use for which operation.

EVOLUTION OF .NET WEB SERVICE TECHNOLOGY

1. ASMX (early 2000s):
   - First way to build web services in .NET
   - Built entirely on SOAP (XML-based, verbose)
   - Legacy technology, now obsolete

2. WCF — Windows Communication Foundation (2006):
   - Protocol-agnostic: supports SOAP over HTTP, TCP, named pipes
   - Powerful but complex; configuration-heavy
   - Technically supports REST but not designed for it
   - Designed for enterprise SOAP/RPC communication

3. ASP.NET Web API (2012 onwards):
   - Built from the ground up for REST
   - Uses HTTP verbs natively, returns JSON by default
   - Minimal configuration, clean and intuitive
   - The modern standard for REST APIs in .NET

HTTP METHODS AND WHEN TO USE THEM

Method | Use for               | Idempotent? | Cacheable?
-------|-----------------------|-------------|----------
GET    | Retrieve data         | Yes         | Yes (by default)
POST   | Create / trigger action| No         | No
PUT    | Replace entire resource| Yes        | No
PATCH  | Partial update        | Yes         | No
DELETE | Delete a resource     | Yes         | No

Idempotent = calling the same operation multiple times gives the same result.
This matters when networks fail and clients retry — safe to retry PUT/DELETE.

GET:
- Use query strings for filters: GET /api/users?page=1&limit=10
- Never has a request body
- Cached automatically by browsers, CDNs, proxies → big performance benefit

POST:
- Carries data in the request body
- NOT idempotent → retrying can create duplicates

PUT:
- Replaces the ENTIRE resource — must send all fields
- If you send only some fields, the rest become null/deleted

PATCH:
- Updates ONLY the fields you send — safer and more common in practice

DELETE:
- Idempotent: deleting twice just means the resource is still gone (404 on second call)

WHY NOT USE POST FOR EVERYTHING?

1. Idempotency matters in distributed systems.
   - Load balancers and clients retry failed requests automatically.
   - If you use POST for updates, retries cause duplicate writes.
   - PUT/PATCH/DELETE are safe to retry.

2. Caching.
   - GET responses are cached by browsers, proxies, and CDNs.
   - Using POST for retrieval loses all caching benefits — every call hits the server.

3. Semantic clarity.
   - GET = retrieve. POST = create. PUT/PATCH = update. DELETE = delete.
   - Using the right verb makes APIs easy to understand and maintain.

4. Distributed systems.
   - Microservices relay requests across many hops; non-idempotent methods
     cause cascading duplicates if any hop retries.

ASP.NET CORE REST EXAMPLE

[ApiController]
[Route("customers")]
public class CustomersController : ControllerBase
{
    [HttpGet("{id}")]
    public IActionResult GetCustomer(int id)
        => Ok(new { Id = id, Name = "Raj" });

    [HttpPost]
    public IActionResult CreateCustomer([FromBody] Customer customer)
        => CreatedAtAction(nameof(GetCustomer), new { id = customer.Id }, customer);

    [HttpPut("{id}")]
    public IActionResult UpdateCustomer(int id, [FromBody] Customer customer)
        => Ok(customer);

    [HttpDelete("{id}")]
    public IActionResult DeleteCustomer(int id)
        => NoContent();
}

URL patterns:
- GET    /customers/5  → Retrieve customer 5
- POST   /customers    → Create new customer
- PUT    /customers/5  → Replace customer 5 entirely
- DELETE /customers/5  → Delete customer 5

REST vs ALTERNATIVES

Technology  | Best for                          | Transport
------------|-----------------------------------|-----------
REST        | Browsers, mobile, public APIs     | HTTP/1.1 + JSON
gRPC        | Microservice-to-microservice      | HTTP/2 + Protobuf (binary)
GraphQL     | Flexible frontend queries         | HTTP + custom query language
WebSockets  | Real-time bidirectional comms     | WS (persistent connection)

REST is still the dominant standard because:
- Simple and universally understood
- Works with every client (browser, mobile, CLI)
- Leverages HTTP caching natively
- Human-readable (JSON)

KEY FACTS TO REMEMBER

- REST = architectural style, not a technology
- ASP.NET Web API = the Microsoft framework that implements REST
- URLs should be nouns: /customers, /orders — not /getCustomer, /deleteOrder
- HTTP verbs carry the meaning of the operation
- GET is cached; POST/PUT/PATCH/DELETE are not
- PUT replaces everything; PATCH updates only what you send
- Idempotency makes distributed systems safe for retries
