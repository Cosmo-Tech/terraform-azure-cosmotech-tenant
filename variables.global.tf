variable "monitoring_namespace" {
  type = string
}
variable "kubernetes_tenant_namespace" {
  type = string
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
  type = string
}
variable "services_secrets_create" {
  type = bool
}
variable "cloud_provider" {
  type = string
}
variable "host" {
  type = string
}
variable "client_certificate" {
  type = string
}
variable "client_key" {
  type = string
}
variable "cluster_ca_certificate" {
  type = string
}
variable "config_path" {
  type = string
}
variable "config_context" {
  type = string
}