output "private_subnet_id" {
  value = azurerm_subnet.private-subnet.id
}

output "public_subnet_id" {
  value = azurerm_subnet.public-subnet.id
}

output "databricks_vet_id" {
  value = azurerm_virtual_network.main.id
}

