locals {
  public_subnets  = { for index, cidr in var.public_subnet_cidrs : tostring(index) => { cidr = cidr, az = var.availability_zones[index] } }
  private_subnets = { for index, cidr in var.private_subnet_cidrs : tostring(index) => { cidr = cidr, az = var.availability_zones[index] } }
  common_tags     = merge(var.tags, { ManagedBy = "Terraform" })
}

resource "aws_vpc" "this" {
  cidr_block                       = var.cidr_block
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  assign_generated_ipv6_cidr_block = var.enable_ipv6
  tags                             = merge(local.common_tags, { Name = var.name })
}

resource "aws_internet_gateway" "this" {
  count  = length(var.public_subnet_cidrs) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "${var.name}-igw" })
}

resource "aws_subnet" "public" {
  for_each = local.public_subnets

  vpc_id                          = aws_vpc.this.id
  cidr_block                      = each.value.cidr
  availability_zone               = each.value.az
  map_public_ip_on_launch         = var.map_public_ip_on_launch
  assign_ipv6_address_on_creation = var.enable_ipv6
  ipv6_cidr_block                 = var.enable_ipv6 ? cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, tonumber(each.key)) : null
  tags                            = merge(local.common_tags, { Name = "${var.name}-public-${each.value.az}", Tier = "public" })
}

resource "aws_subnet" "private" {
  for_each = local.private_subnets

  vpc_id                          = aws_vpc.this.id
  cidr_block                      = each.value.cidr
  availability_zone               = each.value.az
  assign_ipv6_address_on_creation = var.enable_ipv6
  ipv6_cidr_block                 = var.enable_ipv6 ? cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, tonumber(each.key) + 128) : null
  tags                            = merge(local.common_tags, { Name = "${var.name}-private-${each.value.az}", Tier = "private" })
}

resource "aws_route_table" "public" {
  count  = length(var.public_subnet_cidrs) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "${var.name}-public" })
}

resource "aws_route" "public_ipv4" {
  count                  = length(var.public_subnet_cidrs) > 0 ? 1 : 0
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
}

resource "aws_route" "public_ipv6" {
  count                       = var.enable_ipv6 && length(var.public_subnet_cidrs) > 0 ? 1 : 0
  route_table_id              = aws_route_table.public[0].id
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.this[0].id
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public[0].id
}

resource "aws_eip" "nat" {
  count  = var.enable_nat_gateway ? 1 : 0
  domain = "vpc"
  tags   = merge(local.common_tags, { Name = "${var.name}-nat" })

  depends_on = [aws_internet_gateway.this]
}

resource "aws_nat_gateway" "this" {
  count         = var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public["0"].id
  tags          = merge(local.common_tags, { Name = "${var.name}-nat" })
}

resource "aws_route_table" "private" {
  count  = length(var.private_subnet_cidrs) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "${var.name}-private" })
}

resource "aws_route" "private_nat" {
  count                  = var.enable_nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.private[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this[0].id
}

resource "aws_egress_only_internet_gateway" "this" {
  count  = var.enable_ipv6 && length(var.private_subnet_cidrs) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "${var.name}-eigw" })
}

resource "aws_route" "private_ipv6" {
  count                       = var.enable_ipv6 && length(var.private_subnet_cidrs) > 0 ? 1 : 0
  route_table_id              = aws_route_table.private[0].id
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id      = aws_egress_only_internet_gateway.this[0].id
}

resource "aws_route_table_association" "private" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[0].id
}
