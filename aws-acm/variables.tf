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
  description = "A domain name for which the certificate should be issued."
}

variable "create_certificate" {
  type        = bool
  description = "Whether to create certificate or get already existing one."
  default     = false
}

variable "validate_certificate" {
  type        = bool
  description = "Whether to validate certificate by creating Route53 record."
  default     = true
}

variable "validation_allow_overwrite_records" {
  type        = bool
  description = "Whether to allow overwrite of Route53 records."
  default     = false
}

variable "wait_for_validation" {
  type        = bool
  description = "Whether to wait for the validation to complete."
  default     = true
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "A list of domains that should be SANs in the issued certificate."
  default     = []
}

variable "validation_method" {
  type        = string
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  default     = "DNS"
}

variable "zone_id" {
  type        = string
  description = "The ID of the hosted zone to contain this record."
  default     = ""
}

variable "zone_name" {
  type        = string
  description = "The name of the hosted zone to contain this record."
  default     = ""
}

variable "dns_ttl" {
  type        = number
  description = "The TTL of DNS recursive resolvers to cache information about this record."
  default     = 60
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-acm"
    }
  )

  base_name = "${var.namespace}-${var.env_name}"
}
