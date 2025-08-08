# ECS: End-to-End DevSecOps on AWS – Gatus Deployment

## Gatus Uptime Monitoring – Overview

Welcome to the **Gatus ECS Deployment**, a production-grade, containerised uptime monitoring and status page application.  
It’s deployed securely on **AWS ECS Fargate**, leveraging **Terraform** for Infrastructure as Code, **GitHub Actions** for CI/CD automation, and **Amazon ECR** for container image storage.

The architecture follows security best practices:
- **Private subnets** for all ECS workloads
- **Public ALB** for HTTPS traffic termination
- **Cloudflare DNS** for domain resolution and protection
- **AWS Certificate Manager (ACM)** for TLS/SSL

Infrastructure provisioning, application deployment, and updates are fully automated — enabling repeatable, consistent, and secure releases.

---

## Key Highlights

- **Private Subnet Isolation** – No direct internet exposure to ECS tasks. All inbound traffic flows through an ALB.
- **Containerised Gatus** – Consistent, reproducible deployments using Docker.
- **Infrastructure as Code** – Modular Terraform configuration for scalability and reusability.
- **CI/CD Pipeline** – Automated Docker build, push to ECR, and ECS deployment via GitHub Actions.
- **Secure by Design** – HTTPS enforced via ACM, DNS managed through Cloudflare, and IAM least-privilege roles.

---

## Technologies Used

| Category       | Tools/Services                                    |
|----------------|----------------------------------------------------|
| **Cloud**      | AWS ECS (Fargate), ALB, ECR, ACM, VPC, S3           |
| **DNS & TLS**  | Cloudflare DNS, ACM TLS Certificates               |
| **IaC**        | Terraform (modular structure)                      |
| **CI/CD**      | GitHub Actions (build, deploy, destroy)            |
| **Security**   | IAM, SSL, Cloudflare proxying                       |
| **Container**  | Docker (multi-stage build)                         |

---

## Architecture Overview

This deployment uses a **multi-subnet AWS VPC** for strict network segregation.

- **Public Subnet** hosts:
  - Application Load Balancer (ALB)
  - ACM certificates
  - Cloudflare DNS entry point

- **Private Subnet** hosts:
  - ECS Fargate tasks running Gatus
  - NAT Gateway for outbound traffic
  - Amazon S3 (remote backend state storage)

No ECS tasks are exposed directly to the internet — aligning with **zero-trust architecture principles**.

---

## Architecture Diagram

CI/CD Workflow Overview
bash
Copy
Edit
# 1. Push to main branch OR trigger build.yml manually
#    → GitHub Actions builds Docker image from /app and pushes to ECR

# 2. Manually trigger Terraform workflows in sequence:
#    a. terraform-init-plan.yml
#    b. terraform-apply.yml

# 3. ECS Fargate pulls latest container image from ECR

# 4. ALB routes HTTPS traffic to ECS tasks

# 5. Cloudflare resolves DNS for tm.hamsa-ahmed.co.uk → ALB
# Screenshots
(Replace screenshots)





## Local Development Setup
You can run Gatus locally with Docker for testing:

# Prerequisites
Docker
Git

## Steps

# 1. Clone the repository
git clone https://github.com/your-org/gatus-ecs-deployment.git
cd gatus-ecs-deployment

# 2. Build Docker image
docker build -t gatus .

# 3. Run container locally
docker run -p 8080:8080 gatus





## Why This Project?
This project demonstrates:

Real-world DevOps skills – AWS ECS, ALB, ACM, Cloudflare DNS, ECR, IAM.

Automation – Full IaC with Terraform and CI/CD with GitHub Actions.

Security – Private subnets, HTTPS-only traffic, least-privilege IAM roles.

Scalability – Modular design, easily extensible for future workloads.

Perfect for showcasing hands-on DevSecOps capability in interviews or portfolios.





