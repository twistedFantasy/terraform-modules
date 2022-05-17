resource "aws_route53_record" "route53_record" {
  count = var.create_route53_record ? 1 : 0

  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.aws_cloudfront.cloudfront_distribution_domain_name
    zone_id                = module.aws_cloudfront.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }
}
