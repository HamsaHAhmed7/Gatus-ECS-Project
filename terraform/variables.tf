variable "vpc_id" {
  description = "The ID of the VPC where all resources will be created."
  type        = string
  default     = "vpc-0c99b83f91ca5ab91" 
}

variable "subnets_id_list" {
  description = "Public subnet IDs for the ALB"
  type        = list(string)
}


