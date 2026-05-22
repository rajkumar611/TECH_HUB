INFRASTRUCTURE AS CODE (IaC) — TERRAFORM, BICEP, ARM
======================================================

WHAT IS IaC?
------------
Instead of manually clicking in the Azure portal to create cloud resources,
you write code (files) that describe your infrastructure.
The tool then creates, updates, or deletes resources automatically.

Benefits: Consistency, repeatability, version control, automation, no human error.


1. ARM TEMPLATES (Azure Resource Manager)
------------------------------------------
- Azure's native provisioning engine.
- Every Azure management tool (Portal, CLI, PowerShell, Terraform, Bicep) ultimately sends
  requests to the ARM REST API at https://management.azure.com/
- Uses declarative JSON to describe desired infrastructure state.
- ARM validates the request, checks RBAC permissions, and provisions resources.

Example ARM JSON (storage account):
{
  "type": "Microsoft.Storage/storageAccounts",
  "apiVersion": "2022-09-01",
  "name": "mystorage123",
  "location": "eastus",
  "sku": { "name": "Standard_LRS" },
  "kind": "StorageV2"
}

ARM is the underlying engine. It processes all deployments regardless of the tool used.


2. BICEP
---------
- Microsoft's Azure-native IaC DSL (Domain-Specific Language).
- Simpler, cleaner syntax than ARM JSON.
- Compiles directly into ARM JSON (Bicep is just a better way to write ARM templates).
- Azure-only — no multi-cloud support.
- No state file, no provider plugins.
- New Azure resource types are immediately available (ARM schemas).

Example Bicep:
resource sa 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'mystorage123'
  location: 'eastus'
  sku: { name: 'Standard_LRS' }
  kind: 'StorageV2'
}

Best for: Azure-only projects that want simpler IaC without Terraform complexity.


3. TERRAFORM
-------------
- Cloud-agnostic IaC tool by HashiCorp.
- Works with Azure, AWS, GCP, Kubernetes, VMware, and 100s of other platforms.
- Uses HCL (HashiCorp Configuration Language).
- Maintains its own state file to track deployed vs desired infrastructure.
- Uses provider plugins to interact with each cloud.
- You run it from CLI: terraform init → terraform plan → terraform apply.

Best for: Multi-cloud environments, teams that want one tool across platforms.


COMPARISON TABLE
-----------------

Feature           | ARM Templates  | Bicep              | Terraform
------------------|----------------|--------------------|-------------------
Cloud support     | Azure only     | Azure only         | Multi-cloud
Language          | JSON           | Bicep DSL          | HCL
State file        | No             | No                 | Yes (terraform.tfstate)
Compiles to       | -              | ARM JSON           | Provider API calls
New Azure support | Immediate      | Immediate          | Depends on provider update
Complexity        | High (verbose) | Low (clean syntax) | Medium
Best for          | Legacy/native  | Azure-only IaC     | Multi-cloud IaC


CLOUD-SPECIFIC IaC EQUIVALENTS
--------------------------------
Azure  → ARM Templates / Bicep
AWS    → CloudFormation (JSON/YAML) or CDK (TypeScript, Python, Java, C#)
GCP    → Deployment Manager (YAML + Jinja2/Python) or Config Connector

Terraform works with all of the above as a single unified tool.
