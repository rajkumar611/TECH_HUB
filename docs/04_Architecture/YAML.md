YAML

WHAT IS YAML?

YAML = "YAML Ain't Markup Language" (originally "Yet Another Markup Language").
The name change emphasises that YAML is for DATA and CONFIGURATION — not for markup.

YAML is a human-readable configuration language.
It is NOT a programming language. It has no logic, no functions, no loops.
It is used wherever configuration or structured data needs to be defined clearly.

Created in 2001 by Clark Evans, Ingy döt Net, and Oren Ben-Kiki.

WHERE YAML IS USED

YAML is used across the entire technology stack — everywhere configuration is needed:

- Kubernetes: pod definitions, deployments, services, ingress rules
- GitHub Actions: CI/CD workflow definitions
- Docker Compose: multi-container application definitions
- Azure Pipelines / AWS CodeBuild / GitLab CI: build and deploy pipelines
- Cloud configuration: Azure, AWS, GCP resource definitions
- AI agent definitions (e.g., defining tools and capabilities)
- Application settings: appsettings-style config files
- Terraform / Bicep: infrastructure definitions (some tooling uses YAML)
- Helm charts: Kubernetes application package definitions

YAML SYNTAX BASICS

YAML uses indentation (spaces, not tabs) to define structure.

Key-value pairs:
  name: Raj
  age: 30
  city: Sydney

Nested structure (using indentation):
  person:
    name: Raj
    age: 30
    address:
      city: Sydney
      country: Australia

Lists (using -):
  skills:
    - C#
    - Azure
    - Docker

Inline list:
  skills: [C#, Azure, Docker]

True/false:
  enabled: true
  debug: false

Multi-line text:
  description: |
    This is a multi-line
    string in YAML.

REAL-WORLD EXAMPLES

1. GitHub Actions workflow (.github/workflows/build.yml):
   name: Build and Test
   on: [push]
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - name: Run tests
           run: dotnet test

2. Kubernetes deployment:
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: my-api
   spec:
     replicas: 3
     template:
       spec:
         containers:
           - name: my-api
             image: myregistry/my-api:latest
             ports:
               - containerPort: 8080

3. Docker Compose:
   services:
     web:
       image: nginx
       ports:
         - "80:80"
     api:
       build: .
       ports:
         - "5000:5000"

YAML vs JSON vs XML

Feature       | YAML              | JSON              | XML
--------------|-------------------|-------------------|------------------
Human-readable| Very easy         | Moderate          | Verbose
Used for      | Config files      | APIs, data        | Legacy, SOAP
Comments      | Yes (# comment)   | No                | Yes
Data types    | Strings, numbers, | Strings, numbers, | Text only
              | booleans, lists   | booleans, arrays  | (attributes help)
File extension| .yml or .yaml     | .json             | .xml

KEY FACTS TO REMEMBER

- YAML is a configuration language, NOT a programming language
- Used by DevOps, Cloud, Backend, AI/ML engineers everywhere
- Indentation matters — use spaces, never tabs
- Most common use cases: Kubernetes, CI/CD pipelines, Docker Compose
- YAML files have .yml or .yaml extension
- YAML supports comments with # (JSON does not)
