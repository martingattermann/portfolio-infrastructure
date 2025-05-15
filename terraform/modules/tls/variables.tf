variable "algorithm" {
  description = "The algorithm used for SSH key generation"
  type        = string
  default     = "RSA"
}

variable "rsa_bits" {
  description = "The bit length for RSA keys"
  type        = number
  default     = 4096
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