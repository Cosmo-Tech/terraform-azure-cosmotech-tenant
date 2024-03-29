locals {
  values_redis = {
    "REDIS_PASSWORD"          = var.redis_admin_password
    "VERSION_REDIS_COSMOTECH" = var.version_redis_cosmotech
    "REDIS_MASTER_NAME_PVC"   = local.redis_pvc_name
    "REDIS_DISK_SIZE"         = var.redis_pv_capacity
  }
}

locals {
  instance_name  = "${var.helm_release_name}-${var.namespace}"
  redis_pv_name  = "${var.redis_pv_name}-${var.namespace}"
  redis_pvc_name = "${var.redis_pvc_name}-${var.namespace}"
}

resource "kubernetes_persistent_volume_v1" "redis-pv" {
  metadata {
    name = local.redis_pv_name
    labels = {
      "cosmotech.com/service" = "redis"
    }
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    claim_ref {
      name      = local.redis_pvc_name
      namespace = var.namespace
    }
    capacity = {
      storage = var.redis_pv_capacity
    }
    persistent_volume_source {

      azure_disk {
        caching_mode  = "ReadWrite"
        data_disk_uri = var.managed_disk_id
        disk_name     = var.redis_disk_name
        kind          = "Managed"
      }
    }
    persistent_volume_reclaim_policy = "Retain"
  }
}

resource "kubernetes_persistent_volume_claim_v1" "redis-pvc" {
  metadata {
    name      = local.redis_pvc_name
    namespace = var.namespace
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.redis_pv_capacity
      }
    }
    volume_name = local.redis_pv_name
  }
}

resource "helm_release" "cosmotechredis" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart_name
  version    = var.redis_version
  namespace  = var.namespace

  reuse_values = true
  wait         = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_redis)
  ]

  depends_on = [
    kubernetes_persistent_volume_v1.redis-pv, kubernetes_persistent_volume_claim_v1.redis-pvc
  ]
}