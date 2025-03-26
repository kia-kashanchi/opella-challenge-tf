variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to connect the VM"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key for authentication"
  type        = string
}

variable "image_publisher" {
  description = "The publisher of the OS image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "The offer of the OS image"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "The SKU of the OS image"
  type        = string
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "The version of the OS image"
  type        = string
  default     = "latest"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
