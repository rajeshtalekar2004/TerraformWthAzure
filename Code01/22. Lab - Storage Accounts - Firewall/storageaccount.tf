resource "azurerm_storage_account" "vmstore4577688raj" {
  name                     = "vmstore4577688raj"
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"  

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["2.51.173.209"]
    virtual_network_subnet_ids = [azurerm_subnet.subnetA.id]
  }

    depends_on = [
    azurerm_resource_group.appgrp,
    azurerm_subnet.subnetA
   ]
}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = "vmstore4577688raj"
  container_access_type = "blob"
  depends_on=[
    azurerm_storage_account.vmstore4577688raj
    ]
}

resource "azurerm_storage_blob" "IISConfig" {
  name                   = "IIS_Config.ps1"
  storage_account_name   = "vmstore4577688raj"
  storage_container_name = "data"
  type                   = "Block"
  source                 = "IIS_Config.ps1"
   depends_on=[azurerm_storage_container.data]
}
