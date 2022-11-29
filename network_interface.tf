resource "azurerm_network_interface" "network_interface" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {

    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}