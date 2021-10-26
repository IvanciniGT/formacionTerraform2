# Terraform?

Lenguaje para crear infraestructura en la nube (más proveedores) mediante código.


Que hago con el hw? De donde lo saco?
La compro? NO
    La alquilo. A quien? Cloud

Cloud? Cloud Computing?
Conjunto de servicios que ofrece un proveedor a través de internet.
AWS: Cloud de Amazon
Azure: Cloud de Ms
    INFRA <<<<<    Poder ejecutar alli software o guardar datos
    
Servicio:
    IaaS - Infraestructura: Maquina (fisica o virtual), Almacenamiento, Redes (politicas - firewall), Claves 
    PaaS - Bases de datos, Kubernetes, Bigdata (Cluster Hadoop)
    SaaS - Text-to-speech

AUTOMATIZAR:
    Quitarme trabajo:    Precisa de una inversión: PROGRAMAS QUE HAGAN LO QUE ANTES HACIAN HUMANOS
        A corto o "a medio"
    Inmediatez
    Trabajo Desatendido (HUMANO)
    Estandarización
    Evitar errores humanos

git <<<<< SCM       DEV

Ansible Tower <<<<  GIT

DEV--->OPS:
    Cultura / Filosofía    de VAMOS A AUTOMATIZAR TODO LO QUE ESTÁ ENTRE EL DEV y la OPS EN LA EMPRESA
    Tareas:
        Empaquetado de software
            Maven
            Gradle
            ANT
            MSBuild
        Instalaciones Pruebas
            Ansible 
            Puppet
            WAS - WLST
        Pruebas
            Selenium
            Appium
            SoapUI
            SonarQube
        Control de los instalables (Nexus, Artifactory)
        Instalaciones Producción
            Vagrant
            Terraform    ******
            
            Kubernetes
            Docker
            Openshift
        Operación: 
            Escalado
            Reinicios
            HA


DEV-->OPS
    
    script   .sh
              .bat
              .cmd
        
    Desarrollador---> git (HECHO) ---> MAVEN (empaquetado)  ---> TERRAFORM (infra) --> ANSIBLE (instacion y conf)
        Orquestar todas esas tareas de automatización: 
            Jenkins (Servidor de CI/CD)
            TravisCI
            Bamboo
            TeamCity
            AzureDevops    (TFS)
            Github <<<< Actions

Hashicorp:
    Terraform - Herramienta de AUTOMATIZACION creación, eliminación, mantenimiento de infraestructura
    Vagrant   - Herramienta de AUTOMATIZACION creación, eliminación, mantenimiento de Máquinas virtuales

Redhat
    Ansible proyect < Ansible engine      ///     Puppet    Chef
                Herramienta de AUTOMATIZACION infraestructuras.... configuraciones, operar
    AnsibleTower    < AWX
    
    
    Escalabilidad / HA
    
                    CPU 
    Nodo 1                      POP !
        App1        55% 
    Nodo 2          V           POP !
        App1        55%
        
---------------------------------------------------
TERRAFORM
---------------------------------------------------
- Hablamos de estado finales / Camino para llegar a ese estado
- Los ficheros de configuración / declaración de Terraform :
    -   tienen extensión tf
    -   Lenguaje HashiCorpLanguage HCL (Muy parecido a JSON: "")

Lenguajes informaticos:
    Lenguaje de Programación
    Lenguajes de etiquetado de información
        YAML
        JSON
        HCL
        
        
terraform lo ejecutaremos en un directorio
    Ese directorio es el directorio de mi despliegue
        ^
    init                (inicialización de programa)        |        refresh   (sincroniza el archivo de estado de tf con el cloud)
    validate            (sintactica)                        |
    plan                (de cambios)                        |
    apply                                                   |
    destroy                                                 |
    

Local
--------------------------------------------------------------------------------------------------------------------------------------
Fichero HCL (infra)                         ---->              CLOUD (Azure, AWS)  <<< Gracioso de turno (hacer cambios manuales)
                                        Implica que Terraform debe conocer el estado del cloud (Puede requerir mucho tiempo)

En los fichero HCL vamos a utilizar una serie de componentes/Objetos:
    - Provider:    Proveedor
        Interaccionar con un CLOUD: Codigo(Programas que necesito descargar para complementar terraform y hablar con mis distintos proveedores de cloud)
            ^^^ INIT
        Requieren configuración
    - Resource: Los usamos de continuo... es el objetivo de terraform
        Definen que quiero contratar en el cloud
        Todo recurso tendrá un tipo y un nombre (actúa de identificador único)
    - Provisioner: Aprovisionador      ************ FINA LINEA ENTRE Y EL BIEN Y EL MAL 
        Permiten ejecutar código dentro de terraform:
            - dentro de un recurso (maquina, contenedor, maquina virtual): remote_exec     sh
            - en la misma máquina donde estoy ejecutando terraform       : local_exec      sh
    - variable: Parametrizaciones
    - output:   salida / resultado de mi ejecución
        Dame de la maquina su IP -> NUEVA_IP_DE_MI_MAQUINA
        
        
AWS
    EC2 - Servicio de infra
        Instancia - Maquina
        AMI - Imagen de SO + Software que quiero montar
        SecurityGroup - Reglas de red /Firewall de red
        
Contenedores-Docker 
    Que es un contenedor?
        Es un entorno aislado donde correr procesos dentro de una maquina con SO Linux.
            Aislado:
                Su propia configuración de red - IP
                Limitación de recursos
                Filesystem (Programas)
                Sus propios procesos en ejecución
                
                
    Apache httpd  <<<< Servidor WEB + capacidades de proxy reverso
    nginx ------------ Proxy reverso ++++ servidor web