output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  value       = module.vpc.vpc_cidr_block
}

output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets."
  value       = module.vpc.public_subnets
}

output "vpc_private_subnets" {
  description = "IDs of the VPC's private subnets."
  value       = module.vpc.private_subnets
}

output "vpc_database_subnets" {
  description = "IDs of the VPC's database subnets."
  value       = module.vpc.database_subnets
}

output "database_subnet_group" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group
}

output "database_subnet_group_name" {
  description = "Name of database subnet group"
  value       = module.vpc.database_subnet_group_name
}

output "vpc_elasticache_subnets" {
  description = "IDs of the VPC's elasticache subnets."
  value       = module.vpc.elasticache_subnets
}

output "vpc_default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.vpc.default_security_group_id
}
