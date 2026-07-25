output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.this.id
}
output "vpc_arn" {
  description = "VPC ARN."
  value       = aws_vpc.this.arn
}
output "vpc_cidr_block" {
  description = "VPC IPv4 CIDR."
  value       = aws_vpc.this.cidr_block
}
output "public_subnet_ids" {
  description = "Public subnet IDs in input order."
  value       = [for key in sort(keys(aws_subnet.public)) : aws_subnet.public[key].id]
}
output "private_subnet_ids" {
  description = "Private subnet IDs in input order."
  value       = [for key in sort(keys(aws_subnet.private)) : aws_subnet.private[key].id]
}
output "public_route_table_id" {
  description = "Public route table ID, if created."
  value       = try(aws_route_table.public[0].id, null)
}
output "private_route_table_id" {
  description = "Private route table ID, if created."
  value       = try(aws_route_table.private[0].id, null)
}
output "nat_gateway_id" {
  description = "NAT gateway ID, if enabled."
  value       = try(aws_nat_gateway.this[0].id, null)
}
