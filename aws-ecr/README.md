<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.13.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.lifecycle_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.ecr_repository](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.repository_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags added to all supported resources. | `map(any)` | `{}` | no |
| <a name="input_encryption_configuration"></a> [encryption\_configuration](#input\_encryption\_configuration) | Encryption configuration for the repository. | `object({ encryption_type : string, kms_key : string })` | <pre>{<br>  "encryption_type": "AES256",<br>  "kms_key": null<br>}</pre> | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Name of the environment; a short code like 'dev' or 'live-eu'. | `string` | n/a | yes |
| <a name="input_iam_users"></a> [iam\_users](#input\_iam\_users) | Allow IAM users within your account to access ECR repository. Full arn should be provided for each user. For example, ["arn:aws:iam::account-id:user/push-pull-user-1"] | `list(string)` | `[]` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. | `string` | `"MUTABLE"` | no |
| <a name="input_max_image_count"></a> [max\_image\_count](#input\_max\_image\_count) | How many Docker Image versions AWS ECR will store. | `number` | `10` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the repository. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for the environment, e.g. 'project'. | `string` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). Image Scanning for Amazon ECR is available at no additional charge, and you can now use it in all commercial AWS Regions and GovCloud (US). | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Full ARN of the repository. |
| <a name="output_name"></a> [name](#output\_name) | Name of the repository. |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | The registry ID where the repository was created. |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName). |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->
