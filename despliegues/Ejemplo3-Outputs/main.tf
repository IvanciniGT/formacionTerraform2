# terraform init
# terraform validate
# terraform plan
# terraform apply
# terraform refresh

# Configuraciones de terraform
# Solo tenemos una marca terraform
terraform {
    required_providers {
        docker = {
            # Donde está el código de este provider
            source = "kreuzwerker/docker" # Es un nombre de repo de terraform
        }             
    }
}

# Configuraciones de los proveedores que vamos a utilizar
# Para cada proveedor que configuremos tendremos una marca provider
# provider "nombre_proveedor" {
#  ... Configuración del proveedor... que dependerá del provider
# }
provider "docker" {
    # En este caso no necesito configuración adicional con docker
}

# Definiendo los recursos que quiero de mis proveedores
# Para cada recursos que configuremos tendremos una marca recursos
# El "tipo_de_recurso" dependerá del provider
# A un recurso postermente me podré referir mediante la sintaxis: tipo_de_recurso.nombre
# resource "tipo_de_recurso" "nombre" {
#   ....    características del recurso ... que dependerán del tipo de recurso
#   caracteristica1 = Valor
# }

resource "docker_image" "imagen" {
    name = "httpd:latest"
}

resource "docker_container" "contenedor" {
    name = "outputs"
    image = docker_image.imagen.latest # Esta propiedad espera el IDENTIFICADOR DE LA IMAGEN 
}



# git: Versiones de mi archivo