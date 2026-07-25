locals {
  environment  = "dev"
  aws_region   = "us-east-1"
  project_name = "terragrunt-project"

  vpc_cidr             = "10.10.0.0/16"
  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]

  distribution     = "ubuntu-24.04"
  architecture     = "x86_64"
  instance_type    = "t3.micro"
  root_volume_size = 20
  admin_cidr       = "203.0.113.10/32" # Replace with your public IP/32.
}
