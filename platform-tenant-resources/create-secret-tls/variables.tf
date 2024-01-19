variable "namespace" {
  type = string
}

variable "tls_secret_name" {
  type    = string
  default = "custom-tls-secret"
}

variable "path_fullchain_pem" {
  type = string
  default = ""
}

variable "path_privatekey_pem" {
  type = string
  default = ""
}