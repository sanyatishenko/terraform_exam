terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 3.0"
    }
  }
}


provider "aws" {
  region = "eu-central-1"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket              = "modules-test-s3-bucket-000234"
  acl                 = "private"
  block_public_acls   = true
  block_public_policy = true

  versioning = {
    enabled = true
  }

  tags = {
    "Project" = "Test Modules"
  }

}

output "bucket" {
  value       = "s3_bucket_arn"
  description = "S3 arn"
}
