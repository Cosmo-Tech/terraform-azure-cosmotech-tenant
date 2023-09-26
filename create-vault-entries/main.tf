terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

resource "kubectl_manifest" "create-vault-entries" {
  yaml_body = <<YAML
apiVersion: v1
kind: Pod
metadata:
  name: create-vault-entries-pod
  namespace: ${var.namespace}
spec:
  containers:
  - name: create-vault-entries-pod
    image: ghcr.io/cosmo-tech/backend-tf-state-to-vault:latest
    env:
    - name: VAULT_ADDR
      value: ${var.vault_addr}
    - name: VAULT_TOKEN
      value: ${var.vault_token}
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
      value: ${var.tfstate_blob_name}
    - name: PLATFORM_NAME
      value: ${var.platform_name}
  nodeSelector:
    "cosmotech.com/tier": "services"
  tolerations:
  - key: "vendor"
    operator: "Equal"
    value: "cosmotech"
    effect: "NoSchedule"
  restartPolicy: Never
YAML
}