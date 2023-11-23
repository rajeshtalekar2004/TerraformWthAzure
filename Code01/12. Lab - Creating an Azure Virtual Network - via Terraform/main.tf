/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1.azurerm_virtual_network - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

*/

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {
  features {}  
}


resource "azurerm_resource_group" "my-grp" {
  name     = "my-grp"
  location = "East US 2"
}

resource "azurerm_virtual_network" "appnetwork" {
  name                = "app-network"
  location            = "East US 2"
  resource_group_name = "my-grp"
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnetA"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "subnetB"
    address_prefix = "10.0.1.0/24"    
  }

  depends_on = [ azurerm_resource_group.my-grp ]
}

