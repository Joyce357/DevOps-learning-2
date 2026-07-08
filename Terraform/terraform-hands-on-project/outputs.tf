
output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = aws_instance.bastion_host.public_ip
}

output "bastion_public_dns" {
  description = "Public DNS name of the bastion host"
  value       = aws_instance.bastion_host.public_dns
}


output "instance_id" {
  description = "ID of the bastion host instance"
  value       = aws_instance.bastion_host.id
  
}