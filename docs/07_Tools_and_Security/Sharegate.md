SHAREGATE

WHAT IS SHAREGATE?

Sharegate is a specialised tool for managing, migrating, and governing SharePoint
and Microsoft 365 environments.

Primary use: Content migration between SharePoint environments (e.g., SharePoint 2013
on-premises → SharePoint Online / Microsoft 365).

Made by: Sharegate (a Quest Software company)

WHAT SHAREGATE DOES

1. Content Migration:
   - Moves SharePoint content from one location to another reliably and efficiently
   - Preserves structure, permissions, metadata, and version history
   - Handles large-scale migrations with minimal manual effort
   - Field mapping: maps and transforms metadata between source and destination

2. Governance:
   - Site lifecycle management
   - Workspace provisioning and decommissioning
   - Teams and Microsoft 365 groups management
   - Security and permission reporting

3. Backup and Restore:
   - Backup SharePoint sites, libraries, and lists
   - Restore individual items or entire sites

4. Reporting:
   - SharePoint usage and adoption reports
   - Permission and access reports
   - Storage consumption reports

SHAREGATE IN A MIGRATION PROJECT

Example scenario: Migrating from SharePoint 2013 (on-premises) to SharePoint Online.

What Sharegate handles:
- Copies documents, lists, sites, and libraries from source to destination
- Preserves metadata (file dates, author, modified by, custom columns)
- Maps permissions (SharePoint groups to Microsoft 365 groups)
- Field mapping: can automatically copy legacy IDs into custom columns in the target
  (e.g., copying UniqueIds from SharePoint 2013 into a lookup column in SharePoint Online)
- Handles large document libraries without timing out or failing

What Sharegate does NOT do:
- Update application code or APIs
- Solve every migration challenge automatically
- Replace custom development when business rules need transforming

Benefit: Dramatically simplifies the complex, risky task of migrating SharePoint content
while maintaining data integrity throughout the process.

SHAREGATE vs MANUAL MIGRATION

Manual migration:
- Scripting with PowerShell or PnP.PowerShell
- High risk of missing metadata, breaking permissions, or losing version history
- Very time-consuming

Sharegate:
- GUI-driven, with preview and dry-run capabilities
- Automatically handles metadata mapping
- Built-in error handling and retry logic
- Migration reports and success confirmation
- Much faster for large content volumes

KEY FACTS TO REMEMBER

- Sharegate = SharePoint and Microsoft 365 migration, management, and governance tool
- Best known for SharePoint to SharePoint Online migrations
- Preserves content structure, permissions, and metadata during migration
- Field mapping feature: lets you map/transform metadata between source and destination
- Also provides governance, backup, and reporting for Microsoft 365 environments
- One-liner: "Sharegate is a specialised tool that makes SharePoint migrations fast,
  reliable, and metadata-safe, with strong governance and reporting features."
