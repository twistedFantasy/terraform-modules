variable "namespace" {
  type        = string
  description = "Namespace for the environment."
}

variable "env_name" {
  type        = string
  description = "Name of the environment; a short code like 'dev' or 'live-eu'."
}

variable "common_tags" {
  type        = map(any)
  description = "Common tags added to all supported resources."
  default     = {}
}

variable "name" {
  type        = string
  description = "Name of VPC."
  default     = null
}

variable "cidr" {
  type        = string
  description = "CIDR block for VPC."
  default     = "10.36.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones for VPC."
  default     = []
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets for VPC."
  default     = ["10.36.1.0/24", "10.36.2.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnets for VPC."
  default     = ["10.36.101.0/24", "10.36.102.0/24"]
}

variable "database_subnets" {
  type        = list(string)
  description = "Database subnets for VPC."
  default     = ["10.36.21.0/24", "10.36.22.0/24"]
}

variable "elasticache_subnets" {
  type        = list(string)
  description = "ElastiCache subnets for VPC."
  default     = []
}

variable "create_database_subnet_group" {
  type        = bool
  description = "Controls if database subnet group should be created (n.b. database_subnets must also be set)."
  default     = true
}

variable "create_database_subnet_route_table" {
  type        = bool
  description = "Controls if separate route table for database should be created"
  default     = true
}

variable "create_elasticache_subnet_group" {
  type        = bool
  description = "Controls if elasticache subnet group should be created."
  default     = false
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT gateway for VPC."
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks."
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Should be true to enable DNS hostnames in the Default VPC."
  default     = true
}

variable "public_subnet_tags" {
  type        = map(any)
  description = "Additional tags for the public subnets."
  default     = {}
}

variable "private_subnet_tags" {
  type        = map(any)
  description = "Additional tags for the private subnets."
  default     = {}
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-vpc"
    }
  )

  base_name = "${var.namespace}-${var.env_name}"
}
