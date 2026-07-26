CYBERARK — PRIVILEGED ACCESS MANAGEMENT

WHAT IS CYBERARK?

CyberArk is an enterprise security platform for Privileged Access Management (PAM).
It manages, controls, and audits access to privileged accounts and credentials
(admin passwords, SSH keys, service account secrets) across any environment.

Core purpose:
- Store privileged credentials in a secure, centralised vault
- Control WHO can access what, WHEN, and HOW
- Automatically rotate passwords and secrets
- Record and audit all privileged sessions
- Ensure compliance by maintaining detailed audit trails

Used by: large enterprises, banks, insurance companies, government — any organisation
with strict security and compliance requirements.

WHAT CYBERARK DOES

1. Secure Vault:
   All privileged credentials stored encrypted in one central vault.
   No passwords scattered across systems, spreadsheets, or shared drives.

2. Access Control:
   Defines who can request access to which credential, and under what conditions.
   Access can be time-limited (e.g., 1-hour window only).

3. Password Rotation:
   CyberArk automatically rotates passwords on a schedule or after each use.
   If a credential is compromised, it gets rotated immediately.

4. Session Recording:
   All privileged sessions (SSH, RDP, database access) are recorded.
   Full video/transcript of what commands were run, by whom, and when.

5. Audit Trail:
   Every credential request and access is logged for compliance reporting.
   Supports SOX, PCI-DSS, ISO 27001, and other regulatory frameworks.

CYBERARK vs AZURE KEY VAULT

Both securely store and manage credentials, but they serve different purposes:

Feature                | Azure Key Vault              | CyberArk
-----------------------|------------------------------|----------------------------
Primary purpose        | Store app secrets in Azure   | Enterprise PAM (all environments)
Who uses it            | Applications                 | IT admins, DevOps, users
Session recording      | No                           | Yes
Password auto-rotation | Yes (basic)                  | Yes (advanced)
Audit capabilities     | Basic (Azure logs)           | Comprehensive (compliance-grade)
Environments           | Azure only                   | Azure, AWS, on-premises, Linux, Windows
MFA enforcement        | Via Azure AD                 | Built-in PAM controls
Best for               | Application secrets in Azure | Privileged user access management

Use Azure Key Vault when: Storing API keys, connection strings, and secrets for applications.
Use CyberArk when: Managing privileged admin access with strict compliance requirements.

SSH AND CYBERARK IN KUBERNETES

What is SSH?
SSH (Secure Shell) = a secure protocol for remotely accessing and controlling servers.
- Uses Port 22
- Authenticates with public/private key pairs
- Encrypts all communication

Traditional vs Kubernetes:
  Before Kubernetes: Developers SSH'd into individual servers to manage containers manually.
  With Kubernetes: You declare desired state; Kubernetes orchestrates automatically.
  You no longer SSH into nodes for routine work.

When SSH is still used in Kubernetes:
- Emergency node debugging (crashes, network issues)
- OS-level maintenance (patches, security updates)
- Cluster troubleshooting

CyberArk's role (PSM for SSH — Privileged Session Manager):
When someone does need SSH access to a Kubernetes node, CyberArk:
- Brokers the access (controls which engineers can access which nodes)
- Stores and rotates SSH private keys (no hardcoded keys in scripts)
- Enforces MFA before granting access
- Records the SSH session (what commands were run, by whom, when)
- Maintains compliance audit trails

KEY FACTS TO REMEMBER

- CyberArk = enterprise PAM (Privileged Access Management) platform
- Stores privileged credentials in a secure vault, not scattered across systems
- Automatically rotates passwords and secrets
- Records all privileged sessions for compliance
- Different from Azure Key Vault: CyberArk is for human privileged access; Key Vault is for app secrets
- SSH is a secure remote access protocol (Port 22) — CyberArk controls who can use it
- One-liner: "CyberArk secures, controls, and audits privileged access to sensitive accounts
  across any environment, with full session recording and automatic credential rotation."
