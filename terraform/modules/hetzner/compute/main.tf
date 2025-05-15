resource "hcloud_server" "server" {
  count       = var.server_count
  name        = var.server_name
  server_type = var.server_type
  image       = var.image
  location    = var.location
  ssh_keys    = var.ssh_keys
  labels      = var.labels
  firewall_ids = var.lst_firewall_ids
}