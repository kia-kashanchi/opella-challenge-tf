terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.24.0" # Adjust to a version compatible with your setup
    }
  }
  required_version = ">=1.11.2"
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnetwork_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.key
      address_prefixes = [subnet.value.address_prefix]
    }
  }

  tags = var.tags
}
