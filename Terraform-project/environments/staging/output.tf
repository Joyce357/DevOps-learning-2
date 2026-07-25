output "vpc_id" {
  description = "Staging VPC ID."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Staging public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "security_group_id" {
  description = "Staging EC2 security group ID."
  value       = module.ec2_security_group.id
}

output "instance_id" {
  description = "Staging EC2 instance ID."
  value       = module.ec2_instance.id
}

output "instance_public_ip" {
  description = "Staging EC2 public IPv4 address."
  value       = module.ec2_instance.public_ip
}
