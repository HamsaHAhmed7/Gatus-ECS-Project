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