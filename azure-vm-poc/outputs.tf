output "public_ip_address" {
  description = "Public IP address (if created)"
  value       = var.public_ip ? azurerm_public_ip.pip[0].ip_address : ""
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}
