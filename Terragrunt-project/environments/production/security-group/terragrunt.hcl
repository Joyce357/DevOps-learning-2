include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl")).locals
}

terraform {
  source = "../../../modules/security-group"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "vpc-00000000000000000"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

inputs = {
  name        = "${local.environment.project_name}-${local.environment.environment}-ec2"
  description = "Production EC2 access"
  vpc_id      = dependency.vpc.outputs.vpc_id

  ingress_rules = {
    https_from_vpc = {
      description = "HTTPS from inside the VPC"
      from_port   = 443
      to_port     = 443
      cidr_ipv4   = local.environment.vpc_cidr
    }
  }
}
