# Terraform Docker Deployment Solution

## Overview

This Terraform project deploys multiple Docker containers with **persistent volumes** and **custom networking configurations**.  

It includes:

- **Web servers:** Two Nginx containers with individual DNS configurations, persistent volumes, and access to both internal and external networks.  
- **Backend servers:** Three Ubuntu containers with persistent volumes, access to the internal network, and kept running continuously.

---

## Project Structure
```bash
├── modules/
│   └── container/           # Child module for container creation
│       ├── main.tf
│       ├── providers.tf
│       └── variables.tf
│       └── outputs.tf
├── main.tf  
├── networks.tf              # Parent module orchestration
├── variables.tf             # Input variable declarations
├── docker.tfvars            # Configuration values (networks, container specs)
└── README.md                # Documentation
```

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

## Prerequisites

- Docker installed and running  
- Terraform v1.5+ installed  
- Access to a terminal/command line  


## How to Deploy

**Initialize Terraform:**
```bash
terraform init
```

**Plan the deployment:**
```bash
terraform plan -var-file="docker.tfvars"
```

**Apply the configuration:**
```bash
terraform apply -var-file="docker.tfvars"
```

## Verify Containers, Networks, and Volumes

After applying the Terraform configuration, you can check the status of containers, networks, and volumes using:

```bash
docker ps
docker network ls
docker volume ls
```

## Future Modifications

- **Add containers:** Update `web_servers` or `backend_servers` lists in `docker.tfvars`.
- **Change images/tags:** Update `image_name` or `image_tag` in `.tfvars`.
- **Change DNS:** Update `dns_servers` for web containers.
- **Modify networks:** Update `internal_network_names` or `external_network_name`.
- **Volume sizes:** Can be added as a variable if required in the future.

## Notes

- Designed for **easy readability** and **maintainability**.
- Leverages `for_each` and `locals` for **dynamic container creation**.
- DNS configuration is **container-specific**, ensuring different web servers can have **distinct settings**.
- Each container has its own **persistent volume** to safeguard data.
- Supports both **internal and external Docker networks** for flexible connectivity.

## References

- [Terraform Docker Get Started Tutorial](https://developer.hashicorp.com/terraform/tutorials/docker-get-started/docker-build)
