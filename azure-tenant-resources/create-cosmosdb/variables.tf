variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "cosmosdb_name" {
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