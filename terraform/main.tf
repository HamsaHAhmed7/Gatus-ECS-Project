

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
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
  image_url          = var.image_url  
  aws_region         = "eu-west-2"
}



module "ecs_service" {
  source              = "./modules/ecs-service"
  service_name        = "gatus-service"
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
  domain_name    = "gatus.hamsa-ahmed.co.uk"
  hosted_zone_id = "Z07385433QNXDZZ6RBE0E"  
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
  domain_name    = "gatus.hamsa-ahmed.co.uk"
  hosted_zone_id = "Z07385433QNXDZZ6RBE0E"
  alb_dns_name   = module.alb.alb_dns_name
  alb_zone_id    = module.alb.alb_zone_id 
}

module "vpc" {
  source = "./modules/vpc"

  project_name            = "gatus"
  environment             = "production"
  vpc_cidr                = "10.0.0.0/16"
  public_subnet_count     = 2
  private_subnet_count    = 2
  enable_nat_gateway      = true
  nat_gateway_count       = 2
  enable_flow_logs        = true
  flow_logs_retention_days = 14
}
