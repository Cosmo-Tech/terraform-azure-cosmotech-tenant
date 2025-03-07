variable "container_admin_enabled" {
  type = bool
}

variable "container_quarantine_policy_enabled" {
  type = bool
}

variable "container_data_endpoint_enabled" {
  type = bool
}

variable "container_public_network_access_enabled" {
  type = bool
}

variable "container_zone_redundancy_enabled" {
  type = bool
}

variable "container_trust_policy" {
  type = bool
}

variable "container_retention_policy" {
  type = number
}