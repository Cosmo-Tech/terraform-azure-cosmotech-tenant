variable "monitoring_namespace" {
  type = string
}

variable "kubernetes_tenant_namespace" {
  description = "The kubernetes namespace to create"
  type        = string
}

variable "monitoring_enabled" {
  type = string
}

variable "api_dns_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "kubernetes_resource_group" {
  description = "Existing Resource group which contain common platform resources"
  type        = string
}

variable "services_secrets_create" {
  type = bool
}

variable "disk_deploy" {
  type = bool
}