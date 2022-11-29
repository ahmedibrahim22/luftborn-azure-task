variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "prefix" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "allocation_method" {
  type = string
}

variable "env" {
  type = string
}

variable "subnet_name" {
  type = string
}


variable "vm_size" {
  type = string
}

variable "storage_image_reference" {
  type = object({
    publisher          = string
    offer              = string
    sku                = string
    version            = string
  })
}

variable "storage_os_disk" {
  type = object({
    name                = string
    caching             = string
    create_option       = string
    managed_disk_type   = string
  })
}

variable "os_profile" {
  type = object({
    computer_name        = string
    admin_username       = string
    admin_password       = string
  })
}

variable "os_profile_linux_config" {
  type = object({
    disable_password_authentication        = bool
  })
}


variable "key_vault_name" {
  type = string
}