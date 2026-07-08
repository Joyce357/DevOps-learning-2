variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default = "ca-central-1"
}



variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default = "ami-0c08b0f4f9d446eaa"
  
}


variable "instance_type" {
  description = "EC2 instance type for the web server"
  type        = string
  default = "t2.medium"
}



variable "key_name" {
  description = "Optional EC2 key pair name for SSH access"
  type        = string
  default     = null
}

