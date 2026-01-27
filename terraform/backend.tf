terraform {
  backend "s3" {
    bucket         = "gatus-tf-state-hamsa"
    key            = "envs/prod/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "gatus-tf-locks"
    encrypt        = true
  }

}
