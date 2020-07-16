resource "aws_kms_key" "default_bucket" {
  count = local.create_dedicated_bucket ? 1 : 0
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "default" {
  count = local.create_dedicated_bucket ? 1 : 0
  bucket = var.unique_name
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "history"
    enabled = true
    transition {
      days          = 60
      storage_class = "INTELLIGENT_TIERING"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.default_bucket.0.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = merge(
    {
      Name = "${var.unique_name}-default-artifact-root"
    },
    local.tags
  )
}

resource "aws_iam_role_policy" "default_bucket" {
  count = local.create_dedicated_bucket ? 1 : 0
  name_prefix = "access_to_default_bucket"
  role = aws_iam_role.ecs_task.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:HeadBucket"
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:DeleteObjectTagging",
          "s3:ListBucketMultipartUploads",
          "s3:GetBucketTagging",
          "s3:DeleteObjectVersion",
          "s3:GetObjectVersionTagging",
          "s3:ReplicateTags",
          "s3:PutObjectVersionTagging",
          "s3:ListBucket",
          "s3:DeleteObjectVersionTagging",
          "s3:ListMultipartUploadParts",
          "s3:PutObject",
          "s3:GetObjectAcl",
          "s3:GetObject",
          "s3:AbortMultipartUpload",
          "s3:PutBucketTagging",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectTagging",
          "s3:PutObjectTagging",
          "s3:DeleteObject",
          "s3:GetObjectVersion",
        ]
        Resource = aws_s3_bucket.default.*.arn
      },
    ]
  })
}
