resource "random_id" "storage_account" {
  byte_length = 8
}

module "blob" {
  source = "../../modules/blob"

  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = "${var.environment}storage${random_id.storage_account.hex}"
  container_name       = "data"
  tags = {
    environment = var.environment
    region      = var.region
  }
}

output "vm_public_ip" {
  value = module.vm.public_ip_address
}
