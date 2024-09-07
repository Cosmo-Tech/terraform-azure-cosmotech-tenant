variable "create_platform_config" {
  type = bool
}

variable "cosmotech_api_chart_package_version" {
  type        = string
  description = "The version of the Cosmo Tech API chart to deploy"
  default     = "3.1.2"
}

variable "cosmotech_api_version_path" {
  description = "The API version path"
  type        = string
  default     = "v3-1"
}

variable "cosmotech_api_version" {
  type = string
}
