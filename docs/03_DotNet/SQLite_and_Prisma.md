SQLITE AND PRISMA
==================

SQLITE
-------
What it is:
SQLite is a lightweight, file-based relational database that lives inside your
application itself. It does NOT need a separate database server.

Key characteristics:
- The entire database is stored in a single .db file on disk
- No installation, no server, no configuration needed
- Runs in-process with your application
- Supports standard SQL

When to use SQLite:
- Small apps, prototypes, and local tools
- Mobile apps (iOS, Android — SQLite is built in)
- Offline-capable apps
- Unit testing (fast, disposable in-memory databases)
- Desktop apps (Electron, WPF, MAUI)

When NOT to use SQLite:
- High-concurrency applications (many simultaneous writes)
- Large-scale production APIs
- Applications requiring advanced database features (stored procs, replication)

In .NET:
SQLite is supported via Entity Framework Core with the Microsoft.EntityFrameworkCore.Sqlite
package. You write the same EF code — EF just targets a .db file instead of SQL Server.

   // EF Core with SQLite
   optionsBuilder.UseSqlite("Data Source=myapp.db");


PRISMA
-------
What it is:
Prisma is a modern, strongly-typed ORM for Node.js and TypeScript.
Think of it as the equivalent of Entity Framework Core — but for the JavaScript/
TypeScript world.

What Prisma does:
- Generates SQL automatically from your data models
- Manages database migrations
- Provides a clean, type-safe API for querying data
- Supports: PostgreSQL, MySQL, SQLite, SQL Server, MongoDB, CockroachDB

How it works:
1. Define your data model in schema.prisma
2. Run "npx prisma migrate dev" → Prisma creates the database tables
3. Use PrismaClient in your code to query the database

Example schema.prisma:
   model Customer {
     id    Int    @id @default(autoincrement())
     name  String
     email String @unique
   }

Example TypeScript query:
   const customers = await prisma.customer.findMany();
   const newCustomer = await prisma.customer.create({
     data: { name: "Raj", email: "raj@example.com" }
   });

Prisma vs EF Core comparison:
   Feature            | EF Core (.NET)        | Prisma (Node.js / TS)
   -------------------|-----------------------|------------------------
   Language           | C#                    | TypeScript / JavaScript
   Schema definition  | C# classes + data annotations | schema.prisma file
   Migrations         | dotnet ef migrations  | prisma migrate dev
   Query style        | LINQ                  | prisma.model.findMany()
   Type safety        | Yes                   | Yes
   Supported DBs      | SQL Server, PG, MySQL, SQLite | PG, MySQL, SQLite, SQL Server, MongoDB


SQLITE + PRISMA TOGETHER
-------------------------
SQLite is commonly used with Prisma in:
- Local development (fast, no server setup)
- Prototypes
- Serverless environments (e.g., Cloudflare D1)

   // schema.prisma with SQLite
   datasource db {
     provider = "sqlite"
     url      = "file:./dev.db"
   }


SUMMARY
--------
- SQLite = file-based database, no server needed, great for local/small-scale apps
- Prisma = modern ORM for Node.js/TypeScript, equivalent to EF Core in .NET
- Together, they offer a fast, zero-config database setup for JavaScript apps
