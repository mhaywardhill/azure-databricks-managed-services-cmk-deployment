provider "azurerm" {
  features {}
}

module "resource_group" {
  source                = "../../modules/resource_group"
  resource_group_prefix = "${var.project_name}-${var.environment_name}"
  location              = var.location
  project               = var.project_name
}

