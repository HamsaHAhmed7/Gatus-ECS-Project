variable "image_url" {
  description = "Full ECR image URL including tag"
  type        = string
}

variable "project_name" {
  description = "Project name for resources"
  type        = string
}

variable "environment" {
  description = "Environment (production, staging, dev)"
  type        = string
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "service_name" {
  description = "ECS service name"
  type        = string
}

variable "task_family" {
  description = "ECS task definition family"
  type        = string
}
