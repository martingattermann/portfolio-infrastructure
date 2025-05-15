terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.38.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 5.3.0"
    }
  }
  required_version = ">= 1.0.0"
}


