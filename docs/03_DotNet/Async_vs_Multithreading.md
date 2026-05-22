ASYNC vs MULTITHREADING IN C#
==============================

CORE DIFFERENCE
---------------
Multithreading = using MORE threads to do MORE work at the same time.
Async/Await    = releasing threads so they can do OTHER work while WAITING.

They solve different problems.


MULTITHREADING
--------------
- You create multiple threads that run simultaneously.
- CPU runs multiple pieces of code in parallel.
- Good for: CPU-bound work (calculations, encryption, image processing).
- NOT good for: I/O-bound work (waiting on network, disk, DB).

Simple example:
Thread t1 = new Thread(() => DoWork());
Thread t2 = new Thread(() => DoWork());
t1.Start(); t2.Start();
t1.Join(); t2.Join(); // Wait for both to finish


ASYNC / AWAIT
-------------
- Does NOT create new threads.
- Releases the current thread during I/O waits.
- Good for: I/O-bound work (API calls, DB queries, file I/O).
- NOT good for: CPU-bound work (the CPU stays busy, no release happens).

Example:
string result = await httpClient.GetStringAsync(url); // thread released here


FEATURE COMPARISON
-------------------

Feature                  | Multithreading       | Async/Await
-------------------------|----------------------|----------------------
Uses multiple threads     | Yes                  | No (during I/O wait)
Creates new threads       | Often                | Never
Good for CPU work         | Yes                  | No
Good for I/O work         | No                   | Yes
Improves scalability      | Moderate             | Huge (web servers)
Improves responsiveness   | Sometimes            | Always (UI apps)
Releases threads          | No                   | Yes


JOIN() vs AWAIT
---------------
Join() blocks the current thread until another thread finishes.
    → Synchronous waiting.
    → Main thread sits idle.

Await pauses the method without blocking the thread.
    → Thread is freed to do other work.
    → Method resumes when I/O completes.


PARALLELISM vs MULTITHREADING
------------------------------
Multithreading = creating and scheduling multiple threads (not limited by CPU cores).
Parallelism = running multiple threads AT THE SAME TIME (limited by CPU cores).

On a 4-core CPU:
- You can CREATE 1000 threads (multithreading).
- But only 4 can run simultaneously (parallelism).
- The OS schedules them using context switching.

Parallel.For and Parallel.ForEach use ThreadPool threads for CPU-bound parallel work.


COMBINING BOTH
--------------
You can use both together:
    await Task.Run(() => HeavyCPUWork());

- Task.Run → sends CPU work to a ThreadPool thread (multithreading).
- await → keeps the calling method non-blocking (async).


SUMMARY
-------
Multithreading: "I need more threads to do more work."
Async: "I don't need a thread right now because I'm just waiting."
