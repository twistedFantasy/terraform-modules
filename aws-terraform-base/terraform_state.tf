//
// Create S3 bucket & DynamoDB table for storing Terraform state.
//
// There is a chicken-and-egg problem for creating this - see README.md for
// recommendations on handling it.
//
locals {
  admin_arns = [for user in data.aws_iam_user.admin_users : user.arn]
}

data "aws_iam_user" "admin_users" {
  for_each  = toset(var.admin_iam_users)
  user_name = each.key
}


data "aws_iam_policy_document" "terraform_state_bucket_document" {
  statement {
    sid     = "PermitAdministratorsOnly"
    effect  = "Deny"
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.terraform_state_bucket.arn,
      "${aws_s3_bucket.terraform_state_bucket.arn}/*"
    ]
    not_principals {
      type        = "AWS"
      identifiers = local.admin_arns
    }
  }
}

resource "aws_kms_key" "k" {
  description             = "Encrypt Terraform state bucket for ${var.namespace}-${var.env_name}"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.force_tf_name == null ? "${var.namespace}-${var.env_name}-terraform-state" : var.force_tf_name

  lifecycle {
    prevent_destroy = true
  }

  // Keep versions for 45 days
  versioning {
    enabled = true
  }
  lifecycle_rule {
    noncurrent_version_expiration {
      days = 45
    }
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.k.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = merge(
    local.common_tags,
    {
      Name = var.force_tf_name == null ? "${var.namespace}-${var.env_name}-terraform-state" : var.force_tf_name
    }
  )
}

resource "aws_s3_bucket_policy" "terraform_state_bucket_policy" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  policy = data.aws_iam_policy_document.terraform_state_bucket_document.json
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = var.force_tf_name == null ? "${var.namespace}-${var.env_name}-terraform-state" : var.force_tf_name
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(
    local.common_tags,
    {
      Name = var.force_tf_name == null ? "${var.namespace}-${var.env_name}-terraform-state" : var.force_tf_name
    }
  )
}
