variable "create_cosmosdb" {
  description = "Whether to create CosmosDB (only for API version < 2.4)"
  type        = bool
  default     = false
}

variable "cosmosdb_failover_priority" {
  type    = number
  default = 0
}

variable "cosmosdb_public_network_access_enabled" {
  type    = bool
  default = true
}

variable "cosmosdb_is_virtual_network_filter_enabled" {
  type    = bool
  default = false
}

variable "cosmosdb_access_key_metadata_writes_enabled" {
  type    = bool
  default = true # Important to give 'write' (aka POST) rights !!!
}

variable "cosmosdb_analytical_storage_enabled" {
  type    = bool
  default = false
}

variable "cosmosdb_network_acl_bypass_for_azure_services" {
  type    = bool
  default = false
}

variable "cosmosdb_consistency_level" {
  type    = string
  default = "Session"
}

variable "cosmosdb_consistency_interval_in_minutes" {
  type    = number
  default = 5
}

variable "cosmosdb_consistency_max_staleness_prefix" {
  type    = number
  default = 100
}

variable "cosmosdb_backup_type" {
  type    = string
  default = "Periodic"
}

variable "cosmosdb_backup_interval_in_minutes" {
  type    = number
  default = 240
}

variable "cosmosdb_backup_retention_in_hours" {
  type    = number
  default = 8
}

variable "cosmosdb_backup_storage_redundancy" {
  type    = string
  default = "Geo"
}