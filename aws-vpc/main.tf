module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  database_subnets                = var.database_subnets
  create_database_subnet_group    = var.create_database_subnet_group
  elasticache_subnets             = var.elasticache_subnets
  create_elasticache_subnet_group = var.create_elasticache_subnet_group
  enable_nat_gateway              = var.enable_nat_gateway
  enable_dns_hostnames            = var.enable_dns_hostnames

  public_subnet_tags  = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags

  tags = local.common_tags
}
