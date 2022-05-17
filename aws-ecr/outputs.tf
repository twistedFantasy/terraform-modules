output "arn" {
  description = "Full ARN of the repository."
  value       = aws_ecr_repository.ecr_repository.arn
}

output "name" {
  description = "Name of the repository."
  value       = aws_ecr_repository.ecr_repository.name
}

output "registry_id" {
  description = "The registry ID where the repository was created."
  value       = aws_ecr_repository.ecr_repository.registry_id
}

output "repository_url" {
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
  value       = aws_ecr_repository.ecr_repository.repository_url
}

output "iam_user" {
  value = var.create_iam_user ? aws_iam_user.iam_user[0].name : ""
}

output "iam_user_access_key_id" {
  value = var.create_iam_user ? aws_iam_access_key.iam_access_key[0].id : ""
}

output "iam_user_secret_access_key" {
  sensitive = true
  value     = var.create_iam_user ? aws_iam_access_key.iam_access_key[0].secret : ""
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_ecr_repository.ecr_repository.tags_all
}
