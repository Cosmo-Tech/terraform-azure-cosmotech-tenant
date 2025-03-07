locals {
  disk_master_name = "disk-seaweedfs-tenant-${var.kubernetes_tenant_namespace}-master"
  disk_volume_name = "disk-seaweedfs-tenant-${var.kubernetes_tenant_namespace}-volume"
}

resource "azurerm_managed_disk" "seaweedfs_master" {
  count                = var.pv_seaweedfs_provider == "azure" && var.pv_seaweedfs_master_disk_deploy ? 1 : 0
  name                 = local.disk_master_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_seaweedfs_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_seaweedfs_storage_gbi
  os_type              = "Linux"
}

data "azurerm_managed_disk" "disk_managed_seaweedfs_master" {
  count               = var.pv_seaweedfs_provider == "azure" && var.pv_seaweedfs_master_disk_source_existing ? 1 : 0
  name                = local.disk_master_name
  resource_group_name = var.kubernetes_mc_resource_group_name
}

resource "azurerm_managed_disk" "seaweedfs_volume" {
  count                = var.pv_seaweedfs_provider == "azure" && var.pv_seaweedfs_volume_disk_deploy ? 1 : 0
  name                 = local.disk_volume_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_seaweedfs_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_seaweedfs_storage_gbi
  os_type              = "Linux"
}

data "azurerm_managed_disk" "disk_managed_seaweedfs_volume" {
  count               = var.pv_seaweedfs_provider == "azure" && var.pv_seaweedfs_volume_disk_source_existing ? 1 : 0
  name                = local.disk_master_name
  resource_group_name = var.kubernetes_mc_resource_group_name
}

resource "kubernetes_persistent_volume" "pv_seaweedfs_master" {
  metadata {
    name = "pv-${local.disk_master_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_seaweedfs_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_seaweedfs_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = var.pv_seaweedfs_master_disk_source_existing ? data.azurerm_managed_disk.disk_managed_seaweedfs_master.0.id : azurerm_managed_disk.seaweedfs_master.0.id
        disk_name     = var.pv_seaweedfs_master_disk_source_existing ? data.azurerm_managed_disk.disk_managed_seaweedfs_master.0.name : azurerm_managed_disk.seaweedfs_master.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [
    azurerm_managed_disk.seaweedfs_master,
    data.azurerm_managed_disk.disk_managed_seaweedfs_master
  ]
}

resource "kubernetes_persistent_volume" "pv_seaweedfs_volume" {
  metadata {
    name = "pv-${local.disk_volume_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_seaweedfs_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_seaweedfs_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = var.pv_seaweedfs_volume_disk_source_existing ? data.azurerm_managed_disk.disk_managed_seaweedfs_volume.0.id : azurerm_managed_disk.seaweedfs_volume.0.id
        disk_name     = var.pv_seaweedfs_volume_disk_source_existing ? data.azurerm_managed_disk.disk_managed_seaweedfs_volume.0.name : azurerm_managed_disk.seaweedfs_volume.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [
    azurerm_managed_disk.seaweedfs_volume,
    data.azurerm_managed_disk.disk_managed_seaweedfs_volume
  ]
}
