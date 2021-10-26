software = "nginx"
tag = "latest"
nombre = "nginx-produccion"


puertos_a_exponer=[
        {
            "puerto_interno": 80,
            "puerto_externo": 8008
        },
        {
            "puerto_interno": 443,
            "puerto_externo": 8433
        }
    ]
    