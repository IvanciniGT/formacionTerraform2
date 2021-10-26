output "direccion_ip" {
    value = docker_container.contenedor.ip_address
}

output "redes" {
    value = docker_container.contenedor.network_data
}

output "red" {
    value = docker_container.contenedor.network_data[0]
}
output "gateway_red_0" {
    value = docker_container.contenedor.network_data[0].gateway
}

output "todos_los_gateway" {
    value = docker_container.contenedor.*.gateway
}