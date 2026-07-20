resource "azurerm_resource_group" "rg" {
  name     = "rg-${random_id.rg_hex.hex}"
  location = var.location
  tags     = var.resource_tags
}

resource "random_id" "rg_hex" {
  byte_length = 4
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
