output "rds_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db.db_instance_address
}

output "rds_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db.db_instance_arn
}

output "rds_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.db.db_instance_availability_zone
}

output "rds_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db.db_instance_endpoint
}

output "rds_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.db.db_instance_hosted_zone_id
}

output "rds_instance_id" {
  description = "The RDS instance ID"
  value       = module.db.db_instance_id
}

output "rds_instance_name" {
  description = "The database name"
  value       = module.db.db_instance_name
}

output "rds_master_username" {
  description = "The master username for the database"
  value       = nonsensitive(module.db.db_instance_username)
}

output "rds_master_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = nonsensitive(module.db.db_instance_password)
}

output "rds_instance_port" {
  description = "The database port"
  value       = module.db.db_instance_port
}

output "rds_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.db.db_parameter_group_id
}

output "rds_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.db.db_parameter_group_arn
}
