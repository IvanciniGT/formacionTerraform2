terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker" 
        } 
    }
}

//provider "docker" {
//}

resource "docker_image" "imagen" {
    name = "${var.software}:${var.tag}"
}


resource "docker_container" "contenedor" {
    name  = "${var.nombre}"
    image = docker_image.imagen.latest 

    dynamic "ports" {
        for_each = var.puertos // variable lista
        iterator = puerto
        content {
            internal = puerto.value["interno"]
            external = puerto.value["externo"]
        }
    }
    
}
