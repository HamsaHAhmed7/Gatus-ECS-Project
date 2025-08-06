terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.7.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

module "sg" {
  source = "./modules/sg"
  vpc_id = var.vpc_id
}

module "alb" {
  source          = "./modules/alb"
  sg_id           = module.sg.sg_id
  subnets_id_list = var.subnets_id_list
  vpc_id          = var.vpc_id
}

module "iam" {
  source = "./modules/iam"
  create_task_role = true
}

module "ecs_cluster" {
  source       = "./modules/ecs-cluster"
  cluster_name = "gatus-cluster"
}

module "ecs_task" {
  source             = "./modules/ecs-task"
  family             = "gatus-task"
  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = null
  image_url          = "016873651140.dkr.ecr.eu-west-2.amazonaws.com/gatus-project:latest"
  aws_region         = "eu-west-2"
}

module "ecs_service" {
  source              = "./modules/ecs-service"
  service_name        = "gatus-service"
  cluster_id          = module.ecs_cluster.cluster_arn
  task_definition_arn = module.ecs_task.task_definition_arn
  subnets_id_list     = var.subnets_id_list
  sg_id               = module.sg.sg_id
  target_group_arn    = module.alb.target_group_arn
  container_name      = "gatus"
  container_port      = 8080
}

