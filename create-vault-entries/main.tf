locals {
  storage_key = var.storage_account_key == "" ? data.kubernetes_secret.storage_secret.data.password : var.storage_account_key
}

resource "kubernetes_config_map" "vault_config_script" {
  count = var.vault_sops_deploy ? 1 : 0
  metadata {
    name      = "vault-config-script"
    namespace = var.vault_namespace
  }

  data = {
    "configure-vault.sh" = templatefile("${path.module}/configure-vault.sh", {
      allowed_namespace                = var.kubernetes_tenant_namespace
      vault_namespace                  = var.vault_namespace
      engine_secret                    = var.engine_secret
      engine_version                   = var.engine_version
    })
  }
}

data "kubernetes_secret" "vault_secret" {
  metadata {
    name      = "vault-token-secret"
    namespace = "vault"
  }
}

data "kubernetes_secret" "storage_secret" {
  metadata {
    name      = "storage-account-secret"
    namespace = var.kubernetes_tenant_namespace
  }
}

resource "kubernetes_job" "vault_config" {
  count = var.vault_sops_deploy ? 1 : 0
  metadata {
    name      = "vault-config-job"
    namespace = var.vault_namespace
  }

  spec {
    template {
      metadata {
        name = "vault-config"
      }

      spec {
        restart_policy       = "Never"
        service_account_name = "vault-unseal"
        container {
          name    = "vault-config"
          image   = "bitnami/kubectl:latest"
          command = ["/bin/bash", "-c", "bash /scripts/configure-vault.sh"]

          env {
            name  = "VAULT_ADDR"
            value = var.vault_addr
          }

          env {
            name  = "VAULT_NAMESPACE"
            value = var.vault_namespace
          }

          volume_mount {
            name       = "config"
            mount_path = "/scripts"
          }
        }

        volume {
          name = "config"
          config_map {
            name = kubernetes_config_map.vault_config_script.0.metadata[0].name
          }
        }
      }
    }

    backoff_limit = 4
  }

  wait_for_completion = true
  timeouts {
    create = "5m"
    update = "5m"
  }

  depends_on = [
    kubernetes_config_map.vault_config_script
  ]
}

resource "kubernetes_pod" "create-vault-entries" {
  metadata {
    name      = "create-vault-entries"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    toleration {
      key      = "vendor"
      operator = "Equal"
      effect   = "NoSchedule"
      value    = "cosmotech"
    }
    node_selector = {
      "cosmotech.com/tier" : "services"
    }
    init_container {
      name              = "tenant-enable-pod"
      image_pull_policy = "Always"
      image             = "ghcr.io/cosmo-tech/backend-tf-state-to-vault:${var.container_tag}"
      command           = ["/bin/bash", "-c", "python main.py tenant enable --engine ${var.engine_version} --name ${var.organization_name}"]
      env {
        name  = "VAULT_ADDR"
        value = var.vault_addr
      }
      env {
        name  = "VAULT_TOKEN"
        value = var.vault_token == "" ? data.kubernetes_secret.vault_secret.data.ROOT_TOKEN : var.vault_token
      }
      env {
        name  = "TENANT_ID"
        value = var.tenant_id
      }
      env {
        name  = "ORGANIZATION_NAME"
        value = var.organization_name
      }
      env {
        name  = "STORAGE_ACCOUNT_NAME"
        value = var.storage_account_name
      }
      env {
        name  = "STORAGE_ACCOUNT_KEY"
        value = local.storage_key
      }
      env {
        name  = "STORAGE_CONTAINER"
        value = var.storage_container
      }
      env {
        name  = "TFSTATE_BLOB_NAME"
        value = var.tf_blob_name_tenant
      }
      env {
        name  = "PLATFORM_ID"
        value = var.platform_id
      }
    }

    container {
      name              = "create-vault-entries-pod"
      image             = "ghcr.io/cosmo-tech/backend-tf-state-to-vault:${var.container_tag}"
      image_pull_policy = "Always"
      command           = ["/bin/bash", "-c", "python main.py config write --resource all --use-azure --engine ${var.engine_version} --platform-id ${var.platform_id}"]
      env {
        name  = "VAULT_ADDR"
        value = var.vault_addr
      }
      env {
        name  = "VAULT_TOKEN"
        value = var.vault_token == "" ? data.kubernetes_secret.vault_secret.data.ROOT_TOKEN : var.vault_token
      }
      env {
        name  = "TENANT_ID"
        value = var.tenant_id
      }
      env {
        name  = "ORGANIZATION_NAME"
        value = var.organization_name
      }
      env {
        name  = "STORAGE_ACCOUNT_NAME"
        value = var.storage_account_name
      }
      env {
        name  = "STORAGE_ACCOUNT_KEY"
        value = local.storage_key
      }
      env {
        name  = "STORAGE_CONTAINER"
        value = var.storage_container
      }
      env {
        name  = "TFSTATE_BLOB_NAME"
        value = var.tf_blob_name_tenant
      }
      env {
        name  = "PLATFORM_ID"
        value = var.platform_id
      }
    }
  }

  depends_on = [kubernetes_job.vault_config]
}
