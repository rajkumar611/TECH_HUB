DESIGN PATTERNS IN C# / .NET
==============================

Design patterns are proven, reusable solutions to common software problems.
They are not code — they are blueprints for how to structure code well.


SINGLETON PATTERN
-----------------
What it is:
A class that allows only ONE instance for the entire application.

Why it exists:
To provide a single shared resource (config, logger, cache) without creating
multiple copies.

How it works:
- Private constructor   → prevents "new" from outside
- Static property       → provides global access
- Lazy initialization   → created only when first needed
- Thread-safe           → safe in multi-threaded apps

When to use:
- Logging
- Configuration
- Caching
- Database connection pool

Interview answer:
"Singleton ensures only one instance of a class exists and provides global
access to it. I use it for shared resources like logging and configuration."


DEPENDENCY INJECTION (DI)
--------------------------
What it is:
Instead of a class creating its own dependencies, it receives them from outside.

Analogy:
On your first day at work, the company gives you a laptop, access card, and
tools — you don't buy them yourself.

DI TYPES:

1. Constructor Injection (RECOMMENDED — most common)
   public class OrderService
   {
       private readonly IPaymentService _payment;

       public OrderService(IPaymentService payment)
       {
           _payment = payment;
       }
   }
   - Most testable and recommended approach.

2. Property Injection
   public class OrderService
   {
       public IPaymentService PaymentService { get; set; }
   }
   - Used for optional dependencies.
   - Risk: object may be in an invalid state if property not set.

3. Method Injection
   public void Checkout(IPaymentService paymentService) { ... }
   - Dependency is passed only when the method is called.
   - Used when dependency is needed in just one method.

4. Interface Injection (Rare)
   - Dependency injected via a method defined in an interface.
   - Not supported by ASP.NET Core DI natively.

Interview answer:
"DI injects dependencies instead of creating them. I mainly use constructor
injection — it's the most testable and recommended. I also know property,
method, and interface injection for specific scenarios."


FACTORY PATTERN
----------------
What it is:
A pattern that centralises object creation logic and hides complexity.

Why it exists:
- Avoids "new" scattered everywhere
- Makes adding new types easy (Open/Closed Principle)
- Encapsulates creation logic in one place

Simple example:
   public interface IAnimal { void Speak(); }
   public class Dog : IAnimal { public void Speak() => Console.WriteLine("Woof!"); }
   public class Cat : IAnimal { public void Speak() => Console.WriteLine("Meow!"); }

   public static class AnimalFactory
   {
       public static IAnimal Create(string type) =>
           type switch
           {
               "Dog" => new Dog(),
               "Cat" => new Cat(),
               _ => throw new ArgumentException("Unknown animal")
           };
   }

Real-world example:
   NotificationFactory.Create("SMS")  → returns SmsNotification
   NotificationFactory.Create("Email") → returns EmailNotification

Interview answer:
"Factory Method encapsulates object creation and returns different
implementations based on input. It removes scattered 'new' statements and
makes the system extensible."


ADAPTER PATTERN
----------------
What it is:
Converts one interface into another so incompatible systems can work together.

Analogy:
A power plug adapter lets a US device work in a UK socket.

When to use:
- Integrating legacy systems
- Using third-party APIs that don't match your interface
- Avoiding rewrites of old code

Example:
   // Your app expects this:
   public interface INewPaymentGateway { void MakePayment(decimal amount); }

   // But you only have this legacy class:
   public class LegacyPaymentSystem
   {
       public void ProcessPaymentInXml(decimal amount) { ... }
   }

   // Adapter bridges the gap:
   public class PaymentAdapter : INewPaymentGateway
   {
       private readonly LegacyPaymentSystem _legacy;
       public PaymentAdapter(LegacyPaymentSystem legacy) { _legacy = legacy; }
       public void MakePayment(decimal amount) => _legacy.ProcessPaymentInXml(amount);
   }

Interview answer:
"Adapter converts one interface into another so incompatible systems can work
together. I use it when integrating legacy or third-party APIs without modifying
them."

