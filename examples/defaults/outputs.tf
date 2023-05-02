# azurerm_resource_group
output "resource_group_id" {
  description = "The ID of the resource group (RG)."
  value       = module.defaults.resource_group_id
}

output "resource_group_name" {
  description = "The ID of the resource group (RG)."
  value       = module.defaults.resource_group_name
}

# azurerm_private_dns_resolver_dns_forwarding_ruleset
output "private_dns_resolver_dns_forwarding_ruleset_ids" {
  description = "The IDs of the Private DNS Resolver Dns Forwarding Rulesets."
  value       = module.defaults.private_dns_resolver_dns_forwarding_ruleset_ids
}

# azurerm_private_dns_resolver_forwarding_rule
output "private_dns_resolver_dns_forwarding_rule_ids" {
  description = "The IDs of the Private DNS Resolver Forwarding Rules."
  value       = module.defaults.private_dns_resolver_dns_forwarding_rule_ids
}

# azurerm_private_dns_resolver_virtual_network_link
output "private_dns_resolver_virtual_network_link_ids" {
  description = "The IDs of the Private DNS Resolver Virtual Network Links."
  value       = module.defaults.private_dns_resolver_virtual_network_link_ids
}
