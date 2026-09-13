HARDWARE AND STORAGE
=====================

SSD vs HDD
-----------
HDD (Hard Disk Drive):
- Traditional spinning magnetic disk
- Mechanical read/write heads move across spinning platters
- Slower read/write speeds (100–200 MB/s typical)
- Cheaper per GB
- Still used for large, low-cost bulk storage (backups, archives)

SSD (Solid State Drive):
- No moving parts — uses flash memory chips
- Much faster read/write speeds (500 MB/s+ for SATA SSDs)
- Lower latency (accesses data almost instantly)
- More durable (no mechanical failure from drops)
- Used in modern laptops, desktops, and servers
- More expensive per GB than HDD

Modern laptops use SSDs → significantly faster boot times and application loading.


NVMe — THE FASTEST SSD STANDARD
---------------------------------
NVMe = Non-Volatile Memory Express.

NVMe is a modern, ultra-fast communication protocol used by the latest SSDs
to communicate with the computer's CPU.

How it compares:
- Traditional HDD: ~100–200 MB/s sequential read
- SATA SSD: ~500–600 MB/s sequential read
- NVMe SSD: 3,000–7,000 MB/s sequential read (10–35x faster than HDD)

Why NVMe is faster:
- Uses the PCIe bus (not the older SATA interface)
- PCIe connects directly to the CPU with much higher bandwidth
- Lower latency: NVMe access latency is ~0.02–0.1 ms vs HDD's 5–10 ms

NVMe is now the standard for high-performance laptops, gaming PCs, and enterprise servers.


LATENCY
--------
Latency = the delay before data transfer begins (how long you wait before anything happens).

Low latency = fast, responsive
High latency = slow, laggy

Storage latency comparison (approximate):
- NVMe SSD: 0.02–0.1 milliseconds
- SATA SSD: 0.05–0.2 milliseconds
- HDD: 5–10 milliseconds (100–500x slower than NVMe)
- RAM: ~0.0001 milliseconds (the fastest)

In software, latency matters everywhere:
- Database queries: low latency = fast responses
- API calls: low latency = snappy apps
- Kubernetes: low latency = faster container orchestration
- .NET apps: async I/O, GC optimisations, and NVMe storage all reduce latency


NAS — NETWORK ATTACHED STORAGE
---------------------------------
NAS = Network Attached Storage.

A NAS is a dedicated file storage device connected to a network that multiple
computers can access simultaneously.

Think of it like a shared external hard drive on your local network.

Common uses:
- Centralised file storage for teams (instead of everyone using their own drives)
- Home/office media servers
- Backup destinations
- Small business shared drives

NAS is different from cloud storage (like OneDrive or S3):
- NAS sits on your local network (on-premises)
- Cloud storage is accessed over the internet


KEY FACTS TO REMEMBER
----------------------
- HDD = spinning disk, cheap, slow → good for archival
- SSD = flash memory, fast, durable → standard in modern devices
- NVMe = ultra-fast SSD protocol via PCIe → fastest storage available
- Latency = delay before transfer starts — NVMe has very low latency
- NAS = shared network storage device on a local network
- Modern laptops use NVMe SSDs → low latency, fast performance
