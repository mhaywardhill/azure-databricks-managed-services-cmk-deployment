output "keyvault_id" {
    value = azurerm_key_vault.keyvault.id
}

output "key_vault_key_id" {
    value = azurerm_key_vault_key.key.id
}
