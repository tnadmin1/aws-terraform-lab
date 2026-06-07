# terraform.tfvars — Phase 2
# IMPORTANT: Set allowed_ssh_cidrs to your actual public IP before applying
# Find your IP at: https://checkip.amazonaws.com

aws_region            = "us-east-1"
project_name          = "tf-lab"
bastion_instance_type = "t3.micro"
private_instance_type = "t3.micro"

# Replace with your actual public IP for security — do not leave as 0.0.0.0/0 in production
allowed_ssh_cidrs = ["174.110.64.205/32"]

common_tags = {
  Project     = "aws-terraform-lab"
  Environment = "lab"
  ManagedBy   = "terraform"
}
