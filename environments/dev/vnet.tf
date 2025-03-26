provider "azurerm" {
  features {}
  # Credentials are sourced from GitHub Secrets as environment variables:
  # ARM_SUBSCRIPTION_ID, ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID
}

module "vnet" {
  source = "../../modules/vnet"

  resource_group_name = var.resource_group_name
  location            = var.location
  vnetwork_name       = "${var.environment}-vnet"
  vnet_address_space  = ["10.0.0.0/16"]
  subnets             = {
    subnet1 = {
      address_prefix = "10.0.1.0/24"
    }
    subnet2 = {
      address_prefix = "10.0.2.0/24"
    }
  }
  tags = {
    environment = var.environment
    region      = var.region
  }
}