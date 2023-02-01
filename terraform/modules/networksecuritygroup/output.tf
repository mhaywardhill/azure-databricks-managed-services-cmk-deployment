output "private_security_group_association_id" {
  value = azurerm_subnet_network_security_group_association.private.id
}

output "public_security_group_association_id" {
  value = azurerm_subnet_network_security_group_association.public.id
}