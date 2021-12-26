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

# terraform workspace new dev
# terraform plan
# Outputs: + ec2_type = "t3.micro"

# terraform workspace new prod
# terraform plan
# Outputs: + ec2_type = "t3.small"

# terraform workspace show
#   prod

# terraform workspace list
#   default
#   dev
# * prod

# terraform workspace select default
# Switched to workspace "default".

# terraform plan
# Outputs: + ec2_type = "t3.nano"

/*
   .
   |-terraform.tfstate.d
   |---dev
   |---prod
*/

# terraform workspace delete prod
# Deleted workspace "prod"!
# terraform workspace list
# * default
#   dev