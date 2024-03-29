variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "backup_policy_name" {
  type = string
}

variable "backup_instance_name" {
  type = string
}

variable "tenant_resource_group" {
  type = string
}

variable "tenant_resource_group_id" {
  type = string
}

variable "location" {
  type = string
}

variable "managed_disk_id" {
  type = string
}




