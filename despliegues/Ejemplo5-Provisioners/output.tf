output "direccion_ip" {
    value = docker_container.contenedor[0].ip_address
}
