resource "aws_iam_user" "iam_user" {
  count = var.create_iam_user ? 1 : 0
  name  = "${local.base_name}-ci"

  tags = local.common_tags
}

resource "aws_iam_access_key" "iam_access_key" {
  count = var.create_iam_user ? 1 : 0
  user  = aws_iam_user.iam_user[0].name
}

resource "aws_iam_user_policy" "iam_user_policy" {
  count = var.create_iam_user ? 1 : 0
  name  = "${local.base_name}-ci-ecr"
  user  = aws_iam_user.iam_user[0].name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ECRRepositoryPolicy",
      "Effect": "Allow",
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:CompleteLayerUpload",
        "ecr:GetDownloadUrlForLayer",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart"
      ],
      "Resource": [
        "${aws_ecr_repository.ecr_repository.arn}"
      ]
    },
    {
      "Sid": "ECRGetAuthorizationTokenPolicy",
      "Effect": "Allow",
      "Action": ["ecr:GetAuthorizationToken"],
      "Resource": "*"
    }
  ]
}
EOF
}
