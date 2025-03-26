terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.15.0" # Adjust to a version compatible with your setup
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }
  required_version = ">=1.11.2"
}
