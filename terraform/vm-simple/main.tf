module "common" {
  source = "./modules/common"

  location      = var.location
  resource_tags = var.resource_tags
}

module "network" {
  source = "./modules/network"

  vnet_name       = var.vnet_name
  address_space   = var.address_space
  subnet_name     = var.subnet_name
  subnet_prefix   = var.subnet_prefix
  resource_group  = module.common.resource_group_name
}

module "compute" {
  source = "./modules/compute"

  vm_name            = var.vm_name
  admin_username     = var.admin_username
  admin_ssh_key      = var.admin_ssh_key
  vm_size            = var.vm_size
  resource_group     = module.common.resource_group_name
  subnet_id          = module.network.subnet_id
  allowed_ssh_cidr   = var.allowed_ssh_cidr
}
