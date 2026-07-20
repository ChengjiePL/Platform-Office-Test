output "vm_public_ip" {
  value = module.compute.public_ip
}

output "resource_group" {
  value = module.common.resource_group_name
}
