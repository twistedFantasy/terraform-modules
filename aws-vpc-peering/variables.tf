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

variable "vpc_id" {
  type        = string
  description = "The ID of the requester VPC."
}

variable "peer_vpc_id" {
  type        = string
  description = "The ID of the VPC with which you are creating the VPC Peering Connection."
}

variable "filter" {
  type = object({
    name : string,
    values : list(string)
  })
  description = "Filter condition which is used to receive route table for the requester VPC."
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Module = "aws-vpc-peering"
    }
  )

  base_name = "${var.namespace}-${var.env_name}"
}
