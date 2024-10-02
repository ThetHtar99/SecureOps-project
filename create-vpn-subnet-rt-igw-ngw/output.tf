output azs {
  value   = data.aws_availability_zones.azs.names
}

########
# VPC
################################################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}
output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.main.arn
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}
# output "vpc_enable_dns_support" {
#   description = "Whether or not the VPC has DNS support"
#   value       = aws_vpc.main.enable_dns_support
# }
# output "vpc_enable_dns_hostnames" {
#   description = "Whether or not the VPC has DNS hostname support"
#   value       = aws_vpc.main.enable_dns_hostnames
# }
output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = aws_vpc.main.main_route_table_id
}
output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = aws_vpc.main.owner_id
}
################################################################################
# Internet Gateway
################################################################################
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.public_igw.id
}
output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = aws_internet_gateway.public_igw.arn
}
################################################################################
# Publiс Subnets
################################################################################
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnets[*].id
}
output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.public_subnets[*].arn
}
output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = aws_subnet.public_subnets[*].cidr_block
}
output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.public_rt[*].id
}
# output "public_internet_gateway_route_id" {
#   description = "ID of the internet gateway route"
#   value       = aws_route.public_internet_gateway.id
# }
# output "public_route_table_association_ids" {
#   description = "List of IDs of the public route table association"
#   value       = aws_route_table_association.public[*].id
# }
# ################################################################################
# # Private Subnets
# ################################################################################
# output "private_subnets" {
#   description = "List of IDs of private subnets"
#   value       = aws_subnet.private[*].id
# }
# output "private_subnet_arns" {
#   description = "List of ARNs of private subnets"
#   value       = aws_subnet.private[*].arn
# }
# output "private_subnets_cidr_blocks" {
#   description = "List of cidr_blocks of private subnets"
#   value       = aws_subnet.private[*].cidr_block
# }
# output "private_route_table_ids" {
#   description = "List of IDs of private route tables"
#   value       = aws_route_table.private[*].id
# }
# output "private_nat_gateway_route_ids" {
#   description = "List of IDs of the private nat gateway route"
#   value       = aws_route.private_nat_gateway.id
# }
# output "private_route_table_association_ids" {
#   description = "List of IDs of the private route table association"
#   value       = aws_route_table_association.private[*].id
# }
# ################################################################################
# # Database Subnets
# ################################################################################
# output "database_subnets" {
#   description = "List of IDs of database subnets"
#   value       = aws_subnet.database[*].id
# }
# output "database_subnet_arns" {
#   description = "List of ARNs of database subnets"
#   value       = aws_subnet.database[*].arn
# }
# output "database_subnets_cidr_blocks" {
#   description = "List of cidr_blocks of database subnets"
#   value       = aws_subnet.database[*].cidr_block
# }
# output "database_subnet_group" {
#   description = "ID of database subnet group"
#   value       = aws_db_subnet_group.database.id
# }
# output "database_subnet_group_name" {
#   description = "Name of database subnet group"
#   value       = aws_db_subnet_group.database.name
# }
# output "database_route_table_ids" {
#   description = "List of IDs of database route tables"
#   # Refer to https://github.com/terraform-aws-modules/terraform-aws-vpc/pull/926 before changing logic
#   value = aws_route_table.database[*].id
# }
# output "database_nat_gateway_route_ids" {
#   description = "List of IDs of the database nat gateway route"
#   value       = aws_route.database_nat_gateway.id
# }
# output "database_route_table_association_ids" {
#   description = "List of IDs of the database route table association"
#   value       = aws_route_table_association.database[*].id
# }
# ################################################################################
# # NAT Gateway
# ################################################################################
# output "nat_ids" {
#   description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
#   value       = aws_eip.nat.id
# }
# output "nat_public_ips" {
#   description = "List of public Elastic IPs created for AWS NAT Gateway"
#   value       = aws_eip.nat.public_ip
# }
# output "natgw_ids" {
#   description = "List of NAT Gateway IDs"
#   value       = aws_nat_gateway.nat.id
# }
# output "natgw_interface_ids" {
#   description = "List of Network Interface IDs assigned to NAT Gateways"
#   value       = aws_nat_gateway.nat.network_interface_id
# }