output "ami" {
    value = data.aws_ami.imagen_so.id
}
output "clave_privada" {
    value = tls_private_key.mi_clave_privada.private_key_pem
    sensitive = true
}
output "clave_publica" {
    value = tls_private_key.mi_clave_privada.public_key_pem
}
