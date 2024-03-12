variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "eventhub_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_resource_group" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "common_resource_group" {
  type = string
}
