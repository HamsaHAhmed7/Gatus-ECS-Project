variable "name" {
  description = "Name prefix for resources"
  type        = string
  default     = "gatus"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment tag (e.g. production, staging)"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Project name tag"
  type        = string
  default     = "gatus"
}