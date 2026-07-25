locals {
  environment  = "production"
  aws_region   = "ca-central-1"
  project_name = "terragrunt-project"

  vpc_cidr             = "10.20.0.0/16"
  public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24"]
  private_subnet_cidrs = ["10.20.11.0/24", "10.20.12.0/24"]

  distribution     = "amazon-linux-2023"
  architecture     = "x86_64"
  instance_type    = "t3.large"
  root_volume_size = 80
}
