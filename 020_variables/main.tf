terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 3.0"
    }
  }
}


provider "aws" {
  region = var.region
}



data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami.virtualization_type]
  }

  owners = [var.ami.owners]
}


resource "aws_instance" "ec2" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t2.micro"
  source_dest_check = var.source_dest_check
  hibernation       = var.add_parameters[0]
  monitoring        = var.add_parameters[1]


  tags = var.tags
}