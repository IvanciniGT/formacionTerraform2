# MODULE: contenedor

Este módulo permite crear contenedores de docker.

## Uso
```terraform

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
```

## Providers

Este módulo usa el proveedor: [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)

## Variables

| Variable | Tipo | Requerido | Descripcion |
| ---      | ---  | ---       | ---         |
| software | string | √ | Imagen del contenedor |
| tag | string | x | Versión de la imagen del contenedor |
| nombre | string | √ | Nombre del nuevo contenedor |
| puertos | list(map(number)) | x | Listado de puertos a exponer |

## Outputs

