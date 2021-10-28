terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws" 
        }
        tls = {
            source = "hashicorp/tls"
        }
    }
}

provider "aws" {
    region = "eu-west-1"
}

provider "tls" {
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
  key_name = aws_key_pair.mis_claves.id

  tags = {
    Name = "Servidor_Ivan"
  }
  
  // Conectaros con el servidor a través de la clave ssh
  
    connection {
        user     = "ubuntu"
        private_key = tls_private_key.mi_clave_privada.private_key_pem
        port     = "22"
        type     = "ssh"   // winrm
        host     = self.public_ip
    }
    provisioner "remote-exec" {
        inline = [
                    "echo Hola... estoy dentro del servidor"
                 ]
    }
}

resource "aws_security_group" "reglas_mysql" {
    name        = "reglas_red_mysql_ivan_2"
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


resource "aws_key_pair" "mis_claves" {
  key_name   = "clave-ivan"
  public_key = tls_private_key.mi_clave_privada.public_key_openssh 
}

resource "tls_private_key" "mi_clave_privada" {
  algorithm   = "RSA"
  rsa_bits = "4096"
  
  provisioner "local-exec" {
      command ="echo '${self.private_key_pem}' > clave-privada.pem"
  }
  provisioner "local-exec" {
      command ="echo '${self.public_key_pem}' > clave-publica.pem"
  }
  
}
