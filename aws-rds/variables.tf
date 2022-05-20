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

variable "vpc_id" {
  type        = string
  description = "Amazon RDS instance will be launched in selected vpc."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Database subnets for VPC."
}

variable "db_subnet_group_name" {
  type        = string
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group."
}

variable "identifier" {
  type        = string
  description = "The customer-supplied name uniquely identifies the DB instance when interacting with the Amazon RDS API and AWS CLI commands."
  default     = null
}

variable "engine" {
  type        = string
  description = "The database engine to use."
  default     = "postgres"
}

variable "engine_version" {
  type        = string
  description = "The engine version to use."
  default     = "14.1"
}

variable "family" {
  type        = string
  description = "The family of the DB parameter group."
  default     = "postgres14"
}

variable "major_engine_version" {
  type        = string
  description = "Specifies the major version of the engine that this option group should be associated with."
  default     = "14"
}

variable "instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage in gigabytes."
  default     = 20
}

variable "max_allocated_storage" {
  type        = number
  description = "Specifies the value for Storage Autoscaling."
  default     = 100
}

variable "storage_encrypted" {
  type        = bool
  description = "Specifies whether the DB instance is encrypted."
  default     = true
}

variable "storage_type" {
  type        = string
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not."
  default     = "gp2"
}

variable "db_name" {
  type        = string
  description = "The DB name to create. DB name must begin with a letter and contain only alphanumeric characters."
  default     = null
}

variable "master_username" {
  type        = string
  description = "Username for the master DB user."
  default     = "master"
}

variable "master_username_path" {
  type        = string
  description = "System Manager name for parameter which contains username for the master DB user."
  default     = null
}

variable "master_password_path" {
  type        = string
  description = "System Manager name for parameter which contains password for the master DB user."
  default     = null
}

variable "port" {
  type        = number
  description = "The port on which the DB accepts connections."
  default     = 5432
}

variable "multi_az" {
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ."
  default     = false
}

variable "publicly_accessible" {
  type        = bool
  description = "Bool to control if instance is publicly accessible."
  default     = false
}

variable "maintenance_window" {
  type        = string
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'."
  default     = "Mon:03:00-Mon:04:00"
}

variable "backup_window" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window."
  default     = "04:30-05:00"
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "ist of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  default     = []
}

variable "backup_retention_period" {
  type        = number
  description = "The days to retain backups for."
  default     = 30
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier."
  default     = false
}

variable "deletion_protection" {
  type        = bool
  description = "The database can't be deleted when this value is set to true."
  default     = true
}

variable "performance_insights_enabled" {
  type        = bool
  description = "Specifies whether Performance Insights are enabled."
  default     = true
}

variable "performance_insights_retention_period" {
  type        = number
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
  default     = 7
}

variable "create_monitoring_role" {
  description = "Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
  type        = bool
  default     = true
}

variable "monitoring_role_name" {
  type        = string
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
  default     = null
}

variable "monitoring_interval" {
  type        = number
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = 60
}


variable "parameters" {
  type = list(object({
    name  = string
    value = any
  }))
  description = "A list of DB parameters (map) to apply."
  default     = []
}

variable "allow_major_version_upgrade" {
  type        = bool
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  default     = false
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  default     = true
}

variable "permitted_ip_ranges" {
  type        = list(string)
  description = "List of allowed customer ip addresses for Amazon RDS security group."
  default     = []
}

variable "permitted_security_groups" {
  type        = list(string)
  description = "List of allowed security groups for Amazon RDS security group."
  default     = []
}

variable "egress_with_cidr_blocks" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  }))
  description = "List of egress rules to create where 'cidr_blocks' is used."
  default     = []
}

variable "egress_with_source_security_group_id" {
  type = list(object({
    from_port                = number
    to_port                  = number
    protocol                 = string
    source_security_group_id = string
  }))
  description = "List of egress rules to create where 'source_security_group_id' is used."
  default     = []
}

variable "security_group_description" {
  type        = string
  description = "Description of security group."
  default     = "Security Group managed by Terraform."
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-rds"
    }
  )

  base_name  = "${var.namespace}-${var.env_name}"
  identifier = var.identifier == null ? local.base_name : var.identifier

  permitted_ip_ranges = [
    for record in var.permitted_ip_ranges :
    {
      rule        = "postgres-tcp"
      cidr_blocks = record
    }
  ]

  permitted_security_groups = [
    for record in var.permitted_security_groups :
    {
      rule                     = "postgresql-tcp"
      source_security_group_id = record
    }
  ]
}
