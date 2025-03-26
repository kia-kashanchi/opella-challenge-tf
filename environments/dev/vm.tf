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