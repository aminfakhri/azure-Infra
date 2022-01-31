resource "azurerm_resource_group" "rg2" {
  name     = var.rg_name
  location = var.location
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = var.vnet_space

}
resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = azurerm_resource_group.rg2.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1-space

}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2
  resource_group_name  = azurerm_resource_group.rg2.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet2-space

}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.security-group1
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name
  

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_security_group" "nsg2" {
  name                = var.security-group2
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}
resource "azurerm_subnet_network_security_group_association" "subnet_association2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}
