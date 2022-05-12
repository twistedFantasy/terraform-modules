resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.name != null ? var.name : local.base_name
  image_tag_mutability = var.image_tag_mutability

  encryption_configuration {
    encryption_type = var.encryption_configuration.encryption_type
    kms_key         = var.encryption_configuration.kms_key
  }

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = local.common_tags
}
