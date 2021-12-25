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

module "bucket" {
  source = "./s3_bucket/"

  bucket_name = "test-bucket-modules-0001756"
  vpc         = "vpc-f3b06499"
}