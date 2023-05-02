# global
variable "example_location" {
  description = "Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "example_tags" {
  description = "A mapping of tags which should be assigned to all resources."
  type        = map(string)
  default     = null
}

# azurerm_resource_group
variable "create_resource_group" {
  description = "Enable or disable RG creation."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name which should be used for this RG. Changing this forces a new RG to be created."
  type        = string
}

# azurerm_private_dns_resolver_dns_forwarding_ruleset
variable "create_private_dns_resolver_dns_forwarding_ruleset" {
  description = "Enable or disable private DNS resolver forwarding ruleset creation."
  type        = bool
  default     = true
}

variable "private_dns_resolver_dns_forwarding_ruleset_name" {
  description = "Specifies the name which should be used for this Private DNS Resolver Dns Forwarding Ruleset. Changing this forces a new Private DNS Resolver Dns Forwarding Ruleset to be created."
  type        = string
  default     = null
}

variable "private_dns_resolver_dns_forwarding_ruleset_outbound_endpoint_names" {
  description = "The list of names of the Private DNS Resolver Outbound Endpoint that is linked to the Private DNS Resolver Dns Forwarding Ruleset."
  type        = list(string)
  default     = null
}

# azurerm_private_dns_resolver_forwarding_rule
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

# azurerm_private_dns_resolver_virtual_network_link
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
