variable "cosmotech_api_reader_username" {
  type    = string
  default = "cosmotech_api_reader"
}

variable "cosmotech_api_writer_username" {
  type    = string
  default = "cosmotech_api_writer"
}

variable "cosmotech_api_admin_username" {
  type    = string
  default = "cosmotech_api_admin"
}

variable "postgresql_initdb_secret_name" {
  type    = string
  default = "postgres-initdb"
}

variable "argo_postgresql_user" {
  type    = string
  default = "argo"
}

variable "postgresql_secret_name" {
  type    = string
  default = "postgres-config"
}
