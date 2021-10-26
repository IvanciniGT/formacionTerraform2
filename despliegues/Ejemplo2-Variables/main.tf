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
    //force_remove = true
}

resource "docker_container" "contenedor" {
    name  = "${var.nombre}"
    image = docker_image.imagen.latest 
    
    env   = var.variables_entorno
    
    dynamic "ports" {
        for_each = var.puertos_a_exponer // variable lista
        iterator = puerto
        content {
            internal = puerto.value["puerto_interno"]
            external = puerto.value["puerto_externo"]
        }
    }
//    dynamic "ports" {
//        for_each = var.puertos_a_exponer // variable lista
//        content {
//            internal = ports.value["puerto_interno"]
//            external = ports.value["puerto_externo"]
//        }
//    }
}
