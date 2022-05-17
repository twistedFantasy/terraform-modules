variable "namespace" {
  type        = string
  description = "Namespace for the environment, e.g. 'project'."
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

variable "name" {
  type        = string
  description = "Name of the repository."
  default     = null
}

variable "encryption_configuration" {
  type        = object({ encryption_type : string, kms_key : string })
  description = "Encryption configuration for the repository."
  default     = { encryption_type = "AES256", kms_key = null }
}

variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE."
  default     = "MUTABLE"
}

variable "max_image_count" {
  type        = number
  description = "How many Docker Image versions AWS ECR will store."
  default     = 10
}

variable "scan_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). Image Scanning for Amazon ECR is available at no additional charge, and you can now use it in all commercial AWS Regions and GovCloud (US)."
  default     = true
}

variable "create_iam_user" {
  type        = bool
  description = "If we want to create an IAM user which has access to the ECR."
  default     = false
}

variable "iam_users" {
  type        = list(string)
  description = "Allow IAM users within your account to access ECR repository. Full arn should be provided for each user. For example, [\"arn:aws:iam::account-id:user/push-pull-user-1\"]"
  default     = []
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-ecr"
    }
  )

  base_name = "${var.namespace}-${var.env_name}"
}
