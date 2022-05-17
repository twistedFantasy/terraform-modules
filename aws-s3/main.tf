module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.2.0"

  bucket        = local.bucket
  acl           = var.acl
  force_destroy = var.force_destroy

  attach_policy = var.attach_policy
  policy        = var.policy

  attach_deny_insecure_transport_policy = var.attach_deny_insecure_transport_policy

  versioning     = var.versioning
  website        = var.website
  logging        = var.logging
  cors_rule      = var.cors_rule
  lifecycle_rule = var.lifecycle_rule

  server_side_encryption_configuration = var.server_side_encryption_configuration

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  tags = local.common_tags
}
