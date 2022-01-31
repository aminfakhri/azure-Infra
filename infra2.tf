resource "azurerm_linux_virtual_machine" "vminfo" {
  name                = var.linux_name["linux"]
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.linux_name["size"]
  admin_username      = var.username
 
  
  

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]


admin_ssh_key {
    username   = var.username
    public_key = file(var.ssh_public_key)
  }

os_disk {
    caching              = var.os_disk["cache"]
    storage_account_type = var.os_disk["storage"]
    disk_size_gb         = var.os_disk["disk_size_gb"]

  }

source_image_reference {
    publisher = var.source_image["publisher"]
    offer     = var.source_image["offer"]
    sku       = var.source_image["sku"]
    version   = var.source_image["version"]
  }
}


resource "azurerm_subnet" "subnet3" {
  name                 = var.subnet3
  resource_group_name  = azurerm_resource_group.rg2.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet3-space
}


resource "azurerm_network_interface" "nic" {
  name     = var.linux_name["linux"]
  location = var.location
  resource_group_name = var.rg_name
  tags                 = local.common_tags
 


  ip_configuration {
    name  = "testconfiguration1"
    subnet_id = azurerm_subnet.subnet3.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_public_ip" "pip" {
  name                = var.linux_name["linux"]
  resource_group_name = azurerm_resource_group.rg2.name
  location            = azurerm_resource_group.rg2.location
  allocation_method   = "Static"
  tags                = local.common_tags

  
}
