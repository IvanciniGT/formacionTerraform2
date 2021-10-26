variable "cantidad_app1" {
    type    = number
    default = 4
}

variable "cluster_app2" {
    type    = map(number)
    default = {
        app2_0 = 9100
        app2_1 = 9101
    }
}


variable "cluster_app3" {
    type    = map(map(number))
    default = {
        app3_0 = {
            puerto = 9200
            puerto_interno = 80
        }
        app3_1 = {
            puerto = 9201
            puerto_interno = 80
        }
    }
}
variable "cluster_app3_comandos" {
    type    = map(list(string))
    default = {
        app3_0 = ["sh","-c", "sleep 3600"]
        app3_1 = ["sh","-c", "sleep 7200"]
    }
}


variable "cluster_app4" {
    type = list(map(string))
    default = [
        {
            nombre = "app4_0"
            puerto = 9300
        },
        {
            nombre = "app4_1"
            puerto = 9301
        }
    ]
}