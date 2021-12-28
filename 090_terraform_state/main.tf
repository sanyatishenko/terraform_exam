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

# vpc-f3b06499
resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}
/*
# terraform import aws_vpc.main vpc-f3b06499

aws_vpc.main: Importing from ID "vpc-f3b06499"...
aws_vpc.main: Import prepared!
  Prepared aws_vpc for import
aws_vpc.main: Refreshing state... [id=vpc-f3b06499]

Import successful!


# terraform state list
aws_vpc.main


*/