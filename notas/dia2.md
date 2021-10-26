Terraform:
    Carpeta para nuestro depliegue
    Ficheros HCL ~ YAML - JSON
    main.tf
        providers nombre
        resources tipo y nombre  (  tipo.nombre  )
    
    Comandos terraform
        init                    descargar plugins (codigo) de los proveedores    
                .terraform      Carpeta ocn información del proyecto 
                        <<<<<   Código de los providers
                .terraform.lock.hcl    Version del providers que se había descargado y unas huellas
        validate
        plan                    Decia los cambios que iban a realizarse sobre los servicios contrados 
                                actualmente en el proveedor.
                                    ---> Guardar
        apply                   Aplica los cambios de un plan
        destroy
        -------------
        refresh                 Sincronizar la información de la infra con el proveedor.
                                Donde se guarda esto: terraform.tfstate
                                
                                



apache 80

contenedor Apache 80-> IP? Una IP de la red lógica que crea Docker
                            loopback

-------------------------------------- red de mi empresa
|   192.168.1.129:8008----         |
|   v                    |         |
PC Carlos 192.168.1.129  |      PC Lucia 192.168.1.198
    | 172.17.0.1         |
    |                    v 
    |-Contenedor Apache 172.17.0.2:80
    |
    |
    docker

docker container create -e VAR1=VALOR1 -e VAR2=VALOR2
                        --name MIAPACHE \
                        -p 8008:80      \
                        MI-IMAGEN:VERSION
entorno environment

80
443 https

command




9200    ->     TEXTO ----> "9200"
true    ->     TEXTO ----> "true"
"9200"  ->     number ----> 9200
"true"  ->     bool   ----> true