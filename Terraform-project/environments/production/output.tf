output "vpc_id" {
  description = "Production VPC ID."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Production public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Production private subnet IDs."
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  description = "Production NAT gateway ID."
  value       = module.vpc.nat_gateway_id
}

output "security_group_id" {
  description = "Production EC2 security group ID."
  value       = module.ec2_security_group.id
}

output "instance_id" {
  description = "Production EC2 instance ID."
  value       = module.ec2_instance.id
}

output "instance_private_ip" {
  description = "Production EC2 private IPv4 address."
  value       = module.ec2_instance.private_ip
}
