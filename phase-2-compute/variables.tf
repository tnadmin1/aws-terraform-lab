variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix applied to all resource names and tags"
  type        = string
  default     = "tf-lab"
}

variable "bastion_instance_type" {
  description = "EC2 instance type for the bastion host"
  type        = string
  default     = "t3.micro"
}

variable "private_instance_type" {
  description = "EC2 instance type for the private instance"
  type        = string
  default     = "t3.micro"
}

variable "allowed_ssh_cidrs" {
  description = "List of CIDRs allowed to SSH to the bastion host. Set to your public IP: [\"x.x.x.x/32\"]"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    Project     = "aws-terraform-lab"
    Environment = "lab"
    ManagedBy   = "terraform"
  }
}
