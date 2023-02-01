resource "azurerm_resource_group" "vnet" {
  name     = "${var.resource_group_prefix}-vnet-rg"
  location = var.location

  tags = {
    project = var.project
  }
}


resource "azurerm_resource_group" "adb" {
  name     = "${var.resource_group_prefix}-rg"
  location = var.location

  tags = {
    project = var.project
  }
}