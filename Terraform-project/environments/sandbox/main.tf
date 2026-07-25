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
  name = "${var.project_name}-sandbox"
  common_tags = {
    Project     = var.project_name
    Environment = "sandbox"
    ManagedBy   = "Terraform"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  name                 = local.name
  cidr_block           = var.vpc_cidr
  availability_zones   = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = []
  enable_nat_gateway   = false
  tags                 = local.common_tags
}

module "ec2_security_group" {
  source = "../../modules/security-group"

  name        = "${local.name}-ec2"
  description = "Sandbox web server access"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = {
    ssh = {
      description = "SSH from the administrator network"
      from_port   = 22
      to_port     = 22
      cidr_ipv4   = var.admin_cidr
    }
    http = {
      description = "HTTP from the internet"
      from_port   = 80
      to_port     = 80
      cidr_ipv4   = "0.0.0.0/0"
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
  subnet_id                   = module.vpc.public_subnet_ids[0]
  security_group_ids          = [module.ec2_security_group.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  root_volume_size            = var.root_volume_size
  tags                        = local.common_tags
}
