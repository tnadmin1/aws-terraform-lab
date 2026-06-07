# ─────────────────────────────────────────────
# Default Security Group — placeholder for Phase 2
# Denies all inbound by default; allows all outbound
# ─────────────────────────────────────────────

resource "aws_security_group" "baseline" {
  name        = "${var.project_name}-baseline-sg"
  description = "Baseline security group - no inbound, all outbound"
  vpc_id      = aws_vpc.main.id

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-baseline-sg"
  })
}
