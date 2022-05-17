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

variable "bucket" {
  type        = string
  description = "The name of the bucket. If omitted, Terraform will use a default convention: var.namespace-var.env_name."
  default     = null
}

variable "acl" {
  type        = string
  description = "The canned ACL to apply. Defaults to 'private'. Conflicts with grant."
  default     = "private"
}

variable "force_destroy" {
  type        = bool
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  default     = false
}

variable "attach_policy" {
  type        = bool
  description = "Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy)."
  default     = false
}

variable "policy" {
  type        = string
  description = "(Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
  default     = null
}

variable "create_iam_user" {
  type        = bool
  description = "If we want to create an IAM user which has access to the bucket."
  default     = false
}

variable "principal_service" {
  type        = string
  description = "Principal service for which will be allowed access to existing S3 bucket for created IAM role."
  default     = "eks"
}

variable "attach_deny_insecure_transport_policy" {
  type        = bool
  description = "Controls if S3 bucket should have deny non-SSL transport policy attached"
  default     = false
}

variable "versioning" {
  type        = map(string)
  description = "Map containing versioning configuration."
  default     = { enabled = false }
}

variable "website" {
  type        = map(string)
  description = "Map containing static web-site hosting or redirect configuration."
  default     = {}
}

variable "cors_rule" {
  type = list(object({
    allowed_methods : list(string),
    allowed_origins : list(string),
    allowed_headers : list(string),
    expose_headers : list(string),
    max_age_seconds : number
  }))
  description = "List of maps containing rules for Cross-Origin Resource Sharing."
  default     = []
}

variable "lifecycle_rule" {
  type        = any
  description = "List of maps containing configuration of object lifecycle management."
  default     = []
}

variable "block_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should block public ACLs for this bucket."

  default = true
}

variable "block_public_policy" {
  type        = bool
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  default     = true
}

variable "ignore_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  default     = true
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  default     = true
}

variable "logging" {
  type        = map(string)
  description = "Map containing access bucket logging configuration."
  default     = {}
}

variable "server_side_encryption_configuration" {
  type        = any
  description = "Map containing server-side encryption configuration."
  default     = {}
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-s3"
    }
  )

  base_name = "${var.namespace}-${var.env_name}"
  bucket    = var.bucket == null ? local.base_name : var.bucket
}