10-second memory trick:
Adapter = Make things COMPATIBLE
Facade  = Make things SIMPLE


REPOSITORY PATTERN
-------------------
What it is:
Abstracts database operations behind a clean interface so business logic
never talks directly to EF Core or SQL.

Why it exists:
- Keeps business logic clean and focused
- Makes unit testing easy (mock the repository)
- Allows switching databases without changing business code

Structure:
   Interface:   ICustomerRepository   ← business layer depends on this
   Implementation: CustomerRepository ← handles EF Core internally

Example:
   public interface ICustomerRepository
   {
       Customer GetById(int id);
       void Add(Customer customer);
       void Delete(int id);
   }

   public class CustomerRepository : ICustomerRepository
   {
       private readonly AppDbContext _context;
       // ... uses EF Core internally
   }

   // Register in DI:
   services.AddScoped<ICustomerRepository, CustomerRepository>();

   // Business layer only knows the interface:
   public class CustomerService
   {
       private readonly ICustomerRepository _repo;
       // ... calls _repo.Add(), never touches EF Core
   }

Visual flow:
   Business Layer (Service) → Interface → Repository Implementation → Database

Interview answer:
"Repository abstracts data access behind an interface so business logic stays
clean and testable. It hides EF Core/SQL and supports loose coupling."


FACADE PATTERN
---------------
What it is:
Provides one simple interface to a complex subsystem.

Analogy:
Instead of talking to 10 different departments in a company, you talk to one
relationship manager who coordinates everything.

Note: "Interface" here means a simplified entry point — NOT necessarily a
C# interface keyword.

Example:
   // Complex subsystems:
   FraudCheckService.Validate()
   WalletService.Deduct(amount)
   BankService.Transfer(amount)
   NotificationService.SendReceipt()

   // Facade hides all of this:
   public class PaymentFacade
   {
       public void MakePayment(decimal amount)
       {
           _fraud.Validate();
           _wallet.Deduct(amount);
           _bank.Transfer(amount);
           _notify.SendReceipt();
       }
   }

   // Caller just does:
   payment.MakePayment(500);

Interview answer:
"Facade provides a simple interface to a complex subsystem. I use it to hide
multiple service calls behind one clean method, improving readability and
reducing coupling."


STRATEGY PATTERN
-----------------
What it is:
Defines a family of algorithms and lets you swap between them at runtime.

Analogy:
Travelling from Chennai to Bangalore — destination is the same but you choose
the strategy: Car, Bus, Train, or Flight.

Why it exists:
- Eliminates long if/else or switch blocks
- Makes adding new algorithms easy (Open/Closed Principle)
- Lets logic be swapped dynamically

Example:
   public interface IPaymentStrategy { void Pay(decimal amount); }

   public class CreditCardPayment : IPaymentStrategy { ... }
   public class UpiPayment        : IPaymentStrategy { ... }
   public class PaypalPayment     : IPaymentStrategy { ... }

   public class PaymentContext
   {
       private IPaymentStrategy _strategy;
       public void SetStrategy(IPaymentStrategy strategy) { _strategy = strategy; }
       public void MakePayment(decimal amount) => _strategy.Pay(amount);
   }

   // Usage:
   context.SetStrategy(new CreditCardPayment());
   context.MakePayment(500);

   context.SetStrategy(new UpiPayment());
   context.MakePayment(300);

Interview answer:
"Strategy lets me swap algorithms at runtime. Instead of big if-else blocks, I
define multiple strategies and let the context choose one dynamically."


QUICK REFERENCE
----------------
Pattern     | What it does                          | Key benefit
------------|---------------------------------------|----------------------------
Singleton   | One instance for the whole app        | Shared resource management
DI          | Inject dependencies from outside      | Loose coupling, testability
Factory     | Centralise object creation            | Extensibility, no scattered "new"
Adapter     | Bridge incompatible interfaces        | Legacy/third-party integration
Repository  | Abstract database behind interface    | Clean business logic, testability
Facade      | Simplify a complex subsystem          | Readability, reduced coupling
Strategy    | Swap algorithms at runtime            | Flexible, avoids if/else chains
