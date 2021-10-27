directorios para nuestros despliegues
    main.tf <<<<<     loquesea.tf
        resources
            propiedades
                block: No lleva detrás un signo = para asignar un valor
                       En su lugar lleva? Llaves englobando otros valores
                       P ej. Ports en los contenedores de docker
                    Para generarlos dinamicamente, usamos la palabra dynamic... algo así como hacer un bucle
                Qué pasa si a una propiedad de un recurso le asigno el valor null?
                    Es como si no hubiera definido esa propiedad
            que podiamos crear grupos de recursos:
                count           lista de objetos        count.index
                for_each        mapa                    each.key        each.value
        providers           ---> Alguien contra el que puedo hacer operaciones
        provisioners          ---> Permitia ejecutar comandos (bash, pshell)
            locales
            remotos
        terraform
            datasources     ---> Me permite interrogar a mi provider para obtener datos de él
            modules
    variables.tf
        declarar variables
    
    valores de variables adicionales:
        variables.tfvars                    Los valores se ponian o bien en HCL o en JSON
        variables.tfvars.json               JSON <<< En este caso todo el fichero es JSON
        variables.auto.tfvars               Se cargan en automatico con valores de la variables (sobreescriben a los default si los hay)
        terraform.tfvars                    También se carga en automático
    
    output.tf
        declarar output -> Variables que puedo solicitar posteriormente con valores que se rellenan tras crear la infra
            Como los interrogábamos?     terraform output <ARGS> <QUE_OUTPUT>   
                                                            -raw
                                                            -json



Ansible Tower / AWX ----> Github donde tenemos los playbooks, inventario             // Jenkins
    Aplicación web, que permite orquestar ejecuciones de playbooks de ansible
    
Ansible engine--- comando que yo ejecuto en una terminal.... los ficheros que ejecuto (playbooks, inventario) me los gestiono yo
Terraform--- comando que yo ejecuto en una terminal.... los ficheros que ejecuto (despliegues) me los gestiono yo

Ansible Tower -- Terraform Cloud (Servicio de la gente de Hashicorp)

modulo

Ansible
    role?
        Plantilla de tareas empaquetada y personalible que puedo reutilizar (función)
        Ansible Galaxy
Existe en Terraform un ansoble galaxy: NO
                                        GITHUB, GITLAB, BITBUCKET repos git
terraform, cuando use un modulo, y me pide la url desde la que sacar el codigo del modulo, le doy la del repo de git



TERRAFORM ---> Hablar con GCP
                Dame un maquina 
                    Crea el maquina
          ----> Hablar con GCP
                 Oye, dame los datos, del maquina ese, que tenemos tu y yo a pachas
          < ----   Los datos del maquina (IP)
Me lo apunto... 
tf.state


1º Permitir configurar los puertos que deben exponerse
2º Generar un output con el id del contenedor

