ECS: End-to-End DevOps Deployment of Gatus on AWS
Terraform · GitHub Actions · Docker · AWS

Gatus Uptime Monitoring – Overview
Welcome to the Gatus ECS Project, a production-ready, containerised uptime monitoring solution deployed to AWS using modern DevOps practices.

Gatus is an open-source service that continuously monitors your endpoints and provides a visual status dashboard. This project demonstrates the full DevOps lifecycle — from containerisation and CI/CD to automated AWS infrastructure provisioning — all while enforcing best practices for scalability, automation, and security.

The application runs inside private subnets within AWS, ensuring workloads are isolated from direct public exposure. All incoming traffic is routed through an Application Load Balancer (ALB) in a public subnet, with HTTPS enabled via AWS Certificate Manager (ACM) and DNS management handled by Route 53.

Infrastructure is fully automated with Terraform, and GitHub Actions handles the build, push, and deployment process. Docker images are pushed to Amazon ECR, and IAM follows the principle of least privilege.

This architecture is a practical, interview-ready example of an automated, secure cloud deployment.

Live Demo
🌐 https://gatus.hamsa-ahmed.co.uk

Key Highlights
Private Subnet Isolation: ECS Fargate tasks run in private subnets with no direct internet access.

HTTPS Security: End-to-end encryption using ACM-issued TLS certificates.

Infrastructure as Code: Fully modular Terraform for consistent, repeatable deployments.

CI/CD Pipeline: GitHub Actions automates Docker builds, ECR pushes, and Terraform applies/destroys.

Custom Config: Gatus configured to monitor its own health endpoint and the public domain over HTTPS.

Technologies Used
Category	Tools/Services
Cloud	AWS ECS (Fargate), ALB, ECR, ACM, VPC, CloudWatch
DNS & TLS	Route 53, ACM TLS Certificates
IaC	Terraform (Modular)
CI/CD	GitHub Actions
Security	IAM (Least Privilege), HTTPS
Container	Docker

Architecture Overview
This deployment follows a multi-subnet VPC design:

Public Subnet
Application Load Balancer (ALB)

ACM Certificates

Route 53 DNS routing

Private Subnet
ECS Fargate tasks running the Gatus container

NAT Gateway for outbound traffic only (e.g., updates)

No inbound traffic allowed directly

Flow:
Route 53 → ALB (HTTPS) → ECS Fargate (Private Subnet)

Architecture Diagram
(Insert Lucidchart/draw.io/mermaid diagram here showing GitHub Actions → ECR → Terraform → ECS → ALB → HTTPS → Route 53)

Project Structure
bash
Copy
Edit
Gatus-ECS-Project/
├── Docker/
│   ├── Dockerfile
│   └── config.yaml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── modules/
│   │   ├── ecs-cluster/
│   │   ├── ecs-task/
│   │   ├── ecs-service/
│   │   ├── alb/
│   │   ├── acm/
│   │   ├── route53/
│   │   └── sg/
├── .github/
│   └── workflows/
│       ├── main.yml   # Build, push, deploy
│       └── destroy.yml # Destroy infrastructure
CI/CD Workflow Overview
Deployment Steps:

Push to main branch or trigger workflow manually.

GitHub Actions builds Docker image from ./Docker and pushes to Amazon ECR.

Terraform runs via GitHub Actions to provision ECS, ALB, ACM, Route 53, IAM, and networking.

ECS Fargate launches container with latest image.

ALB routes HTTPS traffic to ECS tasks.

Destroy Steps:

Manually trigger the destroy.yml workflow in GitHub Actions.

Screenshots
(Add screenshots of your live Gatus dashboard and domain here)

Local Development Setup
Prerequisites:

Docker

AWS CLI

Terraform

GitHub CLI (optional)

Run locally:

bash
Copy
Edit
# 1. Clone repository
git clone https://github.com/<your-username>/Gatus-ECS-Project.git
cd Gatus-ECS-Project

# 2. Build Docker image
docker build -t gatus-project:latest -f Docker/Dockerfile Docker

# 3. Run container locally
docker run -p 8080:8080 gatus-project:latest
Visit: http://localhost:8080

Why This Project?
This project demonstrates real-world DevOps capabilities:

Cloud-native deployment on AWS ECS Fargate

Automated infrastructure with Terraform modules

End-to-end CI/CD pipeline with GitHub Actions

Security best practices: HTTPS, least privilege IAM, no public ECS access

Interview-ready example for showcasing DevOps skills

License
MIT License — free to use, modify, and deploy.
