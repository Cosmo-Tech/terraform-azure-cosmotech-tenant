variable "pv_redis_deploy" {
  type = bool
}
variable "pv_redis_storage_gbi" {
  type = string
}
variable "pv_redis_storage_account_type" {
  type = string
}
variable "pv_redis_replicas" {
  type = number
}
variable "pv_redis_storage_class_name" {
  type = string
}
variable "pv_redis_provider" {
  type = string
  validation {
    condition = contains([
      "azure",
      "aws",
      "longhorn",
    ], var.pv_redis_provider)
    error_message = "Provider must be either: azure, aws, longhorn"
  }
}