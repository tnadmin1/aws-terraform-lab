output "bastion_public_ip" {
  description = "Public IP of the bastion host"
  value       = aws_instance.bastion.public_ip
}

output "bastion_instance_id" {
  description = "Instance ID of the bastion host"
  value       = aws_instance.bastion.id
}

output "private_instance_id" {
  description = "Instance ID of the private instance"
  value       = aws_instance.private.id
}

output "private_instance_private_ip" {
  description = "Private IP of the private instance"
  value       = aws_instance.private.private_ip
}

output "key_pair_name" {
  description = "Name of the AWS key pair"
  value       = aws_key_pair.bastion.key_name
}

output "private_key_path" {
  description = "Local path to the generated private key"
  value       = local_file.private_key.filename
  sensitive   = true
}

output "iam_role_arn" {
  description = "ARN of the EC2 IAM role"
  value       = aws_iam_role.ec2_role.arn
}

output "ssh_command" {
  description = "SSH command to connect to the bastion host"
  value       = "ssh -i ${local_file.private_key.filename} ec2-user@${aws_instance.bastion.public_ip}"
  sensitive   = true
}
