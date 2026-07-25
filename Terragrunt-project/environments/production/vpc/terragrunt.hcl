include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl")).locals
}

terraform {
  source = "../../../modules/vpc"
}

inputs = {
  name                 = "${local.environment.project_name}-${local.environment.environment}"
  cidr_block           = local.environment.vpc_cidr
  availability_zones   = ["ca-central-1a", "ca-central-1b"]
  public_subnet_cidrs  = local.environment.public_subnet_cidrs
  private_subnet_cidrs = local.environment.private_subnet_cidrs
  enable_nat_gateway   = true
}
