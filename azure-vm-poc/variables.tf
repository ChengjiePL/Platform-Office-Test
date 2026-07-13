variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
  default     = "pocvm"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_key" {
  description = "SSH public key for VM access (preferred). If empty, password will be used instead."
  type        = string
  default     = ""
}

variable "admin_password" {
  description = "Admin password if SSH key is not provided (not recommended)."
  type        = string
  default     = ""
  sensitive   = true
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB"
  type        = number
  default     = 30
}

variable "public_ip" {
  description = "Create and attach a public IP to the VM's NIC"
  type        = bool
  default     = true
}
