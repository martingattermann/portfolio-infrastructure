variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "ip_range" {
  description = "IP range for the network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "labels" {
  description = "Labels to add to the network"
  type        = map(string)
  default     = {}
}

variable "network_zone" {
  description = "Network zone"
  type        = string
  default     = "eu-central"
}

variable "subnet_ip_range" {
  description = "IP range for the subnet (defaults to network IP range if not specified)"
  type        = string
  default     = ""
}

variable "enable_network_firewall" {
  description = "Whether to enable network firewall"
  type        = bool
  default     = false
}

variable "enable_egress_firewall" {
  description = "allow egress traeffik"
  type = bool
  default = false
}

variable "my_ip_range" {
  description = "my ip range"
  type = string
  default = "0.0.0.0/0"
}

variable "cloudflare_ips" {
  description = "cloudflare ip range"
  type = list(string)
  default = [
    "173.245.48.0/20",
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "141.101.64.0/18",
    "108.162.192.0/18",
    "190.93.240.0/20",
    "188.114.96.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17",
    "162.158.0.0/15",
    "104.16.0.0/13",
    "104.24.0.0/14",
    "172.64.0.0/13",
    "131.0.72.0/22"
  ]
}

variable "egress_name" {
  description = "egress name"
  type = string
}
