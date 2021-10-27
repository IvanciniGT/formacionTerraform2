variable "software" {
    type        = string    // bool, number
                            // list()   Ordenada
                            // set()    Desordenado
                            // map()    Conjuntos donde cada valor lleva un identificador expreso
    description = "Nombre del repo de la imagen de contenedor que se instalará"
}

variable "tag" {
    default     = "latest"
    type        = string
    description = "Versión del repo de la imagen de contenedor que se instalará"
}

variable "nombre" {
    type        = string
    description = "Nombre del contenedor que se instalará"
}


variable "puertos" {
    description = "Puertos del contenedor que se expondrá"
    type        = list(map(number))
    default     = [ ]
}
