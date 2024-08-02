variable "tenant_id" {
  description = "The tenant id"
}

variable "tenant_resource_group" {
  description = "Resource group to create which will contain created Azure resources for this tenant"
  type        = string
}

variable "tenant_group_id" {
  description = "The object id of the platform group"
  type        = string
  default     = ""
}

variable "tenant_sp_name" {
  description = "The name of the platform on which we deploy the tenant"
  type        = string
  default     = ""
}

variable "tenant_sp_object_id" {
  description = "The object id of the platform service principal"
  type        = string
  default     = ""
}

variable "tenant_client_id" {
  type    = string
  default = ""
}

variable "tenant_client_secret" {
  type    = string
  default = ""
}