variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "storage_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group" {
  type = string
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

variable "private_dns_zone_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_network_access_enabled" {
  type = bool
}