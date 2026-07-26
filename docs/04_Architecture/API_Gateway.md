API GATEWAY

WHAT IS AN API GATEWAY?

An API Gateway is a single entry point for all API requests. It sits between clients
and backend services, handling routing, authentication, security, and traffic management.

Analogy: A hotel receptionist.
- Clients call the receptionist (API Gateway)
- Receptionist routes you to the right room/service
- Receptionist checks your ID (authentication)
- Receptionist enforces access rules (authorization)
- You never need to know the hotel's internal layout

KEY FUNCTIONS

1. Routing          → Directs each request to the correct backend service
2. Authentication   → Validates who is making the request
3. Authorization    → Checks if they have permission to do it
4. Rate Limiting    → Prevents abuse by limiting requests per time period
5. Logging/Auditing → Records all requests for security and debugging
6. Abstraction      → Clients don't need to know internal service endpoints

WHY AN API GATEWAY IS NEEDED

Without API Gateway:
  Client knows and calls → Service 1, Service 2, Service 3, Service 4...
  Problems: complex client code, no central security, hard to change services

With API Gateway:
  Client knows only → API Gateway
  Gateway knows     → all backend services, routing rules, auth rules
  Benefits: simple client code, central security, easy to add/remove services

TWO LEVELS OF AUTHENTICATION

Level 1 — Client ↔ API Gateway:
  - Client sends credentials to the API Gateway
  - Gateway validates the user's identity
  - Gateway issues or validates a token

Level 2 — API Gateway ↔ Backend Services:
  - After validating the user, the Gateway calls backend services
  - Gateway uses its own service-to-service credentials
  - Backend services verify the Gateway's identity

Flow:
  Client → [sends user credentials] → API Gateway
  API Gateway → [validates user, uses service credentials] → Backend Service
  Backend Service → [returns data] → API Gateway → [returns response] → Client

REAL-WORLD EXAMPLE: MICROSOFT GRAPH API

Microsoft Graph API acts as an API Gateway for all Microsoft 365 services.

Your code calls:  graph.microsoft.com/v1.0/sites/.../items
Graph API then:
  → Validates your Azure AD token
  → Checks your permissions (e.g., Sites.ReadWrite.All)
  → Routes request to SharePoint Online backend
  → Enforces rate limiting (25 requests/second)
  → Logs the request for audit

Without Graph API, you'd need to:
  - Know SharePoint's internal endpoint
  - Authenticate separately with SharePoint
  - Handle different auth formats per Microsoft 365 service

With Graph API:
  - One endpoint for all Microsoft 365 services
  - Unified Azure AD authentication
  - Works for SharePoint, Teams, OneDrive, etc.

ENTERPRISE EXAMPLE: MULTIPLE MICROSERVICES

You need customer data from 5 microservices:
  - Customer Service
  - Billing Service
  - Support Service
  - Notification Service
  - Analytics Service

Without Gateway:
  Your app calls 5 different endpoints → complex, fragile, inconsistent auth

With API Gateway:
  Your app calls: POST /v1/customer/profile
  Gateway calls all 5 services with its own credentials
  Gateway synthesizes a complete response
  Your app receives one clean, combined response

Additional gateway benefits:
  - Partial results if one service is down
  - Retry with exponential backoff
  - Centralized audit trail
  - Rate limiting per user

POPULAR API GATEWAYS

- Microsoft Graph API  → Microsoft 365 services
- Azure API Management → Azure microservices
- AWS API Gateway      → AWS services
- Kong                 → Open-source, widely used
- NGINX                → Can act as a reverse proxy / gateway

KEY FACTS TO REMEMBER

- API Gateway = single entry point for all backend services
- Handles: routing, authentication, authorisation, rate limiting, logging
- Two-level auth: user auth at gateway, service auth at backend
- Simplifies client code — client knows only one endpoint
- Microsoft Graph API is a real-world example of an API Gateway
- In microservices, the API Gateway is the front door of the entire system
