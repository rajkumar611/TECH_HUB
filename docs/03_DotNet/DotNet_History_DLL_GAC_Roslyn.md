DOTNET HISTORY — DLL HELL, GAC, ROSLYN, AND GC
================================================

DLL HELL
---------
In the VB6/COM era, DLLs were stored in System32 and shared by ALL applications.
Installers could overwrite a shared DLL with a different version.
Result: Installing App A could break App B. This was "DLL Hell."

COM (Component Object Model):
- Microsoft's pre-.NET component model.
- COM DLLs lived in System32 with no versioning.
- One app could overwrite a DLL used by another = the origin of DLL Hell.


SOLUTION 1: GAC (Global Assembly Cache) — .NET Framework
---------------------------------------------------------
.NET Framework solved DLL Hell with the GAC:
- Strong-named assemblies (signed with a cryptographic key).
- Multiple versions of the same DLL could live side-by-side in the GAC.
- Apps could specify exactly which version they needed.

Downsides:
- Complex deployment (required admin rights to install to GAC).
- Not cross-platform.
- Still machine-wide — shared between all apps.


SOLUTION 2: Per-App Isolation — .NET Core
------------------------------------------
.NET Core removed the GAC entirely.
Each app now carries its OWN copy of all DLLs inside its own folder.
No shared DLLs = no conflicts = DLL Hell eliminated.

Benefits:
- No admin rights needed.
- Multiple versions of the same app can run side-by-side.
- Cross-platform (Windows, Linux, Mac).
- Fully isolated per application.


ROSLYN COMPILER
----------------
Roslyn is the modern, open-source C# and VB.NET compiler.

The old compiler was a closed black box that:
- Couldn't support modern IDE tooling.
- Couldn't support analyzers, refactoring, live diagnostics.
- Couldn't evolve fast enough for new C# features.

Roslyn made the compiler:
- Open and extensible (you can write custom analyzers).
- IDE-friendly (powers IntelliSense, refactoring, live errors in Visual Studio).
- Fast and modern.

Roslyn converts C# → Intermediate Language (IL).
IL can be executed by CLR (.NET Framework) or CoreCLR (.NET Core/5+).
The IL is runtime-agnostic.


GARBAGE COLLECTOR (GC)
-----------------------
.NET's Garbage Collector automatically manages memory.
- Allocates memory for objects.
- Frees memory when objects are no longer referenced.
- Runs in background threads without developer involvement.

GC has improved significantly in each .NET release:
- Better throughput and lower pauses.
- Server GC mode for high-performance apps.
- Generation-based collection (Gen 0, 1, 2).

Developer benefit: No manual memory management (unlike C or C++).


MODULAR ARCHITECTURE (.NET Core)
---------------------------------
Old .NET Framework: Loads ALL assemblies at startup = heavy.
.NET Core onwards: Load only what you need via NuGet packages = lightweight.

Think of it like a buffet: take only what you need.
This makes .NET Core apps smaller and faster.


LATENCY
--------
Latency = delay before something starts.
- Low latency = fast, responsive (what we want).
- High latency = slow, laggy.

In .NET: Async I/O, GC optimizations, and modular loading all help reduce latency.


NAS
----
NAS = Network Attached Storage.
A dedicated file storage device connected to a network, accessible by multiple machines.
