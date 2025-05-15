data "cloudflare_zone" "selected" {
    filter = {
      name = var.domain
    }
}

resource "cloudflare_dns_record" "subdomain_record" {
    zone_id = data.cloudflare_zone.selected.zone_id
    name = var.subdomain
    type = var.record_type
    content = var.server_ip
    ttl = var.ttl_value
    proxied = true
}
