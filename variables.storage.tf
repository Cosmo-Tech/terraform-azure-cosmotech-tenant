variable "storage_class_sku" {
  type    = string
  default = "Standard_LRS"
}

variable "storage_kind" {
  type    = string
  default = "StorageV2"
}

variable "storage_public_network_access_enabled" {
  type    = bool
  default = false
}

variable "storage_default_to_oauth_authentication" {
  type    = bool
  default = false
}

variable "storage_min_tls_version" {
  type    = string
  default = "TLS1_2"
}

variable "storage_shared_access_key_enabled" {
  type    = bool
  default = true
}

variable "storage_enable_https_traffic_only" {
  type    = bool
  default = true
}

variable "storage_access_tier" {
  type    = string
  default = "Hot"
}