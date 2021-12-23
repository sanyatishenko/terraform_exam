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


resource "aws_instance" "ec2" {
  ami           = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  key_name      = "VDI-Frankfurt-test"

  tags = {
    "Name" = "ec2-provisioners"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> privat_ip.ppk"
  }


  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.private_ip
    private_key = file("./VDI-Frankfurt-test.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt-get install apache2 -y",
      "sudo service apache2 start",
      "sudo systemctl enable apache2",
      "sudo echo “Hello World from $(hostname -f)” > /var/www/html/index.html"
    ]
  }


}

