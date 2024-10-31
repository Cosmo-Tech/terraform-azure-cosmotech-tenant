terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
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

resource "kubectl_manifest" "create-vault-entries" {
  yaml_body = <<YAML
apiVersion: v1
kind: Pod
metadata:
  name: create-vault-entries
  namespace: ${var.kubernetes_tenant_namespace}
spec:
  initContainers:
  - name: tenant-enable-pod
    imagePullPolicy: Always
    image: ghcr.io/cosmo-tech/backend-tf-state-to-vault:${var.container_tag}
    command: ["/bin/bash", "-c", "python main.py tenant enable --name ${var.platform_id}"]
    env:
    - name: VAULT_ADDR
      value: ${var.vault_addr}
    - name: VAULT_TOKEN
      value: ${var.vault_token == "" ? data.kubernetes_secret.vault_secret.data.ROOT_TOKEN : var.vault_token}
    - name: TENANT_ID
      value: ${var.tenant_id}
    - name: ORGANIZATION_NAME
      value: ${var.organization_name}
    - name: STORAGE_ACCOUNT_NAME
      value: ${var.storage_account_name}
    - name: STORAGE_ACCOUNT_KEY
      value: ${var.storage_account_key}
    - name: STORAGE_CONTAINER
      value: ${var.storage_container}
    - name: TFSTATE_BLOB_NAME
      value: ${var.tf_blob_name_tenant}
    - name: PLATFORM_ID
      value: ${var.platform_id}
  nodeSelector:
    "cosmotech.com/tier": "services"
  tolerations:
  - key: "vendor"
    operator: "Equal"
    value: "cosmotech"
    effect: "NoSchedule"
  restartPolicy: Never

  containers:
  - name: create-vault-entries-pod
    imagePullPolicy: Always
    image: ghcr.io/cosmo-tech/backend-tf-state-to-vault:${var.container_tag}
    command: ["/bin/bash", "-c", "python main.py config write --use-azure --platform-id ${var.platform_id}"]
    env:
    - name: VAULT_ADDR
      value: ${var.vault_addr}
    - name: VAULT_TOKEN
      value: ${var.vault_token == "" ? data.kubernetes_secret.vault_secret.data.ROOT_TOKEN : var.vault_token}
    - name: TENANT_ID
      value: ${var.tenant_id}
    - name: ORGANIZATION_NAME
      value: ${var.organization_name}
    - name: STORAGE_ACCOUNT_NAME
      value: ${var.storage_account_name}
    - name: STORAGE_ACCOUNT_KEY
      value: ${var.storage_account_key}
    - name: STORAGE_CONTAINER
      value: ${var.storage_container}
    - name: TFSTATE_BLOB_NAME
      value: ${var.tf_blob_name_tenant}
    - name: PLATFORM_ID
      value: ${var.platform_id}
  nodeSelector:
    "cosmotech.com/tier": "services"
  tolerations:
  - key: "vendor"
    operator: "Equal"
    value: "cosmotech"
    effect: "NoSchedule"
  restartPolicy: Never
YAML

  depends_on = [kubernetes_job.vault_config]
}
