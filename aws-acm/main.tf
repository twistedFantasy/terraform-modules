module "acm" {
  count   = var.create_certificate ? 1 : 0
  source  = "terraform-aws-modules/acm/aws"
  version = "3.4.1"

  domain_name               = var.domain_name
  zone_id                   = var.zone_id
  subject_alternative_names = var.subject_alternative_names

  dns_ttl                            = var.dns_ttl
  wait_for_validation                = var.wait_for_validation
  validation_method                  = var.validation_method
  validate_certificate               = var.validate_certificate
  validation_allow_overwrite_records = var.validation_allow_overwrite_records

  tags = local.common_tags
}

data "aws_acm_certificate" "certificate" {
  count    = !var.create_certificate ? 1 : 0
  domain   = var.domain_name
  statuses = ["ISSUED"]
}
