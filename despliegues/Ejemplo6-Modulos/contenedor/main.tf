terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker" 
        } 
    }
}

provider "docker" {
}

resource "docker_container" "contenedor" {
    name  = "${var.nombre}"
    image = docker_image.imagen.latest 
}

resource "docker_image" "imagen" {
    name = "${var.software}:${var.tag}"
}
