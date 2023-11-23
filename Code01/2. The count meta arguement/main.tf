locals {
  resource_group_name="my-grp"
  location="East US 2"
}
  resource "azurerm_resource_group" "my-grp" {
  name     = local.resource_group_name
  location = local.location  
}

resource "azurerm_storage_account" "appstore566565637" {
  count = 3 
  name                     = "${count.index}appstore566565637"
  resource_group_name      = "my-grp"
  location                 = "East US 2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [
    azurerm_resource_group.my-grp
  ]
}

