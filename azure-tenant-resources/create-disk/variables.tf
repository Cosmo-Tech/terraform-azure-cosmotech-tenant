variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "platform_common_sp_object_id" {
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

variable "subnet_id" {
  type = string
}

variable "tenant_managed_disk_name" {
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

variable "platform_sp_object_id" {
  type = string
}