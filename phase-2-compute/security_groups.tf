# ─────────────────────────────────────────────
# Bastion Security Group — SSH inbound from your IP only
# ─────────────────────────────────────────────

resource "aws_security_group" "bastion" {
  name        = "${var.project_name}-bastion-sg"
  description = "Bastion host - SSH inbound from allowed CIDRs only"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "SSH from allowed CIDRs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-bastion-sg"
  })
}

# ─────────────────────────────────────────────
# Private Instance Security Group
# Only accepts SSH from the bastion SG — not the internet
# ─────────────────────────────────────────────

resource "aws_security_group" "private_instance" {
  name        = "${var.project_name}-private-instance-sg"
  description = "Private instances - SSH from bastion only"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description     = "SSH from bastion only"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-instance-sg"
  })
}
