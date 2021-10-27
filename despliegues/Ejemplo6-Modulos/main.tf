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
    puertos     = [
        {
            interno = 80
            externo = 8008
        }
    ]
}

module "apache" {
    source      ="./contenedor"
    software    = "httpd"
    nombre      = "mi-contenedor-apache"
    puertos     = [
        {
            interno = 80
            externo = 8009
        }
    ]
}