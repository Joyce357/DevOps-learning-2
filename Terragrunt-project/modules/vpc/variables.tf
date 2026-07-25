variable "name" {
  description = "Name prefix for VPC resources."
  type        = string
}
variable "cidr_block" {
  description = "IPv4 CIDR assigned to the VPC."
  type        = string
  default     = "10.0.0.0/16"
}
variable "availability_zones" {
  description = "AZs corresponding by index to subnet CIDRs."
  type        = list(string)
}
variable "public_subnet_cidrs" {
  description = "Public subnet IPv4 CIDRs, one per AZ."
  type        = list(string)
  default     = []
}
variable "private_subnet_cidrs" {
  description = "Private subnet IPv4 CIDRs, one per AZ."
  type        = list(string)
  default     = []
}
variable "enable_nat_gateway" {
  description = "Create one NAT gateway for private IPv4 egress (incurs AWS charges)."
  type        = bool
  default     = false
}
variable "map_public_ip_on_launch" {
  description = "Automatically assign public IPv4 addresses in public subnets."
  type        = bool
  default     = true
}
variable "enable_dns_support" {
  description = "Enable VPC DNS resolution."
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "Enable VPC DNS hostnames."
  type        = bool
  default     = true
}
variable "enable_ipv6" {
  description = "Assign an Amazon IPv6 CIDR and subnet IPv6 ranges."
  type        = bool
  default     = false
}
variable "tags" {
  description = "Additional resource tags."
  type        = map(string)
  default     = {}
}

check "subnet_counts" {
  assert {
    condition     = length(var.public_subnet_cidrs) <= length(var.availability_zones) && length(var.private_subnet_cidrs) <= length(var.availability_zones)
    error_message = "Each subnet CIDR requires a corresponding availability zone."

  }
}

check "nat_prerequisites" {
  assert {
    condition     = !var.enable_nat_gateway || (length(var.public_subnet_cidrs) > 0 && length(var.private_subnet_cidrs) > 0)
    error_message = "enable_nat_gateway requires at least one public and one private subnet."

  }
}
