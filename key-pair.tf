data "azurerm_client_config" "current" {}

resource "tls_private_key" "private_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_key_vault" "key_vault" {
  name                       = var.key_vault_name
  location                   = azurerm_resource_group.resource_group.location
  resource_group_name        = azurerm_resource_group.resource_group.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}

resource "azurerm_key_vault_secret" "private_key" {
  name         = "${var.env}-PRIVATE-KEY"
  value        = tls_private_key.private_key_pair.private_key_pem
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "public_key" {
  name         = "${var.env}-PUBLIC-KEY"
  value        = tls_private_key.private_key_pair.public_key_openssh
  key_vault_id = azurerm_key_vault.key_vault.id
}