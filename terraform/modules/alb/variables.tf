variable "sg_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "subnets_id_list" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where ALB and Target Group will be created"
  type        = string
}

variable "certificate_arn" {
  description = "ACM Certificate ARN for HTTPS"
  type        = string
}
