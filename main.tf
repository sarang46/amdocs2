# Azure Provider source and version being used
 terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}
resource "azurerm_resource_group" "rg" {
  count    = 2
  name     = element(var.resource_group_name, count.index)
  location = var.location
}
resource "azurerm_virtual_network" "vnet" {
  name                = "sarangvm-vnet"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.rg[count.index]
}
resource "azurerm_subnet" "subnet" {
  count                = 2
  name                 = "sarangvmsubnet-${count.index}"
  resource_group_name  = element(var.resource_group_name, count.index)
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = element(var.subnet_prefix, count.index)
}