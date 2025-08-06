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
