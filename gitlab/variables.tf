variable "namespace" {
  type        = string
  description = "Namespace for the environment, e.g. 'outerspace'"
}

variable "env_name" {
  type        = string
  description = "Name of the environment; a short code like 'dev' or 'live-eu'"
}

variable "common_tags" {
  type        = map(any)
  description = "Common tags added to all supported resources"
  default     = {}
}

variable "project" {
  type        = string
  description = "The id of the project to add the cluster to."
}

variable "project_variables" {
  type = map(object({
    value  = any
    masked = bool
  }))
  description = "Variables store information, like passwords and secret keys, that you can use in job scripts."
  default     = {}
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Application = "gitlab"
    }
  )
}
