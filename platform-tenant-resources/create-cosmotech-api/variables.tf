variable "namespace" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "api_dns_name" {
  type = string
}

variable "tls_secret_name" {
  type = string
}

variable "redis_admin_password" {
  type = string
}

variable "acr_login_password" {
  type = string
}

variable "acr_login_server" {
  type = string
}

variable "acr_login_username" {
  type = string
}

variable "cosmos_key" {
  type = string
}

variable "cosmos_uri" {
  type = string
}

variable "adx_uri" {
  type = string
}

variable "adx_ingestion_uri" {
  type = string
}

variable "eventbus_uri" {
  type = string
}

variable "storage_account_key" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "network_adt_clientid" {
  type = string
}

variable "network_adt_password" {
  type = string
}

variable "cosmotech_api_ingress_enabled" {
  type    = bool
  default = true
}

variable "redis_port" {
  type    = number
  default = 6379
}

variable "helm_chart" {
  type    = string
  default = "cosmotech-api-chart"
}

variable "helm_repository" {
  type    = string
  default = "oci://ghcr.io/cosmo-tech"
}

variable "cosmotech_api_version" {
  type    = string
  default = "v3"
}

variable "helm_release_name" {
  type    = string
  default = "cosmotech-api"
}

variable "chart_package_version" {
  type = string
}

variable "argo_service_account" {
  type    = string
  default = ""
}

variable "argo_release_name" {
  type    = string
  default = "argo"
}

variable "is_multitenant" {
  type    = bool
  default = true
}