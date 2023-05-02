resource "random_string" "this" {
  length    = 4
  lower     = true
  min_lower = 4
  special   = false
}

resource "azurerm_resource_group" "this" {
  name     = "rg-example-pdnsrfwr-${random_string.this.result}"
  location = var.example_location
}

resource "azurerm_virtual_network" "this" {
  name                = "vnet-example-pdnsrfwr-prod-01"
  location            = var.example_location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = ["10.60.0.0/16"]
}

resource "azurerm_subnet" "this_in01" {
  name                 = "InboundDnsSubnet01"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.60.0.0/24"]

  delegation {
    name = "d0edff13-f652-48d5-bd13-15216b8d6abc"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_subnet" "this_in02" {
  name                 = "InboundDnsSubnet02"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.60.1.0/24"]

  delegation {
    name = "c41220de-0bfd-40c3-9ca5-570b5afb2b13"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_subnet" "this_out01" {
  name                 = "OutboundDnsSubnet01"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.60.2.0/24"]

  delegation {
    name = "fb73288e-5d69-496e-9bca-33f135bf3cf1"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_subnet" "this_out02" {
  name                 = "OutboundDnsSubnet02"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.60.3.0/24"]

  delegation {
    name = "c555964a-b5f3-49fc-82a5-d10985077c38"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_subnet" "this_out03" {
  name                 = "OutboundDnsSubnet03"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.60.4.0/24"]

  delegation {
    name = "abe3dd48-50eb-4509-8529-4aedea75f0ff"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_private_dns_resolver" "this" {
  name                = "pdnsr-example-pdnsrfwr-${random_string.this.result}"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.example_location
  virtual_network_id  = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "this_oe01" {
  name                    = "pdnsroe-exmple-hub-${random_string.this.result}-01"
  private_dns_resolver_id = azurerm_private_dns_resolver.this.id
  location                = var.example_location
  subnet_id               = azurerm_subnet.this_out01.id
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "this_oe02" {
  name                    = "pdnsroe-exmple-hub-${random_string.this.result}-02"
  private_dns_resolver_id = azurerm_private_dns_resolver.this.id
  location                = var.example_location
  subnet_id               = azurerm_subnet.this_out02.id
}

module "defaults" {
  source = "../.."

  # global
  module_location = var.example_location
  module_tags     = var.example_tags

  # azurerm_resource_group
  create_resource_group = var.create_resource_group
  resource_group_name   = "${var.resource_group_name}-${random_string.this.result}"

  # azurerm_private_dns_resolver_dns_forwarding_ruleset
  create_private_dns_resolver_dns_forwarding_ruleset = var.create_private_dns_resolver_dns_forwarding_ruleset
  private_dns_resolver_dns_forwarding_ruleset_name   = "${var.private_dns_resolver_dns_forwarding_ruleset_name}-${random_string.this.result}"
  private_dns_resolver_dns_forwarding_ruleset_outbound_endpoint_ids = [
    "${azurerm_private_dns_resolver_outbound_endpoint.this_oe01.id}",
    "${azurerm_private_dns_resolver_outbound_endpoint.this_oe02.id}"
  ]

  # azurerm_private_dns_resolver_forwarding_rule
  private_dns_resolver_forwarding_rules = var.private_dns_resolver_forwarding_rules

  # azurerm_private_dns_resolver_virtual_network_link
  private_dns_resolver_virtual_network_links = var.private_dns_resolver_virtual_network_links
  private_dns_resolver_virtual_network_links_virtual_networks = {
    "${azurerm_virtual_network.this.name}" = "${azurerm_virtual_network.this.id}"
  }
}
