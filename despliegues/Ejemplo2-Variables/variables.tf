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
    default     = "Prueba"
}

variable "puertos_a_exponer" {
    description = "Puertos del contenedor que se expondrá"
    type        = list(map(number))
    default     = [
        {
            puerto_interno = 80
            puerto_externo = 8008
        },
        {
            puerto_interno = 81
            puerto_externo = 8009
        },
        {
            puerto_interno = 443
            puerto_externo = 8433
        }
    ]
}

variable "variables_entorno" {
    description = "Variables que se inyectarán al entorno del contenedor"
    type        = set(string)
    default     = [ 
        "VARIABLE1=VALOR1", 
        "VARIABLE2=VALOR2", 
        "VARIABLE3=VALOR3" 
    ] 
}


variable "comando" {
    type        = list(string)
    description = "Comando para ejecutar en el contenedor"
    default = null
}