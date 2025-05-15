variable "server_count" {
  description = "Number of servers to create"
  type        = number
  default     = 1
}

variable "server_name" {
  description = "Prefix for resource names"
  type        = string
  default     = "server"
}

variable "server_type" {
  description = "Hetzner server type"
  type        = string
  default     = "cx11"
}

variable "image" {
  description = "Hetzner server image"
  type        = string
  default     = "ubuntu-22.04"
}

variable "location" {
  description = "Hetzner location"
  type        = string
  default     = "nbg1"
}

variable "ssh_keys" {
  description = "SSH key IDs to add to the server"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Labels to add to the server"
  type        = map(string)
  default     = {}
}

variable "lst_firewall_ids" {
  description = "List of firewall ids"
  type        = list(number)
}
