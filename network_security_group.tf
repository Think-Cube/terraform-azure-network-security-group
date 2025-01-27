resource "azurerm_network_security_group" "main" {
  name                = "${var.environment}-${var.nsg_name}-${var.region}-nsg"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  tags                = var.default_tags
  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                                       = lookup(security_rule.value, "name", null)
      priority                                   = lookup(security_rule.value, "priority", null)
      direction                                  = lookup(security_rule.value, "direction", null)
      access                                     = lookup(security_rule.value, "access", null)
      protocol                                   = lookup(security_rule.value, "protocol", null)
      source_port_range                          = lookup(security_rule.value, "source_port_range", null)
      source_port_ranges                         = lookup(security_rule.value, "source_port_ranges", null)
      destination_port_range                     = lookup(security_rule.value, "destination_port_range", null)
      destination_port_ranges                    = lookup(security_rule.value, "destination_port_ranges", null)
      source_address_prefix                      = lookup(security_rule.value, "source_address_prefix", null)
      source_address_prefixes                    = lookup(security_rule.value, "source_address_prefixes", null)
      destination_address_prefix                 = lookup(security_rule.value, "destination_address_prefix", null)
      destination_address_prefixes               = lookup(security_rule.value, "destination_address_prefixes", null)
      source_application_security_group_ids      = lookup(security_rule.value, "source_application_security_group_ids ", null)
      destination_application_security_group_ids = lookup(security_rule.value, "destination_application_security_group_ids ", null)
    }
  }
}
