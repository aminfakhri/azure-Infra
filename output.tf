output "VM_hostname" {
 value = [azurerm_linux_virtual_machine.vminfo[*].name]


}

output "public_ip" {
 value = [azurerm_public_ip.pip[*].name]

}


output "virtual_network_name" {

value = azurerm_virtual_network.vnet.name

}

output "address_space" {

value = azurerm_virtual_network.vnet.address_space
}

output "subnet_name1" {

value  = azurerm_subnet.subnet1.name
}

output "subnet_name2" {
value = azurerm_subnet.subnet2.name

}

output "subnet1_address_space" {
value = azurerm_subnet.subnet1.address_prefixes

}

output "subnet2_address_space" {
value = azurerm_subnet.subnet2.address_prefixes

}
