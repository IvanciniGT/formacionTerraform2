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
    name = "httpd:latest"
}

resource "docker_container" "app1" {
    count = var.cantidad_app1
    name = "cluster_app1_${count.index}"
    image = docker_image.imagen.latest 
    ports {
        internal = 80
        external = 9000 + count.index
    }
}


resource "docker_container" "app2" {
    for_each = var.cluster_app2
    name = "${each.key}"
    image = docker_image.imagen.latest 
    ports {
        internal = 80
        external = each.value
    }
}



resource "docker_container" "app3" {
    for_each = var.cluster_app3
    name = "${each.key}"
    image = docker_image.imagen.latest 
    ports {
        internal = each.value.puerto
        external = each.value.puerto_interno
    }
    command = var.cluster_app3_comandos[each.key]
}

resource "docker_container" "app4" {
    count = length(var.cluster_app4)
    name = var.cluster_app4[count.index].nombre
    image = docker_image.imagen.latest 
    ports {
        internal = 80
        external = var.cluster_app4[count.index].puerto
    }
}
