variable "publicip_create" {
  description = "Create the public IP for the platform"
  type        = bool
  default     = false
}

variable "publicip_name" {
  description = "The public IP resource of the platform"
  type        = string
}

variable "publicip_resource_group" {
  type = string
}