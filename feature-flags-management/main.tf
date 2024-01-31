provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "feature_flags_resource_group" {
  name     = "feature-flags"
  location = "uksouth"
}

resource "azurerm_key_vault" "feature_flags_key_vault" {
  location                    = azurerm_resource_group.feature_flags_resource_group.location
  resource_group_name         = azurerm_resource_group.feature_flags_resource_group.name
  name                        = "feature-flags-key-vault"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "Create"
    ]

    secret_permissions = [
      "Get", "Set"
    ]

    storage_permissions = [
      "Get", "Set"
    ]
  }
}


# amazing-project.blob-storage.anonymous-access-enabled
resource "azurerm_key_vault_secret" "blob_storage_anonymous_access_enabled" {
  key_vault_id = azurerm_key_vault.feature_flags_key_vault.id
  name         = "amazing-project-blob-storage-anonymous-access-enabled"
  value        = "true"
}
