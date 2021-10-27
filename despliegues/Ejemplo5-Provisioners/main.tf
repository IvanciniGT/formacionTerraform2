terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker" 
        }
        null = {
            source = "hashicorp/null" 
        }             
    }
}

provider "docker" {
}

provider "null" {
}

resource "docker_container" "contenedor" {
    count = 4
    name  = "${var.nombre}-${count.index}"
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
    
    provisioner "file" {  // Esto copia archivos, no ejecuta nada
        source      = "main.tf"
        destination = "/tmp/main.tf"
    }
    
    provisioner "remote-exec" {
        // Copia el script y lo ejecuta
        script      = "programa.sh"
    }
    
    provisioner "file" {  // Esto copia archivos, no ejecuta nada
        source      = "programa.sh"
        destination = "programita.sh"
        when = destroy    
    }
    
    provisioner "remote-exec" {
        inline      = ["echo ESTOY DESTRUYENDO","chmod +x programita.sh",
                        "./programita.sh"]
        when = destroy    
    }
}

resource "docker_image" "imagen" {
    name = "${var.software}:${var.tag}"
}

resource "null_resource" "ejecutor" {
    triggers = {
        mi_triguercito = join("",docker_container.contenedor.*.ip_address)
        // Esto monta una cadena de dependencia de recuros.
        // Este recurso no se ejecuta hasta que se ha ejecutado la imagen
    }
    provisioner "local-exec" {
        command = "echo Arranco el cluster"
    }
}