DEVOPS AND DEVSECOPS
=====================

WHAT IS DEVOPS?
----------------
DevOps is a cultural and technical approach that integrates Development and Operations
teams through automation, CI/CD, and collaboration to deliver software faster and
more reliably.

Key principles:
- Break down silos between Dev and Ops teams
- Automate build, test, and deployment processes
- Deliver software continuously in small, safe increments
- Monitor and learn from production to improve over time

AZURE DEVOPS:
Microsoft's cloud platform for implementing DevOps practices. It includes:
- Boards (work items, sprints, backlogs)
- Repos (Git repositories)
- Pipelines (CI/CD automation)
- Test Plans (manual and automated testing)
- Artifacts (package management: NuGet, npm)


WHAT IS DEVSECOPS?
-------------------
DevSecOps = DevOps + Security integrated at every stage.
Security is no longer a last-minute gate at the end. It becomes everyone's responsibility,
embedded into every phase: plan → code → build → test → deploy → run.

Note: "Azure DevSecOps" is not a product name. It describes the practice of implementing
DevSecOps using Azure tools (Azure DevOps, Azure Key Vault, Defender for Cloud, etc.).


DEVSECOPS SECURITY STAGES
---------------------------
Each stage of the pipeline has its own security practice:

Stage    | Security Practice | What it does
---------|-------------------|----------------------------------------
Code     | SAST              | Scans source code for vulnerabilities
Build    | SCA               | Scans dependencies/libraries
Test     | DAST              | Tests the running application
Deploy   | IaC Scanning      | Scans infrastructure templates
Run      | Runtime Security  | Monitors running workloads in production


1. SAST — STATIC APPLICATION SECURITY TESTING
-----------------------------------------------
What it is:
Scans source code WITHOUT running it to detect security vulnerabilities early.
Runs during coding and build stages.

Examples of vulnerabilities found: SQL injection in code, hardcoded credentials,
insecure cryptography, input validation issues.

Common SAST tools:
- SonarQube
- Checkmarx
- Fortify
- Veracode SAST
- GitHub CodeQL


2. DAST — DYNAMIC APPLICATION SECURITY TESTING
------------------------------------------------
What it is:
Tests a RUNNING application from the outside to find vulnerabilities.
Does not need source code. Runs later in the pipeline (testing stage).

Examples of vulnerabilities found: SQL injection, XSS (cross-site scripting),
broken authentication, insecure direct object references.

Common DAST tools:
- OWASP ZAP
- Burp Suite
- Acunetix
- Netsparker
- IBM AppScan


3. SCA — SOFTWARE COMPOSITION ANALYSIS
-----------------------------------------
What it is:
Scans all open-source libraries and third-party dependencies for known vulnerabilities,
outdated packages, and license risks.

Most applications use many open-source packages — SCA secures that third-party code.
SCA complements SAST (which checks YOUR code) and DAST (which checks runtime behaviour).

Common SCA tools:
- Snyk
- Mend (formerly WhiteSource)
- Dependabot (GitHub)
- OWASP Dependency-Check
- JFrog Xray


4. IaC SCANNING — INFRASTRUCTURE-AS-CODE SCANNING
----------------------------------------------------
What it is:
Security scanning of Infrastructure-as-Code templates (Terraform, Bicep, ARM,
CloudFormation) to detect misconfigurations BEFORE deployment.

Many cloud breaches occur due to misconfigured infrastructure, not application bugs.

What it catches:
- Open security groups (0.0.0.0/0 ports exposed)
- Publicly accessible storage accounts
- Missing encryption on disks
- Overly permissive IAM roles
- Missing logging and monitoring
- Misconfigured Kubernetes clusters

Common IaC scanning tools:
- Checkov
- Terraform Sentinel
- Azure Policy
- Kics
- OPA (Open Policy Agent)


5. RUNTIME SECURITY
---------------------
What it is:
Monitoring and protecting applications, containers, and cloud resources while they
are RUNNING in production.

DAST tests before release. Runtime security protects AFTER release.
New vulnerabilities emerge in production even after secure development.

What it monitors:
- Suspicious container behaviour
- Unexpected network connections
- Privilege escalation attempts
- File system changes
- Anomalous API calls
- Malware execution

Common runtime security tools:
- Falco (Kubernetes)
- Microsoft Defender for Cloud
- Datadog Security
- Dynatrace Application Security
- Aqua Security
- Palo Alto Prisma Cloud


DEVSECOPS PIPELINE OVERVIEW
-----------------------------
Plan → Code → Build → Test → Deploy → Run
               ↓       ↓       ↓        ↓        ↓       ↓
            SAST     SCA    DAST   IaC Scan  Runtime Security

"No single tool finds all vulnerabilities.
SAST, DAST, SCA, and IaC scanning complement each other by covering different layers."


KEY FACTS TO REMEMBER
----------------------
- DevOps = integrate Dev + Ops through automation and CI/CD
- DevSecOps = embed security into every stage of the DevOps pipeline
- SAST = scan source code (no running required, catches issues early)
- DAST = test running app from outside (finds runtime vulnerabilities)
- SCA = scan open-source dependencies (third-party library risks)
- IaC scanning = scan Terraform/Bicep/ARM before deploying cloud infrastructure
- Runtime security = monitor and protect production workloads in real time
- Azure DevSecOps = not a product; it's the practice using Azure tools
