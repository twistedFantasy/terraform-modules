output "static_website_bucket" {
  description = "Amazon S3 bucket name."
  value       = local.bucket
}

output "static_website_bucket_arn" {
  value = module.aws_s3.s3_bucket_arn
}

output "cloudfront_distribution_id" {
  description = "The identifier for AWS CloudFront distribution."
  value       = module.aws_cloudfront.cloudfront_distribution_id
}

output "cloudfront_distribution_arn" {
  value = module.aws_cloudfront.cloudfront_distribution_arn
}

output "iam_user" {
  value = var.create_iam_user ? module.aws_s3.iam_user : ""
}

output "iam_user_access_key_id" {
  value = var.create_iam_user ? module.aws_s3.iam_user_access_key_id : ""
}

output "iam_user_secret_access_key" {
  sensitive = true
  value     = var.create_iam_user ? module.aws_s3.iam_user_secret_access_key : ""
}
