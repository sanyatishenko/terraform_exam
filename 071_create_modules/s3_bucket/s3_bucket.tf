resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.sse_algorithm == "aws:kms" ? var.kms_master_key_id : null
      }
    }
  }

  versioning {
    enabled = var.versioning
  }
}

resource "aws_s3_bucket_public_access_block" "block_s3_public" {
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
  bucket                  = aws_s3_bucket.bucket.id

}

resource "aws_s3_bucket_policy" "bucket_access" {
  bucket = aws_s3_bucket.bucket.id
  policy = templatefile("${path.module}/S3_policy.tftpl", {
      "s3_bucket_name" = var.bucket_name
      "vpc"            = var.vpc
    }
  )
}