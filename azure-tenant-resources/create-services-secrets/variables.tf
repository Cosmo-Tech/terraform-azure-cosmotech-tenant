variable "cosmotech_api_reader_username" {
  type = string
}

variable "cosmotech_api_writer_username" {
  type = string
}

variable "cosmotech_api_admin_username" {
  type = string
}

variable "postgresql_initdb_secret_name" {
  type = string
}

variable "argo_postgresql_user" {
  type = string
}

variable "postgresql_secret_name" {
  type = string
}

variable "argo_database" {
  type = string
}

variable "kubernetes_namespace" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "rabbitmq_listener_username" {
  type    = string
}

variable "rabbitmq_sender_username" {
  type    = string
}

variable "first_tenant_in_cluster" {
  type = bool
}

variable "argo_workflows_s3_username" {
  type = string
}

variable "seaweedfs_username" {
  type = string
}

variable "seaweedfs_database" {
  type = string
}