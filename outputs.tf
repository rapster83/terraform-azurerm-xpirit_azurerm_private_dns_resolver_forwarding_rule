# azurerm_resource_group
output "resource_group_id" {
  description = "The ID of the resource group (RG)."
  value       = try(azurerm_resource_group.this[0].id, null)
}

output "resource_group_name" {
  description = "The name of the resource group (RG)."
  value       = try(azurerm_resource_group.this[0].name, null)
}

# azurerm_private_dns_resolver_dns_forwarding_ruleset
output "private_dns_resolver_dns_forwarding_ruleset_ids" {
  description = "The IDs of the Private DNS Resolver Dns Forwarding Rulesets."
  value       = { for forwarding_ruleset in azurerm_private_dns_resolver_dns_forwarding_ruleset.this : forwarding_ruleset.name => forwarding_ruleset.id }
}

# azurerm_private_dns_resolver_forwarding_rule
output "private_dns_resolver_dns_forwarding_rule_ids" {
  description = "The IDs of the Private DNS Resolver Forwarding Rules."
  value       = { for forwarding_rule in azurerm_private_dns_resolver_forwarding_rule.this : forwarding_rule.name => forwarding_rule.id }
}

# azurerm_private_dns_resolver_virtual_network_link
output "private_dns_resolver_virtual_network_link_ids" {
  description = "The IDs of the Private DNS Resolver Virtual Network Links."
  value       = { for virtual_network_link in azurerm_private_dns_resolver_virtual_network_link.this : virtual_network_link.name => virtual_network_link.id }
}
