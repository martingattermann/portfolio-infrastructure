output "server_ids" {
  description = "IDs of created servers"
  value       = hcloud_server.server[*].id
}

output "server_ips" {
  description = "IP addresses of created servers"
  value       = hcloud_server.server[*].ipv4_address
}

output "server_names" {
  description = "Names of created servers"
  value       = hcloud_server.server[*].name
}