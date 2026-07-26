# Utility Scripts

Collection of helper scripts for maintaining the Raj's Tech Hub blog.

## cleanup-markdown.py

**Purpose:** Remove ASCII art decorations and standardize markdown formatting across all documentation files.

**What it does:**
- Removes box drawing characters (╔, ║, ╚, ═, ╝, etc.)
- Removes decorative dash lines (━)
- Removes lines with only regular dashes (----) or equals (====)
- Cleans up multiple consecutive blank lines
- Trims trailing whitespace

**Usage:**
```bash
python cleanup-markdown.py
```

**When to use:**
- After bulk importing markdown files with ASCII art decorations
- When standardizing formatting across the documentation

**Requirements:**
- Python 3.x
- No external dependencies

---

**Note:** All scripts are one-time utilities and can be recreated from git history if needed.
