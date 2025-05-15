variable "domain" {
    type = string
}

variable "subdomain" {
    type = string
}

variable "record_type" {
    default = "A"
    type = string
}

variable "server_ip" {
    type = string
}

variable "ttl_value" {
    default = 3600
}


