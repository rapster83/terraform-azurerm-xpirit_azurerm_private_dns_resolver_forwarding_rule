# global
example_location = "westeurope"
example_tags = {
  creator    = "Xpirit Germany GmbH"
  department = "Core Infrastructure"
}

# azurerm_resource_group
resource_group_name = "rg-example-hubvnet"

# azurerm_private_dns_resolver_dns_forwarding_ruleset
private_dns_resolver_dns_forwarding_ruleset_name = "pdnsrfwr-example-hub"

# azurerm_private_dns_resolver_forwarding_rule
private_dns_resolver_forwarding_rules = {
  f871bc26-1716-48a3-8d02-82f29d179f8d = {
    dns_forwarding_ruleset_id = null
    domain_name               = "example.local."
    enabled                   = true
    metadata                  = null
    target_dns_servers = {
      ec2c2a8e-d97c-46c2-881f-5c8a2016cd71 = {
        ip_address = "192.168.10.14"
        port       = 53
      },
      ab5a0952-8731-4e7c-89b4-09e2c629aee9 = {
        ip_address = "192.168.10.15"
        port       = 53
      }
    }
  },
  f1cd243b-67bb-4b4f-b690-b672caf6b060 = {
    dns_forwarding_ruleset_id = null
    domain_name               = "example-test.local."
    enabled                   = true
    metadata                  = null
    target_dns_servers = {
      d7df9b21-b666-494c-9793-1ade907f56d6 = {
        ip_address = "192.168.10.20"
        port       = 53
      },
      bc6c6311-76e9-4ecd-8788-d03823523828 = {
        ip_address = "192.168.10.21"
        port       = 53
      }
    }
  }
}

# azurerm_private_dns_resolver_virtual_network_link
private_dns_resolver_virtual_network_links = {
  e3a111d3-7818-4b2f-b88f-bf7421802210 = {
    dns_forwarding_ruleset_id = null
    virtual_network_id        = null
    virtual_network_name      = "vnet-example-pdnsrfwr-prod-01"
    metadata                  = null
  }
}
