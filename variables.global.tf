variable "monitoring_namespace" {
  type    = string
  default = "cosmotech-monitoring"
}

variable "kubernetes_tenant_namespace" {
  description = "The kubernetes namespace to create"
  type        = string
}