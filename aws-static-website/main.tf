module "aws_s3" {
  source      = "../aws-s3"
  namespace   = var.namespace
  env_name    = var.env_name
  common_tags = local.common_tags

  bucket                  = local.bucket
  website                 = {}
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  create_iam_user = var.create_iam_user
  attach_policy   = true
  policy          = data.aws_iam_policy_document.bucket_policy.json
}

module "aws_cloudfront" {
  source      = "../aws-cloudfront"
  namespace   = var.namespace
  env_name    = var.env_name
  common_tags = local.common_tags

  aliases             = [var.domain_name]
  default_root_object = var.cloudfront_default_root_object

  default_cache_behavior = {
    target_origin_id       = module.aws_s3.s3_bucket_id
    viewer_protocol_policy = var.viewer_protocol_policy

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true

    min_ttl     = 0
    max_ttl     = 31536000
    default_ttl = 86400
  }

  viewer_certificate = var.acm_certificate_arn != null ? {
    acm_certificate_arn = var.acm_certificate_arn,
    ssl_support_method  = "sni-only",
    } : {
    cloudfront_default_certificate = true,
    minimum_protocol_version       = "TLSv1",
  }

  origin = {
    "${local.bucket}" = {
      domain_name = module.aws_s3.s3_bucket_bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "${local.base_name}-private"
      }
    }
  }

  create_origin_access_identity = true
  origin_access_identities      = { "${local.base_name}-private" = "${local.base_name}-private" }
}
