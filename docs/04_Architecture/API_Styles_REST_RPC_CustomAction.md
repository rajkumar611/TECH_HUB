API STYLES: REST, RPC, AND CUSTOM ACTION
==========================================

These are three different styles for designing API endpoints.
They are styles (design choices), not different technologies.
ASP.NET Web API can implement all three — the style depends on how YOU design the URLs.


1. REST — Resource-Based
--------------------------
URL represents a RESOURCE (a noun).
HTTP verbs (GET/POST/PUT/DELETE) carry the meaning of the operation.

Pattern: /resource/{id}

Examples:
  GET    /customers/5       → Retrieve customer 5
  POST   /customers         → Create new customer
  PUT    /customers/5       → Update customer 5
  DELETE /customers/5       → Delete customer 5

Rule: URLs are nouns. Verbs come from HTTP methods.


2. RPC — Remote Procedure Call (Method-Based)
----------------------------------------------
URL represents an OPERATION NAME — like calling a function on the server.
The URL IS the method name.

Pattern: /OperationName  (often PascalCase)

Examples:
  GET    /GetCustomerDetails
  POST   /CreateCustomer
  PUT    /UpdateCustomerDetails
  DELETE /DeleteCustomer

The C# method name may or may not match the URL — what matters is the URL.

Used in: WCF, SOAP, gRPC, XML-RPC, and when developers design URLs as function names.

Rule: URLs look like function names. Client is "calling a function".


3. Custom Action — Business Action
------------------------------------
URL represents a BUSINESS OPERATION — a verb phrase.
Used when an action doesn't cleanly map to a standard CRUD operation.

Pattern: /domain/action-name  (kebab-case, lowercase)

Examples:
  POST   /billing/recalculate
  POST   /billing/run-end-of-day
  POST   /billing/apply-discount
  POST   /billing/retry-failed-payments
  POST   /claims/approve
  POST   /policies/renew

Rule: URLs are business verbs. They describe what the system does.


COMPARISON TABLE
-----------------
Style         | URL style          | URL example               | Client perspective
--------------|--------------------|---------------------------|--------------------
REST          | Nouns              | /customers/5              | "Give me this resource"
RPC           | PascalCase methods | /GetCustomerDetails       | "Call this function"
Custom Action | kebab-case verbs   | /billing/recalculate      | "Perform this operation"


MEMORY TRICK
-------------
REST          → nouns
RPC           → technical method names
Custom Action → business verbs


WHY THIS MATTERS
-----------------
Web API is just a framework — the style depends on how you design URLs.
A single Web API project can have a mix of all three styles:
- CRUD resources → use REST style
- Simple lookups → might drift into RPC style
- Business processes → use Custom Action style

Microservices ≠ an API style.
Microservices define how you STRUCTURE your system (independent deployable services).
REST/RPC/Custom Action define how you DESIGN your endpoints within those services.
A microservice can expose REST endpoints, RPC endpoints, Custom Action endpoints, or all three.


REAL-WORLD GUIDANCE
--------------------
Use REST when:     You're doing CRUD operations on well-defined resources.
Use RPC when:      You're integrating with legacy systems or using gRPC/SOAP.
Use Custom Action: When a real business operation doesn't fit GET/POST/PUT/DELETE.
                   Example: approving a claim, renewing a policy, recalculating a quote.
