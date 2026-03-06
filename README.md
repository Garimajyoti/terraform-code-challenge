# Terraform Docker Deployment Solution

## Overview

This Terraform project deploys multiple Docker containers with **persistent volumes** and **custom networking configurations**.  

It includes:

- **Web servers:** Two Nginx containers with individual DNS configurations, persistent volumes, and access to both internal and external networks.  
- **Backend servers:** Three Ubuntu containers with persistent volumes, access to the internal network, and kept running continuously.

---

## Project Structure
.
├── modules/
│   └── container/           # Child module for container creation
│       ├── main.tf
│       ├── providers.tf
│       └── variables.tf
├── main.tf                  # Parent module orchestration
├── variables.tf             # Input variable declarations
├── docker.tfvars            # Configuration values (networks, container specs)
└── README.md                # Documentation


- **Child module:** Handles creating individual Docker containers and volumes.  
- **Parent module:** Creates networks and calls child module for web and backend containers.  
- **Variables and .tfvars:** Support configuration management for easy updates.

---

## Key Design Choices

- **Extensibility:** Adding new containers or networks is simple—update the `.tfvars` file.  
- **Configuration management:** DNS servers, image names/tags, networks, and container names are variables.  
- **Reusability:** The child module can be reused for multiple container types.  
- **Persistent volumes:** Each container has its own volume for data persistence.  
- **Networking:** Supports both internal and external Docker networks.

---

## How to Deploy

**Initialize Terraform:**

```bash
terraform init

## How to Deploy

**Apply the configuration:**

```bash
terraform apply -var-file="docker.tfvars"

## Verify Containers, Networks, and Volumes

After applying the Terraform configuration, you can check the status of containers, networks, and volumes using:

```bash
docker ps
docker network ls
docker volume ls