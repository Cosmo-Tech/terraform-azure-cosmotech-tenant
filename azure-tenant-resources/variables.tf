variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_virtual_network_address_prefix" {
  type = string
}

variable "tenant_virtual_subnet_network_address_prefix" {
  type = string
}

variable "managed_disk_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "project_stage" {
  description = "The Project stage"
  type        = string
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Doc",
      "Support",
      "Demo",
      "Prod",
      "PreProd"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod, PreProd, Doc, Support."
  }
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "customer_name" {
  description = "The customer name"
  type        = string
}

variable "cost_center" {
  type = string
}

variable "network_sp_object_id" {
  type = string
}

variable "storage_kind" {
  type = string
}

variable "vnet_resource_group" {
  type = string
}

variable "create_backup" {
  type = bool
  # default = true
}

variable "create_cosmosdb" {
  description = "Used on Platform <=2.3"
  type        = bool
  # default     = false
}

variable "create_adx" {
  description = "If false, adx_ingestion_uri and adx_uri must be set manually in create-platform module"
  type        = bool
  # default     = true
}

variable "blob_privatedns_zonename" {
  type = string
}

variable "queue_privatedns_zonename" {
  type = string
}

variable "table_privatedns_zonename" {
  type = string
}

variable "eventhub_privatedns_zonename" {
  type = string
}

variable "adt_privatedns_zonename" {
  type = string
}

variable "redis_disk_sku" {
  type = string
}

variable "redis_disk_size_gb" {
  type = number
}

variable "redis_disk_tier" {
  type = string
}

variable "kusto_instance_type" {
  type = string
}

variable "kustonr_instances" {
  type = number
}

variable "storage_tier" {
  type = string
}

variable "storage_replication_type" {
  type = string
}

variable "tenant_group_id" {
  type = string
}

variable "tenant_sp_object_id" {
  type = string
}

variable "tenant_resource_group" {
  type = object({
    id   = string
    name = string
  })
}

variable "common_resource_group" {
  type = object({
    id   = string
    name = string
  })
}

variable "public_ip_id" {
  type = string
}

variable "vnet" {
  type = object({
    id   = string
    name = string
  })
}

variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "deployment_type" {
  type = string
}
