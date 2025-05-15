output "hetzner_server_ips" {
  description = "IP addresses of the created Hetzner servers"
  value       = module.hetzner_compute.server_ips
}

output "hetzner_network_id" {
  description = "ID of the created Hetzner network"
  value       = module.hetzner_network.network_id
}

output "hetzner_network_firewall_id" {
  description = "ID of the created Hetzner firewalls"
  value = module.hetzner_network.firewall_id
}
