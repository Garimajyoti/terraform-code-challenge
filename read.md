Terraform Docker Deployment Solution
Overview

This Terraform project deploys multiple Docker containers with persistent volumes and custom networking configurations.
It includes:

Web servers: Two Nginx containers with individual DNS configurations, persistent volumes, and both internal and external network access.

Backend servers: Three Ubuntu containers with persistent volumes and access to the internal network, kept running continuously.

Project Structure
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

Child module: Handles creating individual Docker containers and volumes.

Parent module: Creates networks and calls child module for web and backend containers.

Variables and .tfvars: Support configuration management for easy updates.

Key Design Choices

Extensibility: Adding new containers or networks is simple—update the .tfvars file.

Configuration management: DNS servers, image names/tags, networks, and container names are variables.

Reusability: The child module can be reused for multiple container types.

Persistent volumes: Each container has its own volume for data persistence.

Networking: Supports both internal and external Docker networks.

How to Deploy

Initialize Terraform:

terraform init

Apply the configuration:

terraform apply -var-file="docker.tfvars"

Verify containers, networks, and volumes:

docker ps
docker network ls
docker volume ls
Future Modifications

Add containers: Update web_servers or backend_servers lists in docker.tfvars.

Change images/tags: Update image_name or image_tag in .tfvars.

Change DNS: Update dns_servers for web containers.

Modify networks: Update internal_network_names or external_network_name.

Volume sizes: Can be added as a variable if required in the future.

Notes

Designed for easy readability and maintainability.

Leverages for_each and locals for dynamic container creation.

DNS configuration is container-specific, ensuring different web servers can have distinct settings.