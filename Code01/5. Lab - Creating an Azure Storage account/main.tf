/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1.azurerm_storage_account - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

*/

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

provider "azurerm" {
  # az login --use-device-code
  features {}  
}

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "East US 2"
}

resource "azurerm_storage_account" "appstore566565637" {
  name                     = "appstore566565637"
  resource_group_name      = "app-grp"
  location                 = "East US 2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}

