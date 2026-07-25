variable "name" {
  description = "Security group name prefix and Name tag."
  type        = string
}
variable "description" {
  description = "Security group description."
  type        = string
  default     = "Managed by Terraform"
}
variable "vpc_id" {
  description = "VPC in which to create the security group."
  type        = string
}

variable "ingress_rules" {
  description = "Named inbound rules. Set exactly one source field per rule."
  type = map(object({
    description              = optional(string)
    protocol                 = optional(string, "tcp")
    from_port                = optional(number)
    to_port                  = optional(number)
    cidr_ipv4                = optional(string)
    cidr_ipv6                = optional(string)
    prefix_list_id           = optional(string)
    source_security_group_id = optional(string)
  }))
  default = {}
}

variable "egress_rules" {
  description = "Named outbound rules. Defaults to all IPv4 traffic."
  type = map(object({
    description              = optional(string)
    protocol                 = optional(string, "-1")
    from_port                = optional(number)
    to_port                  = optional(number)
    cidr_ipv4                = optional(string)
    cidr_ipv6                = optional(string)
    prefix_list_id           = optional(string)
    source_security_group_id = optional(string)
  }))
  default = {
    all_ipv4 = { description = "Allow all outbound IPv4 traffic"
      protocol  = "-1"
      cidr_ipv4 = "0.0.0.0/0"
    }

  }
}

variable "tags" {
  description = "Additional resource tags."
  type        = map(string)
  default     = {}
}
