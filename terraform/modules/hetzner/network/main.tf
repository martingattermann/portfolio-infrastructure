resource "hcloud_network" "network" {
  name     = var.network_name
  ip_range = var.ip_range
  labels   = var.labels
}

resource "hcloud_network_subnet" "subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = var.subnet_ip_range != "" ? var.subnet_ip_range : var.ip_range
}

# Optional: Create a firewall for the network
resource "hcloud_firewall" "network_firewall" {
  count = var.enable_network_firewall ? 1 : 0
  name  = "${var.network_name}-firewall"

  # Allow internal traffic
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = [var.my_ip_range]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "80"
    source_ips = var.cloudflare_ips
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "443"
    source_ips = var.cloudflare_ips
  }

  rule {
    direction = "in"
    protocol = "tcp"
    port = "19191"
    source_ips = [var.my_ip_range]
  }

  rule {
    direction = "in"
    protocol = "tcp"
    port = "19090"
    source_ips = [var.my_ip_range]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "9090"
    source_ips = [var.my_ip_range]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "9113"
    source_ips = [var.my_ip_range]
  }

    rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "9100"
    source_ips = [var.my_ip_range]
  }
}

resource "hcloud_firewall" "egress_firewall" {
  count = var.enable_egress_firewall ? 1: 0
  name = "${var.egress_name}-firewall"

  rule {
    direction = "out"
    protocol = "tcp"
    port = "80"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction = "out"
    protocol = "tcp"
    port = "443"
    destination_ips = ["0.0.0.0/0"]
  }
}
