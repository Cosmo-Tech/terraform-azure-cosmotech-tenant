variable "pv_postgres_deploy" {
  type = bool
}
variable "pv_postgres_storage_gbi" {
  type = string
}
variable "pv_postgres_storage_account_type" {
  type = string
}
variable "pv_postgres_replicas" {
  type = number
}
variable "pv_postgres_storage_class_name" {
  type = string
}
variable "pv_postgres_provider" {
  type = string
}