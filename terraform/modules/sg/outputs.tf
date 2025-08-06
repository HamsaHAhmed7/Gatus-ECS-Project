output "sg_id" {
  description = "The ID of the ALB security group"
  value       = aws_security_group.alb.id
}
output "sg_name" {
  description = "The name of the ALB security group"
  value       = aws_security_group.alb.name
}

output "ecs_sg_id" {
  value = aws_security_group.ecs.id
}
