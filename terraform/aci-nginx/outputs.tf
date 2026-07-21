output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "container_group_name" {
  description = "The name of the container group"
  value       = azurerm_container_group.aci.name
}

output "container_ipv4_address" {
  description = "The public IP address of the container group"
  value       = azurerm_container_group.aci.ip_address
}

output "container_fqdn" {
  description = "The FQDN of the container group"
  value       = azurerm_container_group.aci.fqdn
}
