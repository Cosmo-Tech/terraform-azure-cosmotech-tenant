variable "location" {
  type = string
}

variable "managed_disk_name" {
  type = string
}
variable "platform_common_sp_object_id" {
  type = string
}
variable "platform_sp_object_id" {
  type = string
}

variable "redis_disk_size_gb" {
  type = number
}

variable "redis_disk_sku" {
  type = string
}

variable "disk_tier" {
  type    = string
  default = "P6"
}

variable "cluster_name" {
  type = string
}

variable "networkadt_sp_object_id" {
  type = string
}

variable "platform_group_id" {
  type = string
}

variable "tenant_resource_group" {
  type = object({
    id   = string
    name = string
  })
}

variable "vnet_iprange" {
  type = string
}

variable "platform_resource_group" {
  type = object({
    id   = string
    name = string
  })
}

variable "platform_public_ip_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "platform_vnet" {
  type = object({
    id   = string
    name = string
  })
}

variable "create_cosmosdb" {
  type        = bool
  default     = false
  description = "Used on Platform <=2.3"
}

variable "create_adx" {
  type        = bool
  default     = true
  description = "If false, adx_ingestion_uri and adx_uri must be set manually in create-platform module"
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

variable "customer_name" {
  description = "The customer name"
  type        = string
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "cost_center" {
  type    = string
  default = "NA"
}

variable "create_backup" {
  type    = bool
  default = true
}

variable "storage_tier" {
  type = string
}
variable "storage_replication_type" {
  type = string
}
variable "storage_kind" {
  type = string
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

variable "vnet_resource_group" {
  type = string
}

variable "storage_queue_privatedns_zonename" {
  type = string
}
variable "eventhub_privatedns_zonename" {
  type = string
}
variable "kusto_privatedns_zonename" {
  type = string
}
variable "kusto_instance_type" {
  type = string
}
variable "kustonr_instances" {
  type = number
}