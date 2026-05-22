ENTITY FRAMEWORK (EF CORE)
===========================

WHAT IS EF?
-----------
Entity Framework (EF) is Microsoft's ORM (Object-Relational Mapper) for .NET.
It lets you work with databases using C# classes instead of writing SQL manually.

ORM = maps between database tables and C# objects.
EF = the framework that manages entities (C# classes representing DB tables),
     queries them via LINQ, tracks changes, handles migrations, and manages relationships.

When EF generates SQL: LINQ queries, SaveChanges(), Insert, Update, Delete, Load relationships.
When EF does NOT generate SQL: You provide raw SQL directly.

EF supports multiple databases: SQL Server, PostgreSQL, MySQL, SQLite, CosmosDB.


CORE CONCEPTS
--------------

DbContext:
  - Represents a session with the database.
  - Contains DbSet<T> properties for each table.

DbSet<T>:
  - Represents a table (e.g., DbSet<Customer> Customers).

LINQ Query:
  - var list = db.Customers.Where(c => c.Name == "Raj").ToList();
  - EF converts this to SQL automatically.

Change Tracking:
  - EF automatically detects when you modify an entity.
  - SaveChanges() generates the UPDATE SQL and runs it.

Migrations:
  - Code-first approach: define your C# classes, then generate DB schema.
  - dotnet ef migrations add Initial → dotnet ef database update


BASIC CRUD EXAMPLE
------------------

using var db = new AppDbContext();

// INSERT
db.Customers.Add(new Customer { Name = "Raj" });
db.SaveChanges();

// READ
var customers = db.Customers.ToList();

// UPDATE
var first = db.Customers.First();
first.Name = "Raj Updated";
db.SaveChanges();

// DELETE
db.Customers.Remove(first);
db.SaveChanges();


RAW SQL (when you want full control)
--------------------------------------
var list = db.Customers
    .FromSqlRaw("SELECT * FROM Customers WHERE Name LIKE 'R%'")
    .ToList();

db.Database.ExecuteSqlRaw("UPDATE Customers SET Name = 'Updated'");


RELATIONSHIPS
-------------
EF handles one-to-many using navigation properties.
db.Customers.Include(c => c.Orders).ToList();
EF generates a JOIN query automatically.


ALTERNATIVES TO EF
-------------------
- Dapper       → Micro-ORM; you write SQL manually, Dapper maps the results. Very fast.
- NHibernate   → Full ORM, mature and powerful.
- LLBLGen Pro  → Enterprise ORM.
- Prisma       → Modern ORM for Node.js / TypeScript (similar to EF for .NET).


BOTTOM LINE
-----------
EF = write less SQL, work with C# objects, benefit from LINQ and type safety.
Dapper = write your own SQL, get maximum control and performance.
Choose EF for rapid development. Use Dapper for complex or performance-sensitive queries.
