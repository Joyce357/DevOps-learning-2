locals {
  environment_config = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  environment        = local.environment_config.locals.environment
  aws_region         = local.environment_config.locals.aws_region
  project_name       = local.environment_config.locals.project_name
}

remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket  = get_env("TG_STATE_BUCKET", "backupreplicatedbucket01")
    key     = "terragrunt/${path_relative_to_include()}/terraform.tfstate"
    region  = local.aws_region
    encrypt = true
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "aws" {
      region = "${local.aws_region}"

      default_tags {
        tags = {
          Project     = "${local.project_name}"
          Environment = "${local.environment}"
          ManagedBy   = "Terragrunt"
        }
      }
    }
  EOF
}

inputs = {
  tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "Terragrunt"
  }
}
