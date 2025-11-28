resource "azurerm_resource_group" "Rg1" {
  name = var.resource_group_name
  location = var.resource_group_loction
    
}
resource "azurerm_virtual_network" "vnet1" {
  name = var.virtual_network_name
  location = azurerm_resource_group.Rg1.location
  address_space = ["192.0.0.0/16"]
  resource_group_name = azurerm_resource_group.Rg1.name
  
}
resource "azurerm_storage_account" "storage" {
  name = "westbang${random_string.myrandom.id}"
  location =var.resource_group_loction
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  resource_group_name = azurerm_resource_group.Rg1.name
  account_tier = "Standard"

  
}