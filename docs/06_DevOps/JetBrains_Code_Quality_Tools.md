JETBRAINS .NET CODE QUALITY TOOLS
===================================

OVERVIEW
---------
JetBrains provides four specialised tools for .NET developers that work with Visual Studio
(as extensions) or as standalone tools:

- ReSharper   → Code analysis and refactoring
- dotCover    → Test coverage measurement
- dotPeek     → Assembly decompiler
- dotMemory   → Memory profiler

One-liner summary:
"ReSharper improves code quality, dotCover measures test coverage, dotPeek decompiles
assemblies, and dotMemory analyses memory usage."


RESHARPER
----------
What it is:
ReSharper is a Visual Studio productivity extension for .NET developers.
It provides advanced code analysis, refactoring, navigation, and code generation.

Key features:
- Detects code smells, bugs, and anti-patterns in real time
- Suggests fixes and improvements as you type
- Supports bulk refactoring (rename, extract method, introduce variable, etc.)
- Enforces coding standards across the whole team
- Code navigation: quickly jump to usages, implementations, declarations
- Generates boilerplate code automatically

When to use:
Any .NET project where code quality and developer productivity matter.
Especially valuable in large teams to maintain consistent code standards.


DOTCOVER
---------
What it is:
dotCover is a .NET code coverage tool that measures how much of your source code
is executed by your unit tests.

Key features:
- Shows coverage percentage per file, class, and method
- Highlights which lines of code are NOT covered by tests (in red)
- Integrates with Visual Studio and CI/CD pipelines (Azure DevOps, TeamCity)
- Can enforce minimum coverage thresholds in the build pipeline
- Identifies gaps in testing — helps you write more effective tests

Coverage percentages:
- 0%–50%: low coverage — most code is untested
- 50%–80%: moderate — some key paths may be missing
- 80%–100%: high — most production paths are tested

When to use:
Any project with unit tests where you want to measure and enforce test quality.


DOTPEEK
--------
What it is:
dotPeek is a .NET decompiler that converts compiled DLLs and EXEs back into readable
C# code.

Key features:
- Decompiles .NET assemblies without needing the original source code
- Lets you read classes, methods, logic from third-party or vendor libraries
- Can inspect IL (Intermediate Language) and metadata
- Helps debug libraries when source code is not available
- Useful for understanding how a framework or library works internally

When to use:
- Investigating a third-party library's behaviour
- Debugging a compiled DLL with no source available
- Reverse-engineering legacy code where source was lost

dotPeek vs .NET Reflection:
  dotPeek = external decompiler, shows SOURCE CODE from binaries
  .NET Reflection = built-in API, inspects METADATA at runtime (inside running app)

dotPeek vs .NET Reflector:
  Both decompile .NET binaries. .NET Reflector is a third-party commercial tool (by Red Gate).
  dotPeek is free, made by JetBrains.


DOTMEMORY
----------
What it is:
dotMemory is a .NET memory profiler that analyses memory usage and detects memory leaks.

Key features:
- Shows memory consumption over time (heap size, GC pressure)
- Identifies objects that are consuming the most memory
- Shows object retention paths — why an object is still in memory (not GC'd)
- Detects memory leaks: objects that grow without bound
- Analyses garbage collection behaviour (Gen 0, 1, 2 collections)

Common use cases:
- High memory usage in production → run dotMemory to find the cause
- OOM (OutOfMemoryException) investigation
- Verifying memory is released after large operations (file uploads, batch processing)

When to use:
Any time an application consumes more memory than expected, or when you need to
verify that objects are being properly released.


COMPARISON SUMMARY
-------------------
Tool        | What it analyses       | When to use
------------|------------------------|----------------------------------
ReSharper   | Source code quality    | During development — improve code
dotCover    | Test coverage          | During CI — ensure tests are thorough
dotPeek     | Compiled binaries      | When you need to read DLLs without source
dotMemory   | Memory usage and leaks | When app uses too much memory


KEY FACTS TO REMEMBER
----------------------
- All four are built by JetBrains for the .NET ecosystem
- ReSharper = code analysis and refactoring (Visual Studio extension)
- dotCover = unit test coverage measurement and enforcement
- dotPeek = free .NET decompiler — reads compiled DLLs as C# code
- dotMemory = memory profiler — finds leaks and high memory usage
- dotPeek decompiles binaries; .NET Reflection inspects metadata at runtime (different things)
