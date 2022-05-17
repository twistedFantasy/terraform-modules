<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_cloudfront"></a> [aws\_cloudfront](#module\_aws\_cloudfront) | ../aws-cloudfront | n/a |
| <a name="module_aws_s3"></a> [aws\_s3](#module\_aws\_s3) | ../aws-s3 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_user_policy.iam_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_route53_record.route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | The ARN of existing certificate created by AWS Certificate Manager. | `string` | `null` | no |
| <a name="input_cloudfront_default_root_object"></a> [cloudfront\_default\_root\_object](#input\_cloudfront\_default\_root\_object) | AWS CloudFront default root object. | `string` | `"index.html"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags added to all supported resources. | `map(any)` | `{}` | no |
| <a name="input_create_iam_user"></a> [create\_iam\_user](#input\_create\_iam\_user) | If we want to create an IAM user which has access to the bucket and cloudfront. | `bool` | `false` | no |
| <a name="input_create_route53_record"></a> [create\_route53\_record](#input\_create\_route53\_record) | If we want to create Domain A record in Route53. | `bool` | `false` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain configuration which should be used. | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Name of the environment; a short code like 'dev' or 'live-eu'. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for the environment. | `string` | n/a | yes |
| <a name="input_s3_website"></a> [s3\_website](#input\_s3\_website) | Map containing static web-site hosting or redirect configuration. | `any` | <pre>{<br>  "error_document": "index.html",<br>  "index_document": "index.html"<br>}</pre> | no |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | n/a | `string` | `"redirect-to-https"` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The ID of the AWS Route53 hosted zone. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_distribution_arn"></a> [cloudfront\_distribution\_arn](#output\_cloudfront\_distribution\_arn) | n/a |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | The identifier for AWS CloudFront distribution. |
| <a name="output_iam_user"></a> [iam\_user](#output\_iam\_user) | n/a |
| <a name="output_iam_user_access_key_id"></a> [iam\_user\_access\_key\_id](#output\_iam\_user\_access\_key\_id) | n/a |
| <a name="output_iam_user_secret_access_key"></a> [iam\_user\_secret\_access\_key](#output\_iam\_user\_secret\_access\_key) | n/a |
| <a name="output_static_website_bucket"></a> [static\_website\_bucket](#output\_static\_website\_bucket) | Amazon S3 bucket name. |
| <a name="output_static_website_bucket_arn"></a> [static\_website\_bucket\_arn](#output\_static\_website\_bucket\_arn) | n/a |
<!-- END_TF_DOCS -->
