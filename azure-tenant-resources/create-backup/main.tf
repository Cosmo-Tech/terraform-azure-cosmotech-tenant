resource "azurerm_data_protection_backup_vault" "vault" {
  name                = "cosmo-backup-vault"
  resource_group_name = var.tenant_resource_group
  location            = var.location
  datastore_type      = "VaultStore"
  redundancy          = "LocallyRedundant"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_data_protection_backup_policy_disk" "backup_policy" {
  name     = var.backup_policy_name
  vault_id = azurerm_data_protection_backup_vault.vault.id

  backup_repeating_time_intervals = var.backup_repeating_time_intervals
  default_retention_duration      = "P7D"

  retention_rule {
    name     = "Daily"
    duration = "P7D"
    priority = 25
    criteria {
      absolute_criteria = "FirstOfDay"
    }
  }

  retention_rule {
    name     = "Weekly"
    duration = "P7D"
    priority = 20
    criteria {
      absolute_criteria = "FirstOfWeek"
    }
  }
}

resource "azurerm_role_assignment" "snapshot_role" {
  scope                = var.tenant_resource_group_id
  role_definition_name = "Disk Snapshot Contributor"
  principal_id         = azurerm_data_protection_backup_vault.vault.identity.0.principal_id
}

resource "azurerm_role_assignment" "backup_reader_role" {
  scope                = var.managed_disk_id
  role_definition_name = "Disk Backup Reader"
  principal_id         = azurerm_data_protection_backup_vault.vault.identity.0.principal_id
}

resource "azurerm_data_protection_backup_instance_disk" "instance" {
  name                         = var.backup_instance_name
  location                     = var.location
  vault_id                     = azurerm_data_protection_backup_vault.vault.id
  disk_id                      = var.managed_disk_id
  snapshot_resource_group_name = var.tenant_resource_group
  backup_policy_id             = azurerm_data_protection_backup_policy_disk.backup_policy.id
}