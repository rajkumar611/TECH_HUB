GIT AND GITHUB

WHAT IS GIT?

Git is a distributed version control system that tracks changes in source code.
It runs locally on your computer and works offline.

Created by Linus Torvalds.

Git lets you:
- Track all changes to your code over time
- Revert to any previous version
- Create branches to experiment without affecting the main code
- Merge changes from multiple developers

Analogy: Git = Microsoft Word (with full edit history and undo)
You write, edit, save — all locally on your machine.

WHAT IS GITHUB?

GitHub is a cloud platform for hosting Git repositories online.
Owned by Microsoft (acquired 2018).

GitHub adds on top of Git:
- Remote repository hosting (your code is safe in the cloud)
- Pull Requests (code review before merging)
- Issue tracking
- CI/CD automation (GitHub Actions)
- Team collaboration and access controls
- Project management boards

Analogy: GitHub = OneDrive
You upload your documents to the cloud to share, backup, and collaborate.

Key distinction: Git is the tool/protocol. GitHub is the service/platform.
GitLab, Bitbucket, and Azure Repos are alternative platforms — they all host Git repos.

HOW GIT AND GITHUB WORK TOGETHER

1. You write code locally
2. Git tracks your changes (commits)
3. You push the code to GitHub
4. Your team pulls the code from GitHub
5. Everyone collaborates safely via branches and pull requests

Local (Git):  write → commit → push
Remote (GitHub): store → review → merge

GIT vs GITHUB COMPARISON

Feature         | Git                      | GitHub
----------------|--------------------------|----------------------------------
What it is      | Version control system   | Cloud platform for Git repos
Where it runs   | On your computer         | On the internet
Works offline   | Yes                      | No
Stores code     | Locally                  | In the cloud
Collaboration   | Limited                  | Excellent
Branching       | Yes                      | Yes (via Git)
Pull Requests   | No                       | Yes
Issue Tracking  | No                       | Yes
CI/CD           | No                       | Yes (GitHub Actions)
Creator         | Linus Torvalds           | Microsoft

GIT'S KEY ADVANTAGE: LOCAL BRANCHES

Git is DISTRIBUTED — every developer has a complete copy of the entire repository,
including all history and branches, on their local machine.

Local branches are INVISIBLE to the rest of the team until you push them.
This means:
- You can experiment freely without cluttering the shared repository
- Try 5 different approaches in 5 local branches
- Delete the bad ones — no one ever knew
- Push only the good solution

In SVN (older centralised system):
- Branches were created on the server — everyone could see them immediately
- Creating a branch was slow (server operation)

In Git:
- Branches are instant and local
- No server involved until you deliberately push
- Switching branches is instant (just updating your working directory)

Git workflow in Visual Studio:
- Git menu → New Branch → creates a LOCAL branch
- Make commits locally (team sees nothing)
- Git menu → Push → Publish Branch (now the team can see it)

DEVSECOPS AGENTS (SIDE NOTE)

An Agent = software installed on a machine that performs automated tasks.
Examples:
- Azure DevOps agent: runs CI/CD pipeline builds
- Azure Monitor agent: collects logs and metrics
- Dependency agent: maps service dependencies
- Security agents (Defender, CrowdStrike): monitor for threats

Multiple agents can run on the same machine. Each is just a separate background service
that connects to a central platform and executes tasks.

GITHUB vs GITLAB vs BITBUCKET

Platform    | Best for                          | Owner
------------|-----------------------------------|---------
GitHub      | Open source, collaboration, community | Microsoft
GitLab      | Full DevOps platform, strong CI/CD, self-hosting | GitLab Inc.
Bitbucket   | Teams using Jira and Atlassian tools | Atlassian
Azure Repos | Teams using Azure DevOps           | Microsoft

All four host Git repositories — the difference is in features and ecosystem fit.

KEY FACTS TO REMEMBER

- Git = version control tool (runs locally, works offline)
- GitHub = cloud platform for storing and collaborating on Git repos
- Git was created by Linus Torvalds; GitHub is owned by Microsoft
- Local branches in Git are invisible to others until you push them
- This makes experimentation cheap and the shared repository stays clean
- GitHub Actions = GitHub's CI/CD automation tool
- GitHub is a SaaS platform (not a cloud provider like Azure/AWS)
