variable "domain_name" {
  type = string
}

variable "hosted_zone_id" {
  type = string
}

variable "alb_dns_name" {
  type = string
}

variable "alb_zone_id" {
  description = "The hosted zone ID of the ALB"
  type        = string
}
