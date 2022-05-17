output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = var.create_certificate ? module.acm[0].acm_certificate_arn : data.aws_acm_certificate.certificate[0].arn
}

output "distinct_domain_names" {
  description = "List of distinct domains names used for the validation."
  value       = var.create_certificate ? module.acm[0].distinct_domain_names : []
}

output "validation_domains" {
  description = "List of distinct domain validation options. This is useful if subject alternative names contain wildcards."
  value       = var.create_certificate ? module.acm[0].validation_domains : []
}
