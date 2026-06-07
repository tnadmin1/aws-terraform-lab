# ─────────────────────────────────────────────
# IAM Role — EC2 assume role trust policy
# ─────────────────────────────────────────────

resource "aws_iam_role" "ec2_role" {
  name        = "${var.project_name}-ec2-role"
  description = "IAM role for EC2 instances - SSM access and read-only S3"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-ec2-role"
  })
}

# ─────────────────────────────────────────────
# IAM Policy Attachments
# ─────────────────────────────────────────────

# SSM Session Manager — allows browser/CLI shell access without opening port 22
resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# CloudWatch agent — allows instances to push metrics and logs
resource "aws_iam_role_policy_attachment" "cloudwatch_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# ─────────────────────────────────────────────
# Instance Profile — wraps the role for EC2 attachment
# ─────────────────────────────────────────────

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.ec2_role.name

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-ec2-profile"
  })
}
