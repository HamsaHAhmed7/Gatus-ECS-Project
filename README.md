# Gatus ECS Project

Production deployment of Gatus (uptime monitoring tool) on AWS ECS Fargate with Terraform and GitHub Actions.

[![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![Docker](https://img.shields.io/badge/Container-Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)

## Live Demo

https://github.com/user-attachments/assets/d1f58ef3-babf-4931-8671-de25c05f3932

## Overview

Gatus runs in ECS Fargate behind an ALB with HTTPS and a custom domain. GitHub Actions handles CI/CD - builds the Docker image, pushes to ECR, and deploys infrastructure with Terraform.

![Architecture](docs/gatus2new-Page-2.drawio.png)

**Architecture:** ALB in public subnets → ECS tasks in private subnets → NAT gateways for outbound internet access

## Key Features

- **Multi-AZ deployment** - High availability across 2 availability zones
- **Automated SSL** - ACM certificates with DNS validation
- **Security scanning** - Pre-commit hooks with tfsec
- **Modular Terraform** - Reusable infrastructure components
- **CI/CD pipeline** - Plan on PR, deploy on merge

## Quick Start
```bash
git clone https://github.com/HamsaHAhmed7/Gatus-ECS-Project.git
cd Gatus-ECS-Project/terraform

# Edit terraform.tfvars with your details
terraform init
terraform apply
```

Required variables in `terraform.tfvars`:
```terraform
domain_name    = "gatus.your-domain.com"
hosted_zone_id = "YOUR_ROUTE53_ZONE_ID"
image_url      = "ACCOUNT_ID.dkr.ecr.REGION.amazonaws.com/gatus-project:latest"
```

## Project Structure
```
terraform/
├── main.tf              # Root module
├── terraform.tfvars     # Configuration
├── modules/
│   ├── vpc/            # Networking
│   ├── alb/            # Load balancer
│   ├── ecs-*/          # Container orchestration
│   ├── acm/            # SSL certificates
│   └── route53/        # DNS
└── .github/workflows/   # CI/CD pipelines
```

## CI/CD Workflows

**Plan** (on PR) - Runs `terraform plan` to preview changes

**Deploy** (on main) - Builds image → Pushes to ECR → Applies Terraform

**Destroy** (manual) - Tears down all infrastructure

## Shift-Left Security

Pre-commit hooks run before every commit:
```bash
pre-commit install
```

Checks: terraform fmt, tfsec scanning, file formatting

## Local Development
```bash
cd Docker
docker build -t gatus-local .
docker run -p 8080:8080 gatus-local
```

## Screenshots

**Gatus Dashboard**
![Gatus UI](docs/gatus-ui.png)

**Terraform Deployment**
![Terraform Apply](docs/terraform-apply.png)

**AWS ECS Cluster**
![AWS ECS](docs/aws-ecs-cluster.png)

**Infrastructure Teardown**
![Terraform Destroy](docs/terraform-destroy.png)

## Cost Estimate

Monthly cost (London region):
- ECS Fargate: ~£12
- NAT Gateways (2): ~£52
- ALB: ~£16
- **Total: ~£80/month**

## Requirements

- AWS account
- Domain with Route53 hosted zone
- Terraform >= 1.5
- Docker
- AWS CLI configured

## License

MIT