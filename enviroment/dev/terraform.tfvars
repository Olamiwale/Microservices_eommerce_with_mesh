#enviroment/dev/terraform.tfvars

environment          = "dev"
aws_region           = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
node_instance_type   = "t3.small"
desired_nodes        = 1
min_nodes            = 1
max_nodes            = 2