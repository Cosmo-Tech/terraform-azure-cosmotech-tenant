variable "vault_enable" {
  type = bool
}

variable "vault_namespace" {
  type    = string
  default = "vault"
}

variable "allowed_namespace" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vault_address" {
  type = string
}

variable "vault_sops_namespace" {
  type = string
}

variable "organization_name" {
  type = string
}

variable "vault_token" {
  type = string
}

variable "vault_create_entries" {
  type = bool
}