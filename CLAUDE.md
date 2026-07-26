# Tech-Blog (Tech Hub) — Project Guide

## What This Project Is

A personal tech learning site hosted at **https://rajkumar611.github.io/TechHub**, built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/). Markdown files are authored in a separate OneDrive "Learnings" folder, synced here, and automatically published to GitHub Pages via GitHub Actions.

## Repository Layout

```
Tech-Blog/
├── docs/                  # All markdown content (served by MkDocs)
│   ├── index.md           # Homepage with dynamic timestamp
│   ├── about.md           # Professional About Me page with profile photo
│   ├── images/
│   │   └── profile.png    # Profile photo (included in git, not ignored)
│   └── 01_AI/, 02_Cloud/, ... # Content organized by category
├── overrides/
│   ├── main.html          # Custom template with dynamic timestamp & About page styling
│   └── stylesheets/
│       └── extra.css      # Custom CSS for image positioning, nav title hiding
├── tools/                 # Utility scripts for maintenance
│   ├── cleanup-markdown.py    # Remove ASCII art from markdown files
│   └── README.md          # Documentation for utility scripts
├── .github/
│   └── workflows/
│       └── deploy.yml     # CI: runs `mkdocs gh-deploy` on every push to master
├── mkdocs.yml             # Site config with "About Me" as first nav item
├── sync.bat               # Sync script: copies from OneDrive Learnings → docs/
├── .gitignore             # Updated to allow images (*.jpg, *.png removed)
└── requirements.txt       # Python deps: mkdocs-material
```

## How Publishing Works

1. **Author** — Write `.txt` files in `C:\Users\QBE\OneDrive\Desktop\Learnings`
2. **Sync** — Run `sync.bat`; it copies all `.txt` → `.md` into `docs/`, updates `index.md` timestamp, then `git add / commit / push`
3. **Deploy** — The push triggers `deploy.yml` on GitHub Actions (Ubuntu runner), which installs `mkdocs-material` and runs `mkdocs gh-deploy --force` to the `gh-pages` branch
4. **View** — GitHub Pages serves the compiled HTML site

## Nav Registration (Automated via update-nav.ps1)

**sync.bat does NOT touch mkdocs.yml**, but `update-nav.ps1` handles nav registration automatically. Run it after syncing to register any new `docs/*.md` files into `mkdocs.yml`.

The script:
- Detects `.md` files in `docs/` not yet listed in `nav:`
- Auto-categorizes them by keyword-matching the filename
- Merges and alphabetically sorts entries within each category block

### Categories Currently in Use

| Category | Topic Area |
|---|---|
| AI & Modern Tech | AI, LLMs, MCP, RAG, agents |
| APIs & Web | REST, GraphQL, gRPC, middleware |
| Architecture | Design patterns, microservices |
| Cloud & DevOps | Azure, containers, Terraform, CI/CD |
| Data & Storage | Databases, ORMs |
| Frontend | React, Angular, Node, TypeScript |
| General | Miscellaneous notes |
| .NET & C# | C# language and .NET framework topics |
| Tools & Platforms | Dev tools, monitoring, security tools |

## Common Task: Add a New File to the Site

1. Run `sync.bat` to copy new files into `docs/`
2. Run `update-nav.ps1` to register them in `mkdocs.yml`
3. Commit and push — GitHub Actions will rebuild the site automatically

## Files Intentionally Excluded from the Site

- `docs/My/` — personal notes (also git-ignored via `.gitignore`)
- `docs/Bala Questions/` — interview prep (also git-ignored)

## Image Handling

- **Updated .gitignore:** Removed `*.jpg` and `*.png` exclusions to allow images in repo
- **Profile Photo:** `docs/images/profile.png` is tracked in git
- **Rationale:** Profile image is essential for About page; small file size acceptable

## Recent Customizations (July 2026)

### Markdown Cleanup
- **File:** `tools/cleanup-markdown.py`
- **Purpose:** Removes ASCII art box borders (╔, ║, ╚, ═) and decorative lines (━) from markdown files
- **Run:** `python tools/cleanup-markdown.py` (from project root)
- **Result:** 51 markdown files cleaned for professional appearance

### Site Branding & About Me
- **Site Title:** Changed from "Tech Hub" to **"Raj's Tech Hub"** in `mkdocs.yml`
- **About Page:** New `docs/about.md` with professional bio and profile photo
- **Navigation:** "About Me" is now the first menu item (before AI, Cloud, etc.)
- **Profile Photo:** `docs/images/profile.png` — positioned left-aligned below menu
- **Styling:** Custom CSS and template overrides hide page title and nav labels on About page

### Homepage Timestamp
- **Location:** `docs/index.md` (line 42)
- **Behavior:** Dynamic timestamp showing current NZ time (once on page load, static display)
- **Implementation:** JavaScript in `overrides/main.html` replaces placeholder with formatted time
- **Format:** "HH:MM am/pm, DD Month YYYY (New Zealand Time)"
- **Updates:** Refreshes each time page is reloaded after site deployment

### Custom Styling (overrides/stylesheets/extra.css)
- Hides page titles on About page
- Positions profile image left-aligned with 400px width
- Removes excessive spacing and margins
- Content wraps around profile image on the right

### Template Customizations (overrides/main.html)
- Adds dynamic timestamp script for homepage
- Hides "About Me" nav labels on About page
- Handles layout for About page specifically

### Utility Scripts (tools/)
- `cleanup-markdown.py` — One-time utility to clean ASCII art from markdown
- `README.md` — Documents available utility scripts
- **Note:** Utility scripts are kept in repo for future reference, can be recreated from git history

## Development Notes

### Homepage Timestamp Updates
To manually update the homepage timestamp (optional):
1. Edit `docs/index.md` line 42
2. Change the date/time value (JavaScript will display it dynamically on page load)
3. Commit and push — timestamp will auto-update on next deployment

### About Page Customizations
If you need to modify About page:
- **Content:** Edit `docs/about.md`
- **Styling:** Modify `overrides/stylesheets/extra.css` (image positioning, spacing)
- **Template:** Edit `overrides/main.html` for About-page-specific JavaScript/styling
- **Note:** Page title and nav labels are hidden via CSS/JS — changes to main.html may affect this

### Cleaning Markdown Files
If future markdown files have ASCII art decorations:
```bash
python tools/cleanup-markdown.py
```
Removes box borders, decorative lines, and cleans whitespace while preserving content.

## Claude Behaviour Rules

- **Never run `git commit` or `git push` without explicit user instruction.** Even if a script fails mid-way or changes are pending, always ask first.
- **Never run `sync.bat` without explicit user instruction.**
- When asked to execute `sync.bat`, run the script as-is and report what happened — do not manually repeat or substitute any of its steps.
- **Timestamp updates:** When deploying changes, the homepage timestamp JavaScript will automatically display the current NZ time on page reload

## Deployment

- **Trigger:** Any push to `master` branch
- **Runner:** Ubuntu (GitHub-hosted)
- **Command:** `mkdocs gh-deploy --force --remote-branch gh-pages`
- **Live URL:** https://rajkumar611.github.io/TechHub
