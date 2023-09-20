variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "principal_id" {
  type = string
}

variable "disk_size_gb" {
  type    = string
  default = "64"
}

variable "disk_sku" {
  type    = string
  default = "Premium_LRS"
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