ASYNC / AWAIT IN C#
====================

WHAT IS ASYNC/AWAIT?
---------------------
Async/await is a non-blocking programming model in C#.
- "async" marks a method as asynchronous and allows "await" inside it.
- "await" tells the compiler where the method can pause without blocking a thread.
- The method returns a Task (or Task<T>) to represent the ongoing operation.

Key rule: async does NOT make a method run on another thread.
It RELEASES a thread during I/O waits, allowing it to be reused.


TASK vs TASK<T>
---------------
- Task         → async method with no return value ("I will finish later")
- Task<T>      → async method that returns a value ("I will finish later and give you a T")
- async void   → fire-and-forget; ONLY for UI event handlers. Never use in server code.

Examples:
async Task DoWorkAsync()              // no return value
async Task<int> GetNumberAsync()      // returns int
async Task<string> GetDataAsync()     // returns string


WHEN IS ASYNC USEFUL?
---------------------
Async is ONLY useful for I/O-bound work — places where your code is WAITING.

Async IS useful for:          | Async is NOT useful for:
------------------------------|----------------------------------
HTTP / REST API calls          | CPU loops and heavy calculations
Database queries (EF, SQL)    | Image/video/audio processing
File read/write operations    | Encryption / compression
Message queues (Kafka, SB)    | In-memory sorting or filtering
Cloud storage (Blob, S3)      | Machine learning inference
Socket/WebSocket operations    | Anything not waiting on I/O
Task.Delay / timers            |


WHY ASYNC MATTERS FOR SCALABILITY (ASP.NET Core)
-------------------------------------------------
Without async (blocking):
- Each request uses one thread for the entire duration.
- Thread sits idle while waiting for DB/API (e.g., 500ms).
- 1000 requests = 1000 threads → ThreadPool exhaustion.

With async (non-blocking):
- Thread is released at the await point.
- Thread goes back to the pool to handle other requests.
- Same 1000 requests can be handled with only 20-30 threads.
→ Async gives massive scalability improvement for server apps.


ASYNC BEHAVIOR ACROSS APP TYPES
---------------------------------

Console App:
- No SynchronizationContext.
- After await, continuation runs on any ThreadPool thread.
- Async is mostly about responsiveness (not scalability).

ASP.NET (Framework):
- Has SynchronizationContext.
- At await, worker thread is freed.
- Continuation tries to resume on same request thread.
- DANGER: Calling .Result or .Wait() causes DEADLOCKS.

ASP.NET Core:
- Old SynchronizationContext removed.
- Continuations run on ThreadPool threads (like Console).
- Worker thread still freed at await → huge scalability.
- No .Result deadlock, but still bad practice to block.


CPU-BOUND WORK → USE TASK.RUN
-------------------------------
For CPU-bound work (calculations, encryption), use Task.Run:
    await Task.Run(() => HeavyCPUWork());

This offloads to a ThreadPool thread (parallel execution),
while async/await just releases threads during I/O waits.


INTERVIEW ONE-LINERS
--------------------
"Async allows the server to handle more requests with fewer threads by releasing the worker thread during I/O waits."
"Async is for waiting. Task.Run is for computing."
"Async creates a state machine at compile time. It doesn't create threads."
