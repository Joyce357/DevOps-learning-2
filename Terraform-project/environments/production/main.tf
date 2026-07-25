terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name = "${var.project_name}-production"
  common_tags = {
    Project     = var.project_name
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  name                 = local.name
  cidr_block           = var.vpc_cidr
  availability_zones   = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = true
  tags                 = local.common_tags
}

module "ec2_security_group" {
  source = "../../modules/security-group"

  name        = "${local.name}-ec2"
  description = "Production EC2 access"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = {
    https_from_vpc = {
      description = "HTTPS from inside the VPC"
      from_port   = 443
      to_port     = 443
      cidr_ipv4   = var.vpc_cidr
    }
  }

  tags = local.common_tags
}

module "ec2_instance" {
  source = "../../modules/ec2-instance"

  name                        = "${local.name}-server"
  distribution                = var.distribution
  architecture                = var.architecture
  instance_type               = var.instance_type
  subnet_id                   = module.vpc.private_subnet_ids[0]
  security_group_ids          = [module.ec2_security_group.id]
  associate_public_ip_address = false
  iam_instance_profile        = var.iam_instance_profile
  root_volume_size            = var.root_volume_size
  root_volume_kms_key_id      = var.root_volume_kms_key_id
  detailed_monitoring         = true
  disable_api_termination     = true
  tags                        = local.common_tags
}
