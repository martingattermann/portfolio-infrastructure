resource "tls_private_key" "ssh_key" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = var.private_key_filename
  file_permission = "600"
}

resource "local_file" "public_key" {
  content  = tls_private_key.ssh_key.public_key_openssh
  filename = var.public_key_filename
}