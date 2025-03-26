variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "vnetwork_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual Network address space to be used"
  type        = list(string)
}

variable "subnets" {
  description = "For each subnet, create an object that contains fields"
  type = map(object({
    address_prefix = string
  }))
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
