variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}

variable "location" {
  default = "eastus"
}

variable "resource_tags" {
  type = map(string)
  default = {}
}

variable "vnet_name" {
  default = "vm-simple-vnet"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  default = "vm-simple-subnet"
}

variable "subnet_prefix" {
  default = "10.0.1.0/24"
}

variable "vm_name" {
  default = "vm-simple-001"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_ssh_key" {
  description = "Public SSH key contents"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to connect via SSH"
  default     = "0.0.0.0/0"
}
