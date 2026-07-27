terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Random suffix for unique resource names
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# Network Interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }

  tags = var.tags
}

# Public IP (Standard SKU for production)
resource "azurerm_public_ip" "vm_pip" {
  name                = "${var.vm_name}-pip-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

# Network Security Group with SSH rule
resource "azurerm_network_security_group" "vm_nsg" {
  name                = "${var.vm_name}-nsg-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

# Associate NSG to NIC
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}

# Managed Disk (OS Disk)
resource "azurerm_managed_disk" "os_disk" {
  name                 = "${var.vm_name}-osdisk-${random_string.suffix.result}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "FromImage"
  os_type              = "Linux"
  disk_size_gb         = var.os_disk_size_gb

  tags = var.tags
}

# Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  size                = var.vm_size

  os_disk {
    name                 = azurerm_managed_disk.os_disk.name
    managed_disk_id      = azurerm_managed_disk.os_disk.id
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  computer_name                   = var.vm_name
  admin_username                  = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}