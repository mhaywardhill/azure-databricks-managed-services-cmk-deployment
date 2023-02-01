output "adb_ws_storage_account_identity" {
    value = azurerm_databricks_workspace.workspace.storage_account_identity
}


output "adb_ws_managed_disk_identity" {
     value = azurerm_databricks_workspace.workspace.managed_disk_identity
}