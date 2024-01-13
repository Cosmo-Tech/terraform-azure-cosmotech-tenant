variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "cosmosdb_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_resource_group" {
  type = string
}