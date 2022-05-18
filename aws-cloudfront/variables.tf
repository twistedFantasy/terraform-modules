variable "namespace" {
  type        = string
  description = "Namespace for the environment, e.g. 'cultureconnect'."
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

variable "origin" {
  type        = any
  description = "One or more origins for this distribution (multiples allowed)."
}

variable "default_cache_behavior" {
  type        = any
  description = "The default cache behavior for this distribution"
}

variable "default_root_object" {
  type        = string
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  default     = ""
}

variable "aliases" {
  type        = list(string)
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution."
  default     = []
}

variable "web_acl_id" {
  type        = string
  description = "If you're using AWS WAF to filter CloudFront requests, the Id of the AWS WAF web ACL that is associated with the distribution. The WAF Web ACL must exist in the WAF Global (CloudFront) region and the credentials configuring this argument must have waf:GetWebACL permissions assigned. If using WAFv2, provide the ARN of the web ACL."
  default     = null
}

variable "comment" {
  type        = string
  description = "Any comments you want to include about the distribution."
  default     = "CloudFront distribution created with the help of terraform."
}

variable "enabled" {
  type        = bool
  description = "Whether the distribution is enabled to accept end user requests for content."
  default     = true
}

variable "http_version" {
  type        = string
  description = "The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2."
  default     = "http2"
}

variable "is_ipv6_enabled" {
  type        = bool
  description = "Whether the IPv6 is enabled for the distribution."
  default     = null
}

variable "price_class" {
  type        = string
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  default     = "PriceClass_100"
}

variable "retain_on_delete" {
  type        = bool
  description = "Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards."
  default     = false
}

variable "wait_for_deployment" {
  type        = bool
  description = "If enabled, the resource will wait for the distribution status to change from InProgress to Deployed. Setting this to false will skip the process."
  default     = true
}

variable "create_origin_access_identity" {
  type        = bool
  description = "Controls if CloudFront origin access identity should be created"
  default     = false
}

variable "origin_access_identities" {
  type        = map(string)
  description = "Map of CloudFront origin access identities (value as a comment)"
  default     = {}
}

variable "logging_config" {
  type        = any
  description = "The logging configuration that controls how logs are written to your distribution (maximum one)."
  default     = {}
}

variable "ordered_cache_behavior" {
  type        = any
  description = "An ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0."
  default     = []
}

variable "viewer_certificate" {
  type        = any
  description = "The SSL configuration for this distribution"
  default = {
    cloudfront_default_certificate = true
    minimum_protocol_version       = "TLSv1"
  }
}

variable "geo_restriction" {
  type        = any
  description = "The restriction configuration for this distribution (geo_restrictions)"
  default     = {}
}

variable "custom_error_response" {
  type        = any
  description = "One or more custom error response elements"
  default     = {}
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-cloudfront"
    }
  )

  base_name = "${var.namespace}-${var.env_name}"
}
