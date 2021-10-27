terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker" 
        } 
    }
}

module "nginx" {
    source      = "./contenedor"
    software    = "nginx"
    tag         = "latest"
    nombre      = "mi-contenedor-nginx"
}

module "apache" {
    source      ="./contenedor"
    software    = "httpd"
    nombre      = "mi-contenedor-apache"
}