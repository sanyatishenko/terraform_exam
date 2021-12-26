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

locals {
    ec2_type_list = {
        "dev" = "t3.micro",
        "prod" = "t3.small"
    }
    default_ec2_type = "t3.nano"

    type = lookup(local.ec2_type_list, terraform.workspace,local.default_ec2_type)
}


output "ec2_type"{
    value =local.type
}
