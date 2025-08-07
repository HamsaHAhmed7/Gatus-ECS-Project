variable "domain_name" {
  description = "Domain name to issue the certificate for"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string
}
