# terraform.tfvars
# Override any defaults from variables.tf here.
# Do NOT commit files containing AWS account IDs or access keys.

aws_region   = "us-east-1"
project_name = "tf-lab"
vpc_cidr     = "10.0.0.0/16"

availability_zones   = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]

common_tags = {
  Project     = "aws-terraform-lab"
  Environment = "lab"
  ManagedBy   = "terraform"
}
