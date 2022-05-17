module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "4.3.0"

  identifier = local.identifier

  engine               = var.engine
  engine_version       = var.engine_version
  family               = var.family
  major_engine_version = var.major_engine_version
  instance_class       = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_encrypted     = var.storage_encrypted
  storage_type          = var.storage_type

  db_name  = var.db_name == null ? var.namespace : var.db_name
  username = aws_ssm_parameter.master_username.value
  password = aws_ssm_parameter.master_password.value
  port     = var.port

  multi_az               = var.multi_az
  subnet_ids             = var.subnet_ids
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [module.security_group.security_group_id]
  publicly_accessible    = var.publicly_accessible

  maintenance_window              = var.maintenance_window
  backup_window                   = var.backup_window
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  create_monitoring_role                = var.create_monitoring_role
  monitoring_role_name                  = var.monitoring_role_name != null ? var.monitoring_role_name : "${local.base_name}-rds-monitoring-role"
  monitoring_interval                   = var.monitoring_interval

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade

  parameters = var.parameters

  tags = local.common_tags
}
