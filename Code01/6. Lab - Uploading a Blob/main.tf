/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1.azurerm_storage_container - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container

2.azurerm_storage_blob - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob

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

resource "azurerm_resource_group" "app-grp" {
  name     = "app-grp"
  location = "East US 2"
}

resource "azurerm_storage_account" "appstore566565637" {
  name                     = "appstore566565637"
  resource_group_name      = "app-grp"
  location                 = "East US 2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [ azurerm_resource_group.app-grp ]
}

resource "azurerm_storage_container" "data01" {
  name                  = "data01"
  storage_account_name  = "appstore566565637"
  container_access_type = "blob"
  depends_on = [ azurerm_storage_account.appstore566565637 ]
}

resource "azurerm_storage_blob" "maintf" {
  name                   = "main.tf"
  storage_account_name   = "appstore566565637"
  storage_container_name = "data01"
  type                   = "Block"
  source                 = "main.tf"
  depends_on = [ azurerm_storage_container.data01 ]
}