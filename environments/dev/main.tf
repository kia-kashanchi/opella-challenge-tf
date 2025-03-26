provider "azurerm" {
  features {}
  # Credentials are sourced from GitHub Secrets as environment variables:
  # ARM_SUBSCRIPTION_ID, ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID
}

resource "random_id" "storage_account" {
  byte_length = 8
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

module "vm" {
  source = "../../modules/vm"

  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.vnet.subnet_ids["subnet1"]
  vm_name             = "${var.environment}-vm"
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key
  tags = {
    environment = var.environment
    region      = var.region
  }
}

module "blob" {
  source = "../../modules/blob"

  resource_group_name    = var.resource_group_name
  location               = var.location
  storage_account_name   = "${var.environment}storage${random_id.storage_account.hex}"
  container_name         = "data"
  tags = {
    environment = var.environment
    region      = var.region
  }
}

output "vm_public_ip" {
  value = module.vm.public_ip_address
}