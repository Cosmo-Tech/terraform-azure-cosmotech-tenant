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
  type = list(object({
    enabled = bool
  }))
  default = [{
    enabled = false
  }]
}

variable "container_retention_policy" {
  type = list(object({
    days    = number
    enabled = bool
  }))
  default = [{
    days    = 7
    enabled = false
  }]
}