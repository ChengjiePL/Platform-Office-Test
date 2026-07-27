output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  description = "Name of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm_size" {
  description = "Size of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.size
}

output "nic_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.vm_nic.id
}

output "public_ip_id" {
  description = "ID of the public IP address"
  value       = azurerm_public_ip.vm_pip.id
}

output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.vm_pip.ip_address
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = azurerm_network_security_group.vm_nsg.id
}

output "os_disk_id" {
  description = "ID of the OS managed disk"
  value       = azurerm_managed_disk.os_disk.id
}

output "identity_principal_id" {
  description = "Principal ID of the system-assigned managed identity"
  value       = azurerm_linux_virtual_machine.vm.identity[0].principal_id
}

output "identity_tenant_id" {
  description = "Tenant ID of the system-assigned managed identity"
  value       = azurerm_linux_virtual_machine.vm.identity[0].tenant_id
}