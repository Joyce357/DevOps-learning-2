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
  skip_outputs = get_terraform_command() == "init"

  mock_outputs = {
    vpc_id = "vpc-00000000000000000"
  }
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
}

inputs = {
  name        = "${local.environment.project_name}-${local.environment.environment}-ec2"
  description = "Development EC2 access"
  vpc_id      = dependency.vpc.outputs.vpc_id

  ingress_rules = {
    ssh = {
      description = "SSH from the administrator network"
      from_port   = 22
      to_port     = 22
      cidr_ipv4   = local.environment.admin_cidr
    }
    http = {
      description = "HTTP from the internet"
      from_port   = 80
      to_port     = 80
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}
