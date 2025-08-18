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

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
  default     = 2
}

variable "nat_gateway_count" {
  description = "Number of NAT gateways"
  type        = number
  default     = 1
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT gateways"
  type        = bool
  default     = true
}

variable "enable_flow_logs" {
  description = "Whether to enable VPC flow logs"
  type        = bool
  default     = false
}

variable "flow_logs_retention_days" {
  description = "Retention in days for flow logs"
  type        = number
  default     = 14
}

variable "environment" {
  description = "Environment tag (e.g. production, staging)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name tag"
  type        = string
  default     = "default-project"
}
