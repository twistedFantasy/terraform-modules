module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name        = local.identifier
  description = var.security_group_description
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks              = local.permitted_ip_ranges
  ingress_with_source_security_group_id = local.permitted_security_groups

  egress_with_cidr_blocks              = var.egress_with_cidr_blocks
  egress_with_source_security_group_id = var.egress_with_source_security_group_id

  tags = local.common_tags
}
