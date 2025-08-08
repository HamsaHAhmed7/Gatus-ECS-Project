resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = var.cluster_id
  # task_definition = var.task_definition_arn
  launch_type     = "FARGATE"
  desired_count   = var.desired_count
  force_new_deployment = true


  network_configuration {
    subnets         = var.subnets_id_list
    security_groups = [var.sg_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  lifecycle {
    ignore_changes = [task_definition] # So you can update it separately
  }

  depends_on = [
    var.target_group_arn
  ]
}
