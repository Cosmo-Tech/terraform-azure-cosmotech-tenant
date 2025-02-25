locals {
  disk_master_name = "disk-redis-master-tenant-${var.kubernetes_tenant_namespace}"
  disk_replica_name = "disk-redis-replica-tenant-${var.kubernetes_tenant_namespace}"
}

resource "azurerm_managed_disk" "redis_master" {
  count                = var.pv_redis_provider == "azure" ? 1 : 0
  name                 = local.disk_master_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_redis_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_redis_storage_gbi
}

resource "azurerm_managed_disk" "redis_replicas" {
  count                = var.pv_redis_replicas
  name                 = "${local.disk_replica_name}-${count.index}"
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_redis_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_redis_storage_gbi

  depends_on = [ azurerm_managed_disk.redis_master ]
}

resource "kubernetes_persistent_volume" "pv_redis_master" {
  metadata {
    name = "pv-${local.disk_master_name}"
  }
  spec {
    capacity = {
      storage = var.pv_redis_storage_gbi
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_redis_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = azurerm_managed_disk.redis_master.0.id
        disk_name     = azurerm_managed_disk.redis_master.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [ azurerm_managed_disk.redis_master ]
}

resource "kubernetes_persistent_volume" "pv_redis_replicas" {
  count = var.pv_redis_replicas
  metadata {
    name = "pv-${local.disk_replica_name}-${count.index}"
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
        data_disk_uri = azurerm_managed_disk.redis_replicas[count.index].id
        disk_name     = azurerm_managed_disk.redis_replicas[count.index].name
        kind          = "Managed"
      }
    }
  }

  depends_on = [ azurerm_managed_disk.redis_replicas ]
}

