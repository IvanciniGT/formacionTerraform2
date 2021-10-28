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

/*
data "tipo" "nombre-interno"{
    // Caracterizar
}
*/
data "aws_ami" "imagen_so" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = [ "*ubuntu-xenial-16.04-amd64-server-*" ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "mi_servidor" {
  ami           = data.aws_ami.imagen_so.id
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.reglas_mysql.name ]

  tags = {
    Name = "Servidor_Ivan"
  }
}

resource "aws_security_group" "reglas_mysql" {
    name        = "reglas_red_mysql_ivan"
    description = "Permitir trafico entrante al puerto de mysql"
    vpc_id      = null

    ingress {
          description      = "permitir trafico 3306"
          from_port        = 3306
          to_port          = 3306
          protocol         = "tcp"
          cidr_blocks      = [ "0.0.0.0/0" ]
    } 
    
    ingress {
          description      = "permitir trafico 22"
          from_port        = 22
          to_port          = 22
          protocol         = "tcp"
          cidr_blocks      = [ "0.0.0.0/0" ]
    }

   egress {
          from_port        = 0
          to_port          = 0
          protocol         = "-1"
          cidr_blocks      = ["0.0.0.0/0"]
        }

  tags = {
    Name = "reglas_red_mysql_ivan"
  }
}
