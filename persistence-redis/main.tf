resource "azurerm_managed_disk" "redis_master" {
  count                = var.pv_redis_provider == "azure" && var.pv_redis_master_disk_deploy ? 1 : 0
  name                 = var.pv_redis_disk_master_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_redis_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_redis_storage_gbi
}

data "azurerm_managed_disk" "disk_managed_redis_master" {
  count               = var.pv_redis_provider == "azure" && var.pv_redis_master_disk_source_existing ? 1 : 0
  name                = var.pv_redis_disk_master_name
  resource_group_name = var.kubernetes_mc_resource_group_name
}

resource "azurerm_managed_disk" "redis_replicas" {
  name                 = "${var.pv_redis_disk_replica_name}"
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_redis_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_redis_storage_gbi

  depends_on = [azurerm_managed_disk.redis_master]
}


resource "kubernetes_persistent_volume" "pv_redis_master" {
  count = var.pv_redis_provider == "azure" ? 1 : 0
  metadata {
    name = "pv-${var.pv_redis_disk_master_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_redis_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_redis_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = var.pv_redis_master_disk_source_existing ? data.azurerm_managed_disk.disk_managed_redis_master.0.id : azurerm_managed_disk.redis_master.0.id
        disk_name     = var.pv_redis_master_disk_source_existing ? data.azurerm_managed_disk.disk_managed_redis_master.0.name : azurerm_managed_disk.redis_master.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [
    azurerm_managed_disk.redis_master,
    data.azurerm_managed_disk.disk_managed_redis_master
  ]
}

resource "kubernetes_persistent_volume" "pv_redis_replicas" {
  metadata {
    name = "pv-${var.pv_redis_disk_replica_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_redis_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_redis_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = azurerm_managed_disk.redis_replicas.id
        disk_name     = azurerm_managed_disk.redis_replicas.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [azurerm_managed_disk.redis_replicas]
}



resource "kubernetes_persistent_volume" "pv_redis_master_lognhorn" {
  count = var.pv_redis_provider == "longhorn" ? 1 : 0
  metadata {
    name = "pv-${var.pv_redis_disk_master_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_redis_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_redis_storage_class_name
    persistent_volume_source {
      csi {
        driver        = "driver.longhorn.io"
        fs_type       = "ext4"
        volume_handle = var.pv_redis_disk_master_name
      }
    }
  }
}


resource "kubernetes_persistent_volume" "pv_redis_replica_lognhorn" {
  count = var.pv_redis_provider == "longhorn" ? 1 : 0
  metadata {
    name = "pv-${var.pv_redis_disk_replica_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_redis_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_redis_storage_class_name
    persistent_volume_source {
      csi {
        driver        = "driver.longhorn.io"
        fs_type       = "ext4"
        volume_handle = var.pv_redis_disk_replica_name
      }
    }
  }
}