variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "The replication type for the account"
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "The name of the blob container"
  type        = string
}

variable "container_access_type" {
  description = "The access type for the container"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
