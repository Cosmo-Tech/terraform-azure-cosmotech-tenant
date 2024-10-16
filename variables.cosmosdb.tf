variable "create_cosmosdb" {
  description = "Whether to create CosmosDB (only for API version < 2.4)"
  type        = bool
}

variable "cosmosdb_failover_priority" {
  type    = number
}

variable "cosmosdb_public_network_access_enabled" {
  type    = bool
}

variable "cosmosdb_is_virtual_network_filter_enabled" {
  type    = bool
}

variable "cosmosdb_access_key_metadata_writes_enabled" {
  type    = bool
}

variable "cosmosdb_analytical_storage_enabled" {
  type    = bool
}

variable "cosmosdb_network_acl_bypass_for_azure_services" {
  type    = bool
}

variable "cosmosdb_consistency_level" {
  type    = string
}

variable "cosmosdb_consistency_interval_in_minutes" {
  type    = number
}

variable "cosmosdb_consistency_max_staleness_prefix" {
  type    = number
}

variable "cosmosdb_backup_type" {
  type    = string
}

variable "cosmosdb_backup_interval_in_minutes" {
  type    = number
}

variable "cosmosdb_backup_retention_in_hours" {
  type    = number
}

variable "cosmosdb_backup_storage_redundancy" {
  type    = string
}
