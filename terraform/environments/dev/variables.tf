variable "location" {
  description = "Location for Hetzner resources"
  type        = string
  default     = "nbg1"
}

variable "private_key_filename" {
  description = "The filename for the private key"
  type        = string
  default     = "id_rsa"
}

variable "public_key_filename" {
  description = "The filename for the public key"
  type        = string
  default     = "id_rsa.pub"
}

variable "my_ip" {
  description = "my ip"
  type = string
}

variable "active_firewall_ids" {
  description = "List of active firewall IDs"
  type        = list(string)
  default     = []  
}