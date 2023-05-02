variable "private_dns_resolver_virtual_network_links" {
  description = "Manages Private DNS Resolver Virtual Network Links."
  type = map(object({
    dns_forwarding_ruleset_id = string
    virtual_network_id        = string
    virtual_network_name      = string
    metadata                  = map(string)
  }))
  default = null
}

variable "private_dns_resolver_virtual_network_links_virtual_networks" {
  description = "The IDs of the Virtual Networks that is linked to the Private DNS Resolver Virtual Network Link. Changing this forces a new resource to be created."
  type        = map(string)
  default     = null
}
