variable "aws_region" {
  description = "AWS region in which to deploy development resources."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used in resource names and tags."
  type        = string
  default     = "terraform-project"
}

variable "vpc_cidr" {
  description = "Development VPC IPv4 CIDR."
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Development public subnet CIDRs."
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Development private subnet CIDRs."
  type        = list(string)
  default     = ["10.10.11.0/24", "10.10.12.0/24"]
}

variable "admin_cidr" {
  description = "Trusted administrator IPv4 CIDR allowed to use SSH."
  type        = string
}

variable "distribution" {
  description = "Operating-system distribution passed to the EC2 module."
  type        = string
  default     = "ubuntu-24.04"
}

variable "architecture" {
  description = "EC2 AMI architecture."
  type        = string
  default     = "x86_64"
}

variable "instance_type" {
  description = "Development EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "Development root disk size in GiB."
  type        = number
  default     = 20
}

variable "key_name" {
  description = "Optional existing EC2 key-pair name."
  type        = string
  default     = null
}
