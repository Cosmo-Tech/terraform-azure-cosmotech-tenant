variable "restish_sp_client_id" {
  type = string
}

variable "restish_sp_client_secret" {
  type      = string
  sensitive = true
}

variable "swagger_sp_client_id" {
  type = string
}