variable "redis_disk_sku" {
  type = string
}

variable "redis_disk_size_gb" {
  type = number
}

variable "redis_disk_tier" {
  type = string
}

variable "redis_managed_disk_name" {
  type    = string
}

variable "redis_port" {
  type = number
}
