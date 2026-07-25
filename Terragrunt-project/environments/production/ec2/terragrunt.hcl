include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl")).locals
}

terraform {
  source = "../../../modules/ec2-instance"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    private_subnet_ids = ["subnet-00000000000000000"]
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

dependency "security_group" {
  config_path = "../security-group"

  mock_outputs = {
    id = "sg-00000000000000000"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

inputs = {
  name                        = "${local.environment.project_name}-${local.environment.environment}-server"
  distribution                = local.environment.distribution
  architecture                = local.environment.architecture
  instance_type               = local.environment.instance_type
  subnet_id                   = dependency.vpc.outputs.private_subnet_ids[0]
  security_group_ids          = [dependency.security_group.outputs.id]
  associate_public_ip_address = false
  root_volume_size            = local.environment.root_volume_size
  detailed_monitoring         = true
  disable_api_termination     = true
}
