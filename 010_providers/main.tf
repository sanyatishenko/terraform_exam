terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = " ~> 3.0"
      configuration_aliases = [ aws.east ]
    }
  }
}

# export AWS_ACCESS_KEY_ID="my-access-key"
# export AWS_SECRET_ACCESS_KEY="my-secret-key"

provider "aws" {
  # Configuration options
  region     = "us-west-2"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

provider "aws" {
  alias = "east"
  # Configuration options
  region     = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

data "aws_availability_zones" "us-west-2-az" {
  state = "available"
}

data "aws_availability_zones" "us-east-1-az" {
  provider = aws.east
  state = "available"
}

output us-west-2-azs {
  value       = data.aws_availability_zones.us-west-2-az
  description = "AZs in us-west-2"
}

output us-east-1-azs {
  value       = data.aws_availability_zones.us-east-1-az
  description = "AZs in us-east-1"
}