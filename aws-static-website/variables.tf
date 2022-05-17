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

variable "domain_name" {
  type        = string
  description = "Domain configuration which should be used."
}

variable "create_route53_record" {
  type        = bool
  description = "If we want to create Domain A record in Route53."
  default     = false
}

variable "acm_certificate_arn" {
  type        = string
  description = "The ARN of existing certificate created by AWS Certificate Manager."
  default     = null
}

variable "s3_website" {
  type        = any
  description = "Map containing static web-site hosting or redirect configuration."
  default = {
    index_document = "index.html"
    error_document = "index.html"
  }
}

variable "cloudfront_default_root_object" {
  type        = string
  description = "AWS CloudFront default root object."
  default     = "index.html"
}

variable "zone_id" {
  type        = string
  description = "The ID of the AWS Route53 hosted zone."
  default     = ""
}

variable "viewer_protocol_policy" {
  type    = string
  default = "redirect-to-https"
}

variable "create_iam_user" {
  type        = bool
  description = "If we want to create an IAM user which has access to the bucket and cloudfront."
  default     = false
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-static-website"
    }
  )

  base_name = "${var.namespace}-${var.env_name}"

  bucket = "${local.base_name}-static-website"
}
