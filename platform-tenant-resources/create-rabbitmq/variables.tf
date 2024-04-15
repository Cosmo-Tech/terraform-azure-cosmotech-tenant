variable "namespace" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "helm_chart" {
  type    = string
  default = "rabbitmq"
}

variable "helm_chart_version" {
  type    = string
  default = "13.0.3"
}

variable "helm_release_name" {
  type    = string
  default = "rabbitmq"
}

variable "rabbitmq_listener_username" {
  type    = string
  default = "cosmotech_api_listener"
}

variable "rabbitmq_sender_username" {
  type    = string
  default = "cosmotech_run_sender"
}

variable "requests_memory" {
  type = string
  default = "1024Mi"
}
variable "requests_cpu" {
  type = string
  default = "375m"
}

variable "limits_memory" {
  type = string
  default = "2048Mi"
}
variable "limits_cpu" {
  type = string
  default = "800m"
}