AZURE SERVICE PRINCIPAL vs MANAGED IDENTITY
============================================

SIMPLE ANALOGY
--------------
Service Principal = giving someone a spare key to your house.
  You create the key, store it, and must protect it. If stolen, your house is at risk.

Managed Identity = living in a smart building that automatically recognizes you.
  No key needed. The building (Azure) authenticates you automatically.
  Nothing to lose, nothing to steal.


SERVICE PRINCIPAL
------------------
- An identity created manually inside Microsoft Entra ID (Azure AD) for an application.
- Authenticates using: Client ID + Client Secret (or Certificate).
- You must: store the secret securely (usually in Azure Key Vault) and rotate it periodically.
- Can be used from ANYWHERE: on-prem servers, laptops, GitHub Actions, AWS, Azure.
- Risk: If the secret is leaked, anyone can impersonate the app.

Use when: Your app runs OUTSIDE Azure (on-prem, GitHub Actions, developer laptop, other clouds).


MANAGED IDENTITY
-----------------
- An identity automatically created and managed by Azure for a specific Azure resource.
- Resources: VM, App Service, Function App, Logic App, Container App.
- Has NO secrets, NO certificates.
- Azure automatically issues access tokens when the resource needs to call other Azure services.
- You store nothing, rotate nothing, protect nothing.
- Works ONLY inside Azure.

Use when: Your app runs INSIDE Azure and needs to access other Azure services (e.g., App Service → Key Vault, Azure SQL, Blob Storage).


TECHNICAL COMPARISON
---------------------

Feature                  | Service Principal     | Managed Identity
-------------------------|-----------------------|-------------------
Who creates it           | You (manually)        | Azure (automatically)
Has secrets              | Yes                   | No
Secrets storage needed   | Yes (Key Vault)       | No
Secret rotation          | Manual or automated   | Automatic
Works outside Azure      | Yes                   | No
Security risk            | Higher (secret leaks) | Lower (no secrets)
Recommended for          | External systems      | Azure-to-Azure calls


HOW AUTHENTICATION WORKS
------------------------
Service Principal:
App → sends Client ID + Secret to Azure AD → receives access token → calls Azure resource.

Managed Identity:
App → asks Azure Instance Metadata Service for a token → Azure AD issues token automatically → calls Azure resource.
(No secrets involved at any step.)


ONE-SENTENCE SUMMARY
--------------------
Service Principal = manually managed identity with secrets you must protect.
Managed Identity = Azure-managed identity with no secrets, recommended for Azure-to-Azure communication.
