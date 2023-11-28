locals {
  values_loki = {
    "MONITORING_NAMESPACE"    = var.monitoring_namespace
    "LOKI_RETENTION_PERIOD"   = var.loki_retention_period
    "LOKI_PERSISTENCE_MEMORY" = var.loki_persistence_memory
    "NAMESPACE"               = var.namespace
  }
}

resource "helm_release" "loki" {
  name       = var.loki_release_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  namespace  = var.monitoring_namespace
  values = [
    templatefile("${path.module}/values.yaml", local.values_loki)
  ]
}