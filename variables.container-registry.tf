variable "container_admin_enabled" {
  type    = bool
  default = true
}

variable "container_quarantine_policy_enabled" {
  type    = bool
  default = false
}

variable "container_data_endpoint_enabled" {
  type    = bool
  default = false
}

variable "container_public_network_access_enabled" {
  type    = bool
  default = true
}

variable "container_zone_redundancy_enabled" {
  type    = bool
  default = false
}

variable "container_trust_policy" {
  type    = bool
  default = false
}

variable "container_retention_policy" {
  type    = number
  default = 7
}
