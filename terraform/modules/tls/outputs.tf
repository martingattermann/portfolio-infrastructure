output "private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}

output "public_key_path" {
  description = "Path to the public key file"
  value       = local_file.public_key.filename
}

output "public_key" {
  description = "Public key content"
  value       = tls_private_key.ssh_key.public_key_openssh
}

output "private_key" {
  description = "Private key content (Use with caution!)"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}