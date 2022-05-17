resource "aws_iam_user_policy" "iam_user_policy" {
  count = var.create_iam_user ? 1 : 0

  name = "${local.base_name}-ci-cloudfront"
  user = module.aws_s3.iam_user

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "CloudFrontPolicy",
    "Effect": "Allow",
    "Action": ["cloudfront:*"],
    "Resource": [
      "${module.aws_cloudfront.cloudfront_distribution_arn}"
    ]
    }]
}
EOF
}
