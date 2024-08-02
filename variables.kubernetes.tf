variable "kubernetes_version" {
  description = "Azure Kubernetes Service version"
  type        = string
  default     = "1.26.6"
}

variable "kubernetes_tenant_namespace" {
  description = "The kubernetes namespace to create"
  type        = string
}


variable "api_replicas" {
  type    = number
  default = 2
}

variable "api_version_path" {
  description = "The API version path"
  type        = string
  default     = "v3-1"
}

variable "list_apikey_allowed" {
  type = list(object({
    name           = string
    apiKey         = string
    associatedRole = string
    securedUris    = list(string)
  }))
  default = [{
    name           = ""
    apiKey         = ""
    associatedRole = ""
    securedUris    = []
  }]
}

variable "cosmotech_api_version" {
  type = string
}

variable "cosmotech_api_ingress_enabled" {
  type    = bool
  default = true
}

variable "cosmotech_api_persistence_size" {
  type    = string
  default = "8Gi"
}

variable "cosmotech_api_persistence_storage_class" {
  type    = string
  default = "azurefile-csi"
}

variable "monitoring_enabled" {
  type    = string
  default = "true"
}

variable "monitoring_namespace" {
  type    = string
  default = "cosmotech-monitoring"
}

variable "chart_package_version" {
  description = "The version of the Cosmo Tech API chart to deploy"
  type        = string
  default     = "3.1.2"
}

variable "argo_minio_persistence_size" {
  type    = string
  default = "16Gi"
}

variable "argo_minio_requests_memory" {
  type    = string
  default = "2Gi"
}

variable "archive_ttl" {
  type    = string
  default = "3d"
}

variable "redis_port" {
  type    = number
  default = 6379
}