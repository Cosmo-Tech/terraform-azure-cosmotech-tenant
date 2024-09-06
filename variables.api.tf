variable "create_platform_config" {
  type = bool
}

variable "cosmotech_api_chart_package_version" {
  type        = string
  description = "The version of the Cosmo Tech API chart to deploy"
  default     = "3.1.2"
}

variable "api_replicas" {
  type    = number
  default = 2
}

variable "api_dns_name" {
  type = string
}

variable "cosmotech_api_version_path" {
  description = "The API version path"
  type        = string
  default     = "v3-1"
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

variable "monitoring_enabled" {
  type    = string
  default = "true"
}