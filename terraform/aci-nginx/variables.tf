variable "name_prefix" {
  type        = string
  description = "Prefix for resources"
  default     = "aci-nginx"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "East US"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default = {
    environment = "dev"
    project     = "aci-nginx"
  }
}
