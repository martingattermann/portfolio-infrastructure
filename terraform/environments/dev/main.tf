module "tls" {
  source = "../../modules/tls"

  providers = {
    tls = tls
  }

  algorithm          = "RSA"
  rsa_bits           = 4096
  private_key_filename = "${path.module}/ssh_key/id_rsa"
  public_key_filename  = "${path.module}/ssh_key/id_rsa.pub" 
}

resource "hcloud_ssh_key" "default" {
  name      = "popos-ssh-key"
  public_key = module.tls.public_key
}

locals {
  active_firewall_ids = flatten([
    for rule in [
      { id = module.hetzner_network.firewall_id, enable = module.hetzner_network.enable_network_firewall },
      { id = module.hetzner_network.egress_id, enable = module.hetzner_network.enable_egress_firewall }
    ] : rule.enable ? [rule.id] : []
  ])
  location = "nbg1"
}

module "hetzner_compute" {
  source = "../../modules/hetzner/compute"

  providers = {
    hcloud = hcloud
  }

  server_name = "ubuntu"
  server_count = 1
  server_type  = "cx22"
  location     = local.location
  image        = "ubuntu-24.04"
  labels       = {
    "env" = "dev"
    "type" = "webserver"
    "managed_by" = "ansible"
    "created_by" = "terraform"
  }
  ssh_keys     = [hcloud_ssh_key.default.id]
  lst_firewall_ids = local.active_firewall_ids
}

module "hetzner_network" {
  source = "../../modules/hetzner/network"

  providers = {
    hcloud = hcloud
  }

  network_name = "dev-network"
  enable_network_firewall = true
  enable_egress_firewall = true
  my_ip_range = var.my_ip
  egress_name = "egress"
}

module "cloudflare_www" {
  source = "../../modules/cloudflare"

  providers = {
    cloudflare = cloudflare
  }

  domain = "example.com" # Replace with your actual domain

  subdomain = "www"
  server_ip = module.hetzner_compute.server_ips[0]
  ttl_value = 1
}
