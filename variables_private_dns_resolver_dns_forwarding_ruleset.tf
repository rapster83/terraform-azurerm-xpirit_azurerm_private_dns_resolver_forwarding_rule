variable "create_private_dns_resolver_dns_forwarding_ruleset" {
  description = "Enable or disable private DNS resolver forwarding ruleset creation."
  type        = bool
  default     = false
}

variable "private_dns_resolver_dns_forwarding_ruleset_name" {
  description = "Specifies the name which should be used for this Private DNS Resolver Dns Forwarding Ruleset. Changing this forces a new Private DNS Resolver Dns Forwarding Ruleset to be created."
  type        = string
  default     = null
}

variable "private_dns_resolver_dns_forwarding_ruleset_outbound_endpoint_ids" {
  description = "The list of IDs of the Private DNS Resolver Outbound Endpoint that is linked to the Private DNS Resolver Dns Forwarding Ruleset."
  type        = list(string)
  default     = null
}

variable "private_dns_resolver_dns_forwarding_ruleset_outbound_endpoint_names" {
  description = "The list of names of the Private DNS Resolver Outbound Endpoint that is linked to the Private DNS Resolver Dns Forwarding Ruleset."
  type        = list(string)
  default     = null
}

variable "private_dns_resolver_dns_forwarding_ruleset_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
