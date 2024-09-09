
variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "kusto_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_resource_group" {
  type = string
}

variable "kusto_instance_type" {
  type = string
}

variable "kustonr_instances" {
  type = number
}

variable "private_dns_zone_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "auto_stop_kusto" {
  type = bool
}

variable "trusted_external_tenants" {
  type = list(string)
}

variable "disk_encryption_enabled" {
  type = bool
}

variable "streaming_ingestion_enabled" {
  type = bool
}

variable "purge_enabled" {
  type = bool
}

variable "double_encryption_enabled" {
  type = bool
}

variable "public_network_access_enabled" {
  type = bool
}

variable "kubernetes_tenant_namespace" {
  type = string
}