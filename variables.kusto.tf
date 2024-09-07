variable "kusto_auto_stop" {
  description = "Specifies if the cluster could be automatically stopped"
  type        = bool
  default     = false
}

variable "kusto_instance_type" {
  type    = string
  default = "Standard_D12_v2"
}

variable "kustonr_instances" {
  type    = number
  default = 2
}

variable "kusto_engine" {
  type    = string
  default = "V2"
}

variable "kusto_trusted_external_tenants" {
  type    = list(string)
  default = ["*"]
}

variable "kusto_disk_encryption_enabled" {
  type    = bool
  default = false
}

variable "kusto_streaming_ingestion_enabled" {
  type    = bool
  default = true
}

variable "kusto_purge_enabled" {
  type    = bool
  default = false
}

variable "kusto_double_encryption_enabled" {
  type    = bool
  default = false
}

variable "kusto_public_network_access_enabled" {
  type    = bool
  default = true
}

variable "kusto_privatedns_zonename" {
  type    = string
  default = "privatelink.kusto.core.windows.net"
}

variable "kusto_deploy" {
  description = "Whether to create Azure digital explorer"
  type        = bool
  default     = true
}
