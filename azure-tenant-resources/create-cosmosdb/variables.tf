variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "cosmosdb_name" {
  type = string
}

variable "location" {
  type = string
}

variable "failover_priority" {
  type = number
}

variable "tenant_resource_group" {
  type = string
}

variable "public_network_access_enabled" {
  type = bool
}

variable "is_virtual_network_filter_enabled" {
  type = bool
}

variable "access_key_metadata_writes_enabled" {
  type = bool
}

variable "analytical_storage_enabled" {
  type = bool
}

variable "network_acl_bypass_for_azure_services" {
  type = bool
}

variable "consistency_level" {
  type = string
}

variable "consistency_interval_in_minutes" {
  type = number
}

variable "consistency_max_staleness_prefix" {
  type = number
}

variable "backup_type" {
  type = string
}

variable "backup_interval_in_minutes" {
  type = number
}

variable "backup_retention_in_hours" {
  type = number
}

variable "backup_storage_redundancy" {
  type = string
}