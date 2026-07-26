MONOLITHIC VS MICROSERVICES ARCHITECTURE

MONOLITHIC ARCHITECTURE

What it is:
All components of an application are bundled into a single deployable unit — one big DLL
or one big process.

Characteristics:
- One codebase, one deployment package
- All features (UI, business logic, data access) in the same application
- Scaling means scaling the whole application, not just one feature
- Simple to develop initially, but harder to maintain as it grows

When it works well:
- Small applications or startups with a small team
- Early-stage projects where requirements are still evolving
- Simple, low-traffic apps

Challenges at scale:
- One bug in one part can take down the whole app
- Slow deployment — changing one feature requires re-deploying everything
- Hard to scale specific bottlenecks independently
- Technology lock-in — the whole app must use the same tech stack

MICROSERVICES ARCHITECTURE

What it is:
The application is split into many small, independent services. Each service owns a
single business capability and can be deployed, scaled, and updated independently.

"A microservice is a small, independently running application that owns a single
business capability."

Key characteristics:
- Each service is its own running process with its own API endpoint
- Services communicate over the network (REST, gRPC, message queues)
- Each service can have its own database and technology stack
- Services can be deployed, scaled, and versioned independently
- Failure in one service does not bring down others

A DLL by itself is NOT a microservice:
  OrderService.dll alone → cannot run, cannot listen on a port → NOT a microservice
  OrderService.dll hosted by Kestrel → runs as a process, exposes /api/orders → IS a microservice

A microservice can have multiple endpoints/classes as long as they all belong to
the same business capability.

COMPARISON

Feature               | Monolithic              | Microservices
----------------------|-------------------------|---------------------------
Deployment            | One big package         | Many independent services
Scaling               | Scale the whole app     | Scale individual services
Failure impact        | One failure = whole app | Failure isolated to one service
Team structure        | One team, one codebase  | Separate teams per service
Technology            | One stack for all       | Each service can use different stack
Development speed     | Fast at start           | Faster at scale
Complexity            | Low initially           | Higher (networking, observability)
Best for              | Small/simple apps       | Large, complex, high-scale apps

HOW MICROSERVICES COMMUNICATE

- REST (HTTP/JSON)   → browser-facing or simple service calls
- gRPC               → high-performance internal service-to-service calls
- Message queues     → async, decoupled communication (e.g., Azure Service Bus, Kafka)
- SignalR            → real-time push to browsers

API STYLES IN MICROSERVICES

Microservices do NOT define the API style.
A microservice can expose REST, RPC, or Custom Action endpoints — or a mix.

REST/RPC/Custom Action = how you design your endpoints
Microservices          = how you structure your system

KEY FACTS TO REMEMBER

- Monolithic = one big app deployed together; simple to start, harder at scale
- Microservices = many small independent services; complex to build, but scalable
- A DLL is NOT a microservice — it must be hosted and running as an independent process
- Each microservice should own one business capability
- Services communicate via REST, gRPC, or messaging — never shared databases
- Microservices are the standard for large, enterprise-scale cloud applications
