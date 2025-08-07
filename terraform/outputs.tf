output "custom_domain_url" {
  description = "The custom HTTPS domain for the Gatus app"
  value       = "https://${module.dns.domain_name}"
}

#ALB Outputs
#output "alb_dns_name" {
#description = "DNS name of the Application Load Balancer"
#  value       = module.alb.alb_dns_name
#}

#ECS Cluster Outputs
output "ecs_cluster_name" {
  description = "Name of the ECS Cluster"
  value       = module.ecs_cluster.cluster_name
}

#ECS Task Definition 
output "task_definition_arn" {
  description = "ARN of the ECS Task Definition"
  value       = module.ecs_task.task_definition_arn
}

#IAM Outputs 
output "execution_role_arn" {
  description = "ARN of the ECS task execution role"
  value       = module.iam.execution_role_arn
}
