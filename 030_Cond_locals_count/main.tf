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

variable env {
  type        = string
  default     = "Dev"
  description = "Environment"
  
  validation {
      condition = contains(["Dev","Test","Prod"], var.env)
      error_message = "The environment must be Dev, Test or Prod."
  }
}

locals {
  amount_of_instances = var.env == "Prod" ? 3 : 1
}

resource "aws_instance" "ec2" {
  count = local.amount_of_instances
  ami               = "ami-0d527b8c289b4af7f"
  instance_type     = "t2.micro"

  tags = {
      "Name" = "ec2-${count.index}"
      "Environment" = var.env
  }
}
