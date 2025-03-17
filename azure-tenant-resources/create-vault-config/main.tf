resource "kubectl_manifest" "namespace_vault_auth" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/templates/vault-auth.yaml", {
    allowed_namespace = var.allowed_namespace
  })

}

resource "kubectl_manifest" "platform_vault_secret" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/templates/platform-vault-secret.yaml", {
    allowed_namespace = var.allowed_namespace,
    tenant_id         = var.tenant_id,
    cluster_name      = var.cluster_name,
    engine_secret      = var.engine_secret
  })

  depends_on = [
    kubectl_manifest.namespace_vault_auth
  ]
}
