provider "azurerm" {
  features {}
}

data "azurerm_key_vault" "example" {
  resource_group_name = "feature-flags"
  name                = "feature-flags-key-vault"
}

data "azurerm_key_vault_secret" "anonymous_access_enabled_feature_flag" {
  key_vault_id = data.azurerm_key_vault.example.id
  name         = "${var.project_name}-blob-storage-anonymous-access-enabled"
}

# Feature-Flags
locals {
  # Feature flag controled by consumers
  create_resource_group = var.resource_group_name == null ? true : false

  # Feature flag controled by module owner
  encrypt_storage = true

  # Feature flag controled by organization
  anonymous_access_enabled = data.azurerm_key_vault_secret.anonymous_access_enabled_feature_flag.value == "true" ? true : false
}

resource "azurerm_resource_group" "example" {
  count    = local.create_resource_group ? 1 : 0
  name     = "${var.storage_account_name}-resource-group"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = local.create_resource_group ? azurerm_resource_group.example[0].name : var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_encryption_scope" "example" {
  count              = local.encrypt_storage ? 1 : 0
  storage_account_id = azurerm_storage_account.example.id
  name               = "microsoftmanaged"
  source             = "Microsoft.Storage"
}

resource "azurerm_storage_container" "example" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = local.anonymous_access_enabled ? "blob" : "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = var.blob_storage_name
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Append"
}
