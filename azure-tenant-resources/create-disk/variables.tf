variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "tenant_managed_disk_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_resource_group" {
  type = string
}

variable "redis_disk_size_gb" {
  type = number
}

variable "redis_disk_sku" {
  type = string
}

variable "redis_disk_tier" {
  type    = string
}

variable "network_sp_object_id" {
  type = string
}

variable "tenant_sp_object_id" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "deployment_type" {
  type = string
}