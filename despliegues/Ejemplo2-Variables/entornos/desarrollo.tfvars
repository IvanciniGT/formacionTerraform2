software = "nginx"
tag = "latest"
nombre = "nginx"
variables_entorno = [
    "V1=A1",
    "V2=A2"
]
puertos_a_exponer=[
        {
            puerto_interno = 80
            puerto_externo = 8008
        },
        {
            puerto_interno = 443
            puerto_externo = 8433
        }
    ]

comando = ["echo","Hola"]