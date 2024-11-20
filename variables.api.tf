variable "create_platform_config" {
  type = bool
}

variable "cosmotech_api_chart_package_version" {
  type        = string
  description = "The version of the Cosmo Tech API chart to deploy"
  validation {
    condition     = var.cosmotech_api_chart_package_version == var.cosmotech_api_version
    error_message = "The chart version must match with api version"
  }
}

variable "cosmotech_api_version_path" {
  description = "The API version path"
  type        = string
  validation {
    condition     = "v${split(".", var.cosmotech_api_version)[0]}" == var.cosmotech_api_version_path
    error_message = "The version of cosmotech api do not match with version path"
  }
}

variable "cosmotech_api_version" {
  type = string
}

variable "servlet_context_path" {
  type        = string
  description = "ex: /cosmotech-api"
}
