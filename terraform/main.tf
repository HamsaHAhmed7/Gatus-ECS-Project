module "vpc" {
  source = "./modules/vpc"

  name         = var.project_name
  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr

}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "ecs_cluster" {
  source       = "./modules/ecs-cluster"
  cluster_name = var.cluster_name
}

module "ecs_task" {
  source             = "./modules/ecs-task"
  family             = var.task_family
  execution_role_arn = module.iam.execution_role_arn
  image_url          = var.image_url
  aws_region         = var.aws_region
}

module "ecs_service" {
  source              = "./modules/ecs-service"
  service_name        = var.service_name
  cluster_id          = module.ecs_cluster.cluster_arn
  task_definition_arn = module.ecs_task.task_definition_arn
  subnets_id_list     = module.vpc.private_subnet_ids
  sg_id               = module.sg.ecs_sg_id
  target_group_arn    = module.alb.target_group_arn
  container_name      = "gatus"
  container_port      = 8080
}

module "acm" {
  source         = "./modules/acm"
  domain_name    = var.domain_name
  hosted_zone_id = var.hosted_zone_id
}

module "alb" {
  source          = "./modules/alb"
  vpc_id          = module.vpc.vpc_id
  subnets_id_list = module.vpc.public_subnet_ids
  sg_id           = module.sg.alb_sg_id
  certificate_arn = module.acm.certificate_arn
}

module "dns" {
  source         = "./modules/route53"
  domain_name    = var.domain_name
  hosted_zone_id = var.hosted_zone_id
  alb_dns_name   = module.alb.alb_dns_name
  alb_zone_id    = module.alb.alb_zone_id
}