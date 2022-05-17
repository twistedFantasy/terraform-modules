resource "random_password" "password" {
  length           = 24
  special          = true
  override_special = "-_"
}

resource "aws_ssm_parameter" "master_username" {
  name  = var.master_username_path != null ? var.master_username_path : "/${var.namespace}/${var.env_name}/rds-username"
  type  = "SecureString"
  value = var.master_username
  tags  = var.common_tags
}

resource "aws_ssm_parameter" "master_password" {
  name  = var.master_password_path != null ? var.master_password_path : "/${var.namespace}/${var.env_name}/rds-password"
  type  = "SecureString"
  value = random_password.password.result
  tags  = var.common_tags
}
