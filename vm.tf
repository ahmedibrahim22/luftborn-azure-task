resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference = var.storage_image_reference
  storage_os_disk         = var.storage_os_disk
  os_profile              = var.os_profile
  os_profile_linux_config =  var.os_profile_linux_config
  custom_data = filebase64("${path.module}/cloud-init.txt") 
  admin_ssh_key {
    username = "azureuser"
    public_key = tls_private_key.private_key_pair.public_key_openssh 
  }

  tags = {
    environment = "LUFTBORN-${var.env}-ELASTIC-IP"
  }
}