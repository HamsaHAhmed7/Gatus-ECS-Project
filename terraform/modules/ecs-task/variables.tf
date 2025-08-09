variable "family" {
  description = "The family name for the ECS task definition"
  type        = string
  default     = "gatus-task"
}

variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the ECS task role (optional)"
  type        = string
  default     = null
}

variable "image_url" {
  description = "Docker image URL for the Gatus container"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 8080
}

variable "cpu" {
  description = "CPU units for the container"
  type        = number
  default     = 256 
}

variable "memory" {
  description = "Memory (in MiB) for the container"
  type        = number
  default     = 512
}

variable "aws_region" {
  description = "AWS region where the ECS task will run"
  type        = string
  default     = "eu-west-2"
}
