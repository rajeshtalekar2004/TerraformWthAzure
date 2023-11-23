/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1. azurerm_resource_group - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
}

provider "azurerm" {
  # az login --use-device-code
  subscription_id = ""
  tenant_id = ""
  client_id = ""
  client_secret = ""  
  features {}
}

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "East US 2"
}