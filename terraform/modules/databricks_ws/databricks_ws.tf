resource "azurerm_databricks_workspace" "workspace" {
  name                        = "adb-cmk-test"
  resource_group_name         = "${var.resource_prefix}-rg"
  location                    = var.location
  sku                         = "premium"
  
  managed_resource_group_name  = "${var.resource_prefix}-mrg"
  customer_managed_key_enabled = true

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

resource "azurerm_key_vault_access_policy" "databricks" {
  depends_on = [azurerm_databricks_workspace.workspace]

  key_vault_id = var.keyvault_id
  tenant_id    = azurerm_databricks_workspace.workspace.storage_account_identity.0.tenant_id
  object_id    = azurerm_databricks_workspace.workspace.storage_account_identity.0.principal_id

  key_permissions = [
    "Get",
    "UnwrapKey",
    "WrapKey",
  ]
}

resource "azurerm_databricks_workspace_customer_managed_key" "example" {
  depends_on = [azurerm_key_vault_access_policy.databricks]

  workspace_id     = azurerm_databricks_workspace.workspace.id
  key_vault_key_id = var.key_vault_key_id
}