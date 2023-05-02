variable "private_dns_resolver_forwarding_rules" {
  description = "Manage Private DNS Resolver Forwarding Rules."
  type = map(object({
    dns_forwarding_ruleset_id = string
    domain_name               = string
    enabled                   = bool
    metadata                  = map(string)
    target_dns_servers = map(object({
      ip_address = string
      port       = number
    }))
  }))
  default = null
}
