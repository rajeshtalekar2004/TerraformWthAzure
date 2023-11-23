# terraform plan -out main.tfplan -var="number_of_subnets=3"
resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location  
}

