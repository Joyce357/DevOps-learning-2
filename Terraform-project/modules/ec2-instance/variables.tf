variable "name" {
  description = "Name assigned to the EC2 instance."
  type        = string
  default     = "test-ec2"
}

variable "distribution" {
  description = "OS to locate when ami_id is not supplied."
  type        = string
  default     = "amazon-linux-2023"

  validation {
    condition     = contains(["amazon-linux-2023", "amazon-linux-2", "ubuntu-24.04", "ubuntu-22.04", "debian-12", "rhel-9"], var.distribution)
    error_message = "distribution must be amazon-linux-2023, amazon-linux-2, ubuntu-24.04, ubuntu-22.04, debian-12, or rhel-9."

  }
}

variable "architecture" {
  description = "AMI CPU architecture; it must match the chosen instance type."
  type        = string
  default     = "x86_64"

  validation {
    condition     = contains(["x86_64", "arm64"], var.architecture)
    error_message = "architecture must be x86_64 or arm64."

  }
}

variable "ami_id" {
  description = "Optional explicit AMI ID, bypassing distribution lookup."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet in which to launch the instance."
  type        = string
}
variable "security_group_ids" {
  description = "Security groups attached to the instance."
  type        = list(string)
  default     = []
}
variable "associate_public_ip_address" {
  description = "Whether to assign a public IPv4 address."
  type        = bool
  default     = false
}
variable "key_name" {
  description = "Optional existing EC2 key pair name."
  type        = string
  default     = null
}
variable "iam_instance_profile" {
  description = "Optional IAM instance profile name."
  type        = string
  default     = null
}
variable "user_data" {
  description = "Optional cloud-init or shell user data."
  type        = string
  default     = null
  sensitive   = true
}
variable "user_data_replace_on_change" {
  description = "Replace the instance when user data changes."
  type        = bool
  default     = false
}
variable "detailed_monitoring" {
  description = "Enable one-minute CloudWatch metrics."
  type        = bool
  default     = false
}
variable "disable_api_termination" {
  description = "Enable EC2 termination protection."
  type        = bool
  default     = false
}
variable "ebs_optimized" {
  description = "Enable EBS optimization."
  type        = bool
  default     = true
}
variable "require_imdsv2" {
  description = "Require session tokens for instance metadata."
  type        = bool
  default     = true
}
variable "metadata_hop_limit" {
  description = "Allowed network hops for metadata responses."
  type        = number
  default     = 1
}
variable "instance_metadata_tags" {
  description = "Expose instance tags through metadata."
  type        = bool
  default     = false
}
variable "root_volume_type" {
  description = "Root EBS volume type."
  type        = string
  default     = "gp3"
}
variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 20
}
variable "root_volume_iops" {
  description = "IOPS for gp3/io volumes."
  type        = number
  default     = 3000
}
variable "root_volume_throughput" {
  description = "Throughput in MiB/s for gp3."
  type        = number
  default     = 125
}
variable "root_volume_encrypted" {
  description = "Encrypt the root EBS volume."
  type        = bool
  default     = true
}
variable "root_volume_kms_key_id" {
  description = "Optional KMS key ARN for root encryption."
  type        = string
  default     = null
}
variable "tags" {
  description = "Additional resource tags."
  type        = map(string)
  default     = {}
}
