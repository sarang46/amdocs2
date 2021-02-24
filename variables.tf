provider "azurerm" {

features {}
subscription_id = var.subscription_id
	client_id       = var.client_id
	client_secret   = var.client_secret
	tenant_id       = var.tenant_id
}
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  type        = list
  default     = ["sjft-rg12","sjtf-rg13"]
}
variable "location" {
  description = "The location/region where the core network will be created."
  default     = "westus"
}
variable "vnet_address_space" {
  default = "10.0.0.0/16"
}
variable "subnet_prefix" {
    type        = list
    default = ["10.0.1.0/24", "10.0.2.0/24"]

}