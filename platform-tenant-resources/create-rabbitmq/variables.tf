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
  default = "13.0.0"
}

variable "helm_release_name" {
  type    = string
  default = "rabbitmq"
}

variable "rabbitmq_username" {
  type = string
  default = "admin"
}

variable "rabbitmq_secret_name" {
  type = string
  default = "rabbitmq-secret"
}

variable "tls_secret_name" {
  type    = string
}
