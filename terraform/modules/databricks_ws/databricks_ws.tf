resource "azurerm_databricks_workspace" "workspace" {
  name                        = "adb-cmk-test"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = "premium"
  
  managed_resource_group_name = var.managed_resource_group_name 

  custom_parameters {
    virtual_network_id                                      = var.databricks_vet_id
    private_subnet_name                                     = "private-subnet"
    public_subnet_name                                      = "public-subnet"
    public_subnet_network_security_group_association_id     = var.public_security_group_association_id
    private_subnet_network_security_group_association_id    = var.private_security_group_association_id
  }

  tags = {
    project = var.project
  }
}


