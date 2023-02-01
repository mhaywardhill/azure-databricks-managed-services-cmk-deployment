provider "azurerm" {
  features {}
}

module "resource_group" {
  source                = "../../modules/resource_group"
  resource_group_prefix = "${var.project_name}-${var.environment_name}"
  location              = var.location
  project               = var.project_name
}

module "network" {
  source               	    = "../../modules/network"
  location             	    = var.location
  resource_group_name       = module.resource_group.vnet_resource_group_name
  address_space        	    = ["10.31.0.0/24"]
  address_private_subnet    = ["10.31.0.64/26"]
  address_public_subnet     = ["10.31.0.192/26"]
  project              	    = var.project_name
  environment_name     	    = var.environment_name
}

module "nsg" {
  source              = "../../modules/networksecuritygroup"
  location            = var.location
  resource_group      = module.resource_group.vnet_resource_group_name
  private_subnet_id   = module.network.private_subnet_id
  public_subnet_id    = module.network.public_subnet_id
  project             = var.project_name
  environment_name    = var.environment_name
  depends_on = [module.network]
}
