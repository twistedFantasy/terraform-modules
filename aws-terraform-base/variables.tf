variable "namespace" {
  type        = string
  description = "Namespace for the environment, e.g. 'outerspace'."
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

variable "admin_iam_users" {
  type        = list(any)
  description = "List of administrative users who will be given access to terraform state bucket. It's vital to list yourself in that group."
  default     = ["denis.sventitsky"]
}

variable "force_tf_name" {
  type        = string
  description = "Force name for state bucket + dynamodb table; useful when trying to rename an infrastructure"
  default     = null
}

locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-terraform-base"
    }
  )

  base_name = "${var.namespace}-${var.env_name}"
}
