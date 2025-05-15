output "network_id" {
  description = "ID of the created network"
  value       = hcloud_network.network.id
}

output "network_name" {
  description = "Name of the created network"
  value       = hcloud_network.network.name
}

output "network_ip_range" {
  description = "IP range of the created network"
  value       = hcloud_network.network.ip_range
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = hcloud_network_subnet.subnet.id
}

output "subnet_ip_range" {
  description = "IP range of the created subnet"
  value       = hcloud_network_subnet.subnet.ip_range
}

output "firewall_id" {
  description = "ID of the created network firewall"
  value       = var.enable_network_firewall ? hcloud_firewall.network_firewall[0].id : null
}

output "egress_id" {
  description = "ID of the created egress firewall"
  value = var.enable_egress_firewall ? hcloud_firewall.egress_firewall[0].id : null
}

output "enable_network_firewall" {
  description = "Firewall enabeled"
  value       = var.enable_network_firewall
}

output "enable_egress_firewall" {
  description = "Firewall enabeled"
  value       = var.enable_egress_firewall
}