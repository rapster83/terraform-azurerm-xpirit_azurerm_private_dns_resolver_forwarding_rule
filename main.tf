resource "azurerm_resource_group" "this" {
  count    = var.create_resource_group ? 1 : 0
  location = var.module_location
  name     = var.resource_group_name

  tags = merge(
    var.module_tags,
    var.resource_group_tags
  )
}

resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "this" {
  count                                      = var.create_private_dns_resolver_dns_forwarding_ruleset ? 1 : 0
  name                                       = var.private_dns_resolver_dns_forwarding_ruleset_name
  resource_group_name                        = try(azurerm_resource_group.this[0].name, var.resource_group_name)
  location                                   = var.module_location
  private_dns_resolver_outbound_endpoint_ids = var.private_dns_resolver_dns_forwarding_ruleset_outbound_endpoint_ids

  tags = merge(
    var.module_tags,
    var.private_dns_resolver_dns_forwarding_ruleset_tags
  )
}

resource "azurerm_private_dns_resolver_forwarding_rule" "this" {
  for_each                  = var.private_dns_resolver_forwarding_rules != null ? var.private_dns_resolver_forwarding_rules : {}
  name                      = each.key
  dns_forwarding_ruleset_id = try(azurerm_private_dns_resolver_dns_forwarding_ruleset.this[0].id, each.value.dns_forwarding_ruleset_id)
  domain_name               = each.value.domain_name
  enabled                   = each.value.enabled
  metadata                  = each.value.metadata

  dynamic "target_dns_servers" {
    for_each = each.value.target_dns_servers != null ? each.value.target_dns_servers : {}

    content {
      ip_address = target_dns_servers.value.ip_address
      port       = target_dns_servers.value.port
    }
  }
}

resource "azurerm_private_dns_resolver_virtual_network_link" "this" {
  for_each                  = var.private_dns_resolver_virtual_network_links != null ? var.private_dns_resolver_virtual_network_links : {}
  name                      = each.key
  dns_forwarding_ruleset_id = try(azurerm_private_dns_resolver_dns_forwarding_ruleset.this[0].id, each.value.dns_forwarding_ruleset_id)
  virtual_network_id        = try(var.private_dns_resolver_virtual_network_links_virtual_networks[each.value.virtual_network_name], each.value.virtual_network_id)
  metadata                  = each.value.metadata
}
