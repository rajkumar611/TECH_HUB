SERIALIZATION AND DESERIALIZATION

WHAT IS IT?

Serialization   = Converting an object into a transferable/storable format (like JSON or XML).
Deserialization = Reconstructing the original object back from that format.

Simple analogy:
- Serialization   = packing your belongings into boxes for moving.
- Deserialization = unpacking the boxes and putting everything back.

WHY IS IT NEEDED?

Objects in memory cannot be sent over a network or stored to disk directly.
They need to be converted to a portable format first.

Without serialization, these things don't work:
- REST APIs (sending/receiving JSON)
- Microservices communication
- Saving data to disk or database
- Caching objects in Redis
- Cross-platform communication (e.g., .NET talking to Python)

"Serialization turns objects into transferable formats like JSON;
deserialization rebuilds them. Without it, APIs and microservices simply don't work."

COMMON FORMATS

- JSON  → Most common for REST APIs and web. Human-readable.
- XML   → Older, verbose. Used in SOAP, WCF, legacy systems.
- Binary → Compact, fast. Used in gRPC (Protobuf), performance-critical systems.

.NET EXAMPLE

// Object to JSON (Serialization)
string json = JsonSerializer.Serialize(customer);

// JSON to Object (Deserialization)
Customer customer = JsonSerializer.Deserialize<Customer>(json);

In ASP.NET Core, this happens automatically in controllers:
- [FromBody]  → deserializes incoming JSON request body into a C# object.
- return Ok(customer) → serializes the C# object to JSON in the response.
