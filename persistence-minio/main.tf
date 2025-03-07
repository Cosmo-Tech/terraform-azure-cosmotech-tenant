locals {
  disk_master_name = "disk-minio-tenant-${var.kubernetes_tenant_namespace}"
}

resource "azurerm_managed_disk" "minio_master" {
  count                = var.pv_minio_provider == "azure" && var.pv_minio_disk_deploy ? 1 : 0
  name                 = local.disk_master_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_minio_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_minio_storage_gbi
}

data "azurerm_managed_disk" "disk_managed_minio" {
  count               = var.pv_minio_provider == "azure" && var.pv_minio_disk_source_existing ? 1 : 0
  name                = local.disk_master_name
  resource_group_name = var.kubernetes_mc_resource_group_name
}

resource "kubernetes_persistent_volume" "pv_minio_master" {
  metadata {
    name = "pv-${local.disk_master_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_minio_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_minio_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = var.pv_minio_disk_source_existing ? data.azurerm_managed_disk.disk_managed_minio.0.id : azurerm_managed_disk.minio_master.0.id
        disk_name     = var.pv_minio_disk_source_existing ? data.azurerm_managed_disk.disk_managed_minio.0.name : azurerm_managed_disk.minio_master.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [
    azurerm_managed_disk.minio_master,
    data.azurerm_managed_disk.disk_managed_minio
  ]
}
