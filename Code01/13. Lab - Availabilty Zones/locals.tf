locals {
  resource_group_name = "my-grp"
  location            = "East US 2"
  virtual_network = {
    name          = "app-network"
    address_space = "10.0.0.0/16"
  }

}
