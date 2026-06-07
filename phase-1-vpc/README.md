# Phase 1 — Core VPC

Provisions the foundational AWS network layer: VPC, public/private subnets across two availability zones, Internet Gateway, route tables, and a baseline security group.

---

## Resources Deployed

| Resource | Name | Description |
|----------|------|-------------|
| `aws_vpc` | tf-lab-vpc | Main VPC — 10.0.0.0/16 |
| `aws_internet_gateway` | tf-lab-igw | Internet Gateway attached to VPC |
| `aws_subnet` (x2 public) | tf-lab-public-subnet-1/2 | Public subnets in us-east-1a and us-east-1b |
| `aws_subnet` (x2 private) | tf-lab-private-subnet-1/2 | Private subnets in us-east-1a and us-east-1b |
| `aws_route_table` | tf-lab-public-rtb | Routes 0.0.0.0/0 → IGW |
| `aws_route_table` | tf-lab-private-rtb | Isolated (no IGW); NAT added in Phase 5 |
| `aws_security_group` | tf-lab-baseline-sg | No inbound, all outbound — extended in Phase 2 |

---

## Usage

```bash
cd phase-1-vpc

terraform init
terraform plan
terraform apply
terraform destroy   # Always destroy when done to avoid charges
```

---

## Outputs

| Output | Description |
|--------|-------------|
| `vpc_id` | VPC resource ID |
| `vpc_cidr` | VPC CIDR block |
| `internet_gateway_id` | IGW resource ID |
| `public_subnet_ids` | List of public subnet IDs |
| `private_subnet_ids` | List of private subnet IDs |
| `public_route_table_id` | Public RTB ID |
| `private_route_table_id` | Private RTB ID |
| `baseline_security_group_id` | Baseline SG ID |

---

## Design Decisions

- **Dual-AZ layout** — subnets span two availability zones to establish HA patterns from the start, even before EC2 is introduced in Phase 2
- **Separate route tables** — public and private route tables are distinct resources; private has no IGW route until NAT Gateway is introduced in Phase 5
- **`count` over `for_each`** for subnets — keeps the code readable at this phase; will refactor to `for_each` with maps in the modules phase
- **Baseline SG** — egress-only SG created now so Phase 2 EC2 instances have a known starting security posture
- **`common_tags` variable** — all resources receive consistent tags for cost tracking and resource organization
