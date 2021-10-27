terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker" 
        }             
    }
}

provider "docker" {
}

resource "docker_image" "imagen" {
    name = "${var.software}:${var.tag}"
}

resource "docker_container" "contenedor" {
    name  = "${var.nombre}"
    image = docker_image.imagen.latest 
    
    provisioner "local-exec" {
        // Quiero generar un fichero con la ip
        command = "echo ${self.ip_address} > fichero-ips.txt"

        //ESTO ES LO QUE YO OS ACONSEJE, PEDI, SUPLIQUE QUE NO HAGAIS
        //command "ansible-playbook miplaybook ${self.ip_address}"
    }
    
    connection {
        user     = "root"
        password = "root"
        port     = "22"
        type     = "ssh"   // winrm
        host     = "${self.ip_address}"
        //host     = self.ip_address
    }
    provisioner "remote-exec" {
        inline = [
                    "echo Hola... estoy dentro del contenedor",
                    "echo Que bueno estar aqui",
                    "echo ${self.ip_address} > fichero-ips2.txt",
                    "echo fichero generado",
                    // Haría esto?      
                    //  Please no...... quien haría esto mejor que yo? ANSIBLE 
                    //"apt update && install tomcat && systemctl enable tomcat"
                 ]
    }
    
}
