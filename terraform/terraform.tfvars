image_url = "016873651140.dkr.ecr.eu-west-2.amazonaws.com/gatus-project:latest"

project_name = "gatus"
environment  = "production"
aws_region   = "eu-west-2"

domain_name    = "gatus.hamsa-ahmed.co.uk"
hosted_zone_id = "Z07385433QNXDZZ6RBE0E"

vpc_cidr = "10.0.0.0/16"

cluster_name = "gatus-cluster"
service_name = "gatus-service"
task_family  = "gatus-task"