variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the web server"
  type        = string

}


variable "key_name" {
  description = "Optional EC2 key pair name for SSH access"
  type        = string

}

variable "environment" {
  description = "Deployment environment name used in resource names and tags"
  type        = string
  default     = "dev"
}

variable "create_cloudwatch_alarm" {
  description = "Whether to create the bastion host CloudWatch CPU alarm"
  type        = bool
  default     = false
}

variable "cpu_alarm_threshold_percent" {
  description = "Average CPU utilization percentage that triggers the alarm"
  type        = number
  default     = 80

  validation {
    condition     = var.cpu_alarm_threshold_percent > 0 && var.cpu_alarm_threshold_percent <= 100
    error_message = "cpu_alarm_threshold_percent must be greater than 0 and no more than 100."
  }
}
