resource_group_name     = ""
resource_group_location = ""
prefix                  = ""
public_ip_name          = ""
allocation_method       = ""
env                     = ""
subnet_name             = ""
vm_size                 = ""

storage_image_reference = {
    publisher          = ""
    offer              = ""
    sku                = ""
    version            = ""
}

storage_os_disk = {
    name                = ""
    caching             = ""
    create_option       = ""
    managed_disk_type   = ""
}

os_profile = {
    computer_name        = ""
    admin_username       = ""
    admin_password       = ""
}

os_profile_linux_config  = {
    disable_password_authentication  = true
}

