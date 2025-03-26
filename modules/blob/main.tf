resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  tags = var.tags
}

resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = var.container_access_type
}