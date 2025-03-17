variable "tenant_id" {
  type = string
}

variable "kubernetes_tenant_namespace" {
  type = string
}

variable "organization_name" {
  type = string
}

variable "vault_addr" {
  type = string
}

variable "vault_token" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_account_key" {
  type = string
}

variable "storage_container" {
  type = string
}

variable "tf_blob_name_tenant" {
  type = string
}

variable "vault_namespace" {
  type = string
}

variable "vault_sops_namespace" {
  type = string
}

variable "engine_secret" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "vault_sops_deploy" {
  type = bool
}

variable "platform_id" {
  type = string
}

variable "container_tag" {
  type = string
}