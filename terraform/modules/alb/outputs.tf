output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.gatus_alb.dns_name
}

output "target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.gatus.arn
}

output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.gatus_alb.arn
}
