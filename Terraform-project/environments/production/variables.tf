variable "aws_region" {
  description = "AWS region in which to deploy production resources."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used in resource names and tags."
  type        = string
  default     = "terraform-project"
}

variable "vpc_cidr" {
  description = "Production VPC IPv4 CIDR."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Production public subnet CIDRs used by the NAT gateway."
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Production private subnet CIDRs."
  type        = list(string)
  default     = ["10.20.11.0/24", "10.20.12.0/24"]
}

variable "distribution" {
  description = "Operating-system distribution passed to the EC2 module."
  type        = string
  default     = "amazon-linux-2023"
}

variable "architecture" {
  description = "EC2 AMI architecture."
  type        = string
  default     = "x86_64"
}

variable "instance_type" {
  description = "Production EC2 instance type."
  type        = string
  default     = "t3.small"
}

variable "root_volume_size" {
  description = "Production root disk size in GiB."
  type        = number
  default     = 40
}

variable "root_volume_kms_key_id" {
  description = "Optional customer-managed KMS key ARN for the root volume."
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "Optional IAM instance-profile name for production EC2."
  type        = string
  default     = null
}
