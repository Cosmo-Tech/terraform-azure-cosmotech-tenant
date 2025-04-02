variable "api_chart_package_version" {
  type        = string
  description = "The version of the Cosmo Tech API chart to deploy"
  validation {
    condition     = var.api_chart_package_version == var.api_version
    error_message = "The chart version must match with api version"
  }
}
variable "api_version_path" {
  description = "The API version path"
  type        = string
  validation {
    condition     = "v${split(".", var.api_version)[0]}" == var.api_version_path
    error_message = "The version of cosmotech api do not match with version path"
  }
}
variable "api_version" {
  type = string
}
variable "api_servlet_context_path" {
  type        = string
  description = "ex: /cosmotech-api"
}
variable "api_s3_username" {
  type = string
}
