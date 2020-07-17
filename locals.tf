locals {
  service_port            = 80
  db_port                 = 3306
  create_dedicated_bucket = var.artifact_bucket_id == null
  artifact_bucket_id      = local.create_dedicated_bucket ? aws_s3_bucket.default.0.id : var.artifact_bucket_id
  tags = merge(
    {
      "terraform-module" = "glovo/mlflow/aws"
    },
    var.tags
  )
}

