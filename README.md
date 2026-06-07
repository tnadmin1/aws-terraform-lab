# aws-terraform-lab

> **Production-grade AWS infrastructure automation using Terraform — built to demonstrate real-world Cloud Engineering and Infrastructure-as-Code practices.**

[![Terraform](https://img.shields.io/badge/Terraform-1.7%2B-7B42BC?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Multi--Service-FF9900?logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Phase](https://img.shields.io/badge/Phase-1%20Complete-brightgreen)]()

---

## Overview

This repository is a modular, phased Terraform lab that provisions and manages real AWS infrastructure. Each phase builds on the last, progressing from core networking fundamentals to production-grade multi-tier architectures with remote state management, reusable modules, and cloud-native integrations.

Built and validated against live AWS environments. Every phase is fully documented with architecture diagrams, variable references, and usage examples.

**Target roles demonstrated:** Cloud Engineer · Cloud Administrator · Infrastructure Engineer · Network Engineer

---

## Capability Roadmap

| Phase | Capability | Status |
|-------|-----------|--------|
| Phase 1 | Core VPC — subnets, IGW, route tables, security groups | ✅ Complete |
| Phase 2 | EC2 instances, key pairs, IAM roles, outputs | 🔲 Planned |
| Phase 3 | Reusable modules — VPC, compute, security | 🔲 Planned |
| Phase 4 | Remote state — S3 backend + DynamoDB state locking | 🔲 Planned |
| Phase 5 | Multi-tier architecture — public/private subnets, NAT Gateway, bastion host | 🔲 Planned |
| Phase 6 | Auto Scaling Groups, ALB, Launch Templates | 🔲 Planned |
| Phase 7 | Cloud-native integrations — RDS, S3, CloudWatch alarms, SNS | 🔲 Planned |

---

## Architecture — Phase 1

```
┌─────────────────────────────────────────────────────────────┐
│                    AWS Region (us-east-1)                    │
│  ┌──────────────────────────────────────────────────────┐   │
│  │                VPC: 10.0.0.0/16                      │   │
│  │                                                      │   │
│  │   ┌────────────────────┐  ┌────────────────────┐    │   │
│  │   │  Public Subnet A   │  │  Public Subnet B   │    │   │
│  │   │   10.0.1.0/24      │  │   10.0.2.0/24      │    │   │
│  │   │   us-east-1a       │  │   us-east-1b       │    │   │
│  │   └────────┬───────────┘  └───────────┬────────┘    │   │
│  │            │                          │             │   │
│  │   ┌────────────────────┐  ┌────────────────────┐    │   │
│  │   │  Private Subnet A  │  │  Private Subnet B  │    │   │
│  │   │   10.0.11.0/24     │  │   10.0.12.0/24     │    │   │
│  │   │   us-east-1a       │  │   us-east-1b       │    │   │
│  │   └────────────────────┘  └────────────────────┘    │   │
│  │                                                      │   │
│  │   ┌──────────────────────────────────────────────┐   │   │
│  │   │     Internet Gateway + Public Route Table    │   │   │
│  │   └──────────────────────────────────────────────┘   │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

---

## Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| IaC | Terraform 1.7+ | Infrastructure provisioning and lifecycle management |
| Cloud | AWS | Target platform |
| State (Phase 4) | S3 + DynamoDB | Remote state storage and locking |
| CI/CD (Planned) | GitHub Actions | Automated plan/apply pipelines |

---

## Repository Structure

```
aws-terraform-lab/
├── phase-1-vpc/
│   ├── main.tf               # Root module — provider, VPC, IGW
│   ├── subnets.tf            # Public and private subnet definitions
│   ├── routing.tf            # Route tables and associations
│   ├── security_groups.tf    # Default security group rules
│   ├── variables.tf          # Input variable declarations
│   ├── outputs.tf            # Output values (VPC ID, subnet IDs, etc.)
│   ├── terraform.tfvars      # Variable values (not committed if sensitive)
│   └── README.md             # Phase-specific documentation
├── phase-2-compute/          # (Planned)
├── phase-3-modules/          # (Planned)
├── phase-4-remote-state/     # (Planned)
├── phase-5-multi-tier/       # (Planned)
├── .gitignore
└── README.md
```

---

## Prerequisites

- Terraform >= 1.7.0 — [Install Guide](https://developer.hashicorp.com/terraform/install)
- AWS CLI v2 configured with appropriate credentials
- An AWS account with IAM permissions for VPC, EC2, and S3

---

## Quick Start — Phase 1

```bash
# Clone the repository
git clone https://github.com/tnadmin1/aws-terraform-lab.git
cd aws-terraform-lab/phase-1-vpc

# Initialize Terraform (downloads AWS provider)
terraform init

# Review the execution plan
terraform plan

# Apply infrastructure
terraform apply

# When finished — destroy to avoid charges
terraform destroy
```

---

## Security Notes

- `terraform.tfvars` and any files containing account IDs or access keys are excluded via `.gitignore`
- No hardcoded credentials anywhere in this repository — all auth handled via AWS CLI profiles or environment variables
- Security groups follow least-privilege principles — no `0.0.0.0/0` ingress rules in production configurations

---

## Lab Environment

Validated against a live AWS account (us-east-1). All `terraform plan` and `terraform apply` outputs are captured in phase-level READMEs.

---

## Author

**Carson** — U.S. Army 25H | Network & Cloud Engineer  
CCNA · Security+ · CySA+ · PenTest+ · CEH · Network+ · Linux Essentials  
[GitHub](https://github.com/tnadmin1) · [Network Automation Toolkit](https://github.com/tnadmin1/Network-Automation-Toolkit)

---

## License

MIT — see [LICENSE](LICENSE)
