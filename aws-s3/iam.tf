resource "aws_iam_user" "aws_iam_user" {
  count = var.create_iam_user ? 1 : 0

  name = local.bucket

  tags = local.common_tags
}

resource "aws_iam_access_key" "aws_iam_access_key" {
  count = var.create_iam_user ? 1 : 0

  user = aws_iam_user.aws_iam_user[0].name
}

resource "aws_iam_user_policy" "aws_iam_user_policy" {
  count = var.create_iam_user ? 1 : 0

  name = local.bucket
  user = aws_iam_user.aws_iam_user[0].name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:*"]
        Resource = [
          module.s3_bucket.s3_bucket_arn,
          "${module.s3_bucket.s3_bucket_arn}/*"
        ]
      }
    ]
  })
}
