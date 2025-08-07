resource "aws_route53_record" "gatus" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name        #
  type    = "A"

  alias {
    name                   = var.alb_dns_name      # ALB DNS
    zone_id                = var.alb_zone_id       # ALB Hosted Zone ID
    evaluate_target_health = true
  }
}
