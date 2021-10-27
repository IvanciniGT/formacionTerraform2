terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws" 
        }             
    }
}

provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "mi_servidor" {
  ami           = "ami-0250331fb6081bfd5"
  instance_type = "t2.micro"

  tags = {
    Name = "Servidor_Ivan"
  }
}
