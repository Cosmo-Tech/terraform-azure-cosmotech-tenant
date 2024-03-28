locals {
  values_rabbitmq = {
    "RABBITMQ_USERNAME"    = var.rabbitmq_username
    "RABBITMQ_SECRET_NAME" = var.rabbitmq_secret_name
    "TLS_SECRET_NAME"      = var.tls_secret_name
    "MONITORING_NAMESPACE" = var.monitoring_namespace
  }
  instance_name = "${var.helm_release_name}-${var.namespace}"
}

resource "helm_release" "rabbitmq" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.helm_chart_version
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_rabbitmq)
  ]
}

resource "random_password" "rabbitmq_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "rabbitmq-secret" {
  metadata {
    name      = var.rabbitmq_secret_name
    namespace = var.namespace
    labels = {
      "app" = "rabbitmq"
    }
  }

  data = {
    username = var.rabbitmq_username
    password = random_password.rabbitmq_password.result
  }

  type = "Opaque"
}
