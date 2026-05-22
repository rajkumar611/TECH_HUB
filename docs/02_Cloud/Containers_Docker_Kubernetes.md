CONTAINERS, DOCKER, AND KUBERNETES
====================================

THE PROBLEM BEFORE CONTAINERS
-------------------------------
"It works on my machine" was the biggest problem in software delivery.
Different machines had different OS versions, runtimes, library versions, and configs.
Deployment required installers, ZIP files, VM images, or manual server setup documents.
Every deployment was fragile and inconsistent.


WHAT IS A CONTAINER?
---------------------
A container packages your app + its runtime + its dependencies into one isolated, portable unit.
The app runs the same everywhere: laptop, QA, UAT, production, cloud, or on-prem.

A container is BOTH:
- A package (your app + dependencies)
- A mini-runtime environment where the app actually executes

Analogy:
  Before: Send a chef to a random kitchen, hope the tools match.
  After:  Send the chef WITH their own kitchen, tools, and ingredients.


DOCKER
-------
Docker is the tool that builds and runs containers.

Key components:
- Dockerfile = Recipe written by the developer (instructions to build the image).
- Docker Image = The prepared dish (a blueprint/snapshot of the container).
- Container = The dish served on the table (a running instance of the image).

Docker does NOT create the Dockerfile — the developer does.
Docker reads the Dockerfile, builds the image, and runs the container.

Dockerfile lives in your project directory alongside your code, and is version-controlled.

Analogy: Dockerfile = recipe. Docker = chef. Image = prepared dish. Container = dish served.

Reference video: https://www.youtube.com/watch?v=i8vnIi08UxQ


KUBERNETES
-----------
In real projects, you run hundreds or thousands of containers.
Kubernetes (K8s) is a container orchestration system that manages containers at scale.

Kubernetes handles:
- Deployment (where to place containers)
- Scaling (add/remove replicas automatically)
- Load balancing (distribute traffic)
- Self-healing (restart crashed containers)


KUBERNETES ARCHITECTURE
------------------------

Control Plane (the brain):
  - API Server       → Central hub; all communication goes through here.
  - Controller Manager → Ensures actual state matches desired state.
  - ETCD             → Key-value database storing all cluster state.
  - Scheduler        → Decides which worker node gets each container.

Worker Nodes (where your app runs):
  - Kubelet    → Agent on each node; delegates container operations to the container runtime.
  - kube-proxy → Manages network rules so traffic reaches containers.
  - Container Runtime → Docker, containerd, or CRI-O; actually pulls/runs/removes containers.

How it works:
1. You declare: "I want 3 replicas of my app."
2. This goes to the API Server → stored in ETCD.
3. Controller Manager sees desired (3) vs actual (0) = mismatch.
4. Scheduler picks worker nodes.
5. Kubelet on those nodes runs the containers via container runtime.
6. If a container crashes, Kubelet reports it. Controller Manager recreates it automatically.


KUBERNETES vs CLOUD SERVICES
------------------------------
Kubernetes is NOT cloud-specific. It can run:
- On-premises (your company's physical servers)
- On cloud (as managed services)
- On your laptop (for learning)

Managed Kubernetes services:
- AKS (Azure Kubernetes Service)  → Kubernetes on Azure
- EKS (Elastic Kubernetes Service) → Kubernetes on AWS
- GKE (Google Kubernetes Engine)   → Kubernetes on GCP


DO CONTAINERS NEED CLOUD?
--------------------------
No. Containers run perfectly on your laptop, on-prem servers, or in a data center.
Cloud just makes it easier to provision the infrastructure Kubernetes needs.


SUMMARY
--------
Docker creates containers. Kubernetes manages them at scale.
This combination is the standard for modern cloud-native application deployment.
