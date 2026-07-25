# Terraform AWS modules

This project contains reusable modules for a VPC, security group, and EC2 instance.

## EC2 distributions

The EC2 module finds the newest official AMI in the selected AWS region. Supported values are `amazon-linux-2023`, `amazon-linux-2`, `ubuntu-24.04`, `ubuntu-22.04`, `debian-12`, and `rhel-9`, on `x86_64` or `arm64`. The instance type must support the selected architecture. Set `ami_id` to use another image.

## Layout

- `modules/vpc`: VPC, public/private subnets, routing, optional NAT, and optional IPv6.
- `modules/security-group`: security group with named ingress and egress rules.
- `modules/ec2-instance`: distribution-aware EC2 instance with encrypted gp3 storage and IMDSv2 by default.
- `environments/dev`: public development instance; uses the configured S3 backend.
- `environments/staging`: public staging instance.
- `environments/sandbox`: minimal public sandbox instance.
- `environments/production`: private production instance with NAT and termination protection.

## Deploy an environment

```shell
cd environments/staging
# Replace admin_cidr in terraform.tfvars with your trusted public IP/32
# and set key_name to an existing EC2 key pair.
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when the class exercise is complete. EC2 instances,
public IPv4 addresses, EBS volumes, and the production NAT gateway can incur
AWS charges.
