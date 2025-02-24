locals {
  seaweedfs_password_secret = "${var.postgresql_secret_name}-seaweedfs"
  values_postgresql = {
    "POSTGRESQL_INITDB_SECRET" = var.postgresql_initdb_secret_name
    "MONITORING_NAMESPACE"     = var.monitoring_namespace
    "POSTGRESQL_SECRET_NAME"   = var.postgresql_secret_name
    "POSTGRESQL_PASSWORD"      = random_password.postgres_postgresql_password.result
  }
  initdb_data = {
    "COSMOTECH_API_READER_USERNAME" = var.cosmotech_api_reader_username
    "COSMOTECH_API_READER_PASSWORD" = random_password.postgresql_reader_password.result
    "COSMOTECH_API_WRITER_USERNAME" = var.cosmotech_api_writer_username
    "COSMOTECH_API_WRITER_PASSWORD" = random_password.postgresql_writer_password.result
    "COSMOTECH_API_ADMIN_USERNAME"  = var.cosmotech_api_admin_username
    "COSMOTECH_API_ADMIN_PASSWORD"  = random_password.postgresql_admin_password.result
    "ARGO_POSTGRESQL_USER"          = var.argo_postgresql_user
    "ARGO_POSTGRESQL_PASSWORD"      = random_password.argo_postgresql_password.result
    "ARGO_DATABSE"                  = var.argo_database
    "SEAWEEDFS_USERNAME"            = var.seaweedfs_username
    "SEAWEEDFS_PASSWORD"            = random_password.seaweedfs_argo_workflows_password.result
    "SEAWEEDFS_DATABASE"            = var.seaweedfs_database
  }
  s3_config_values = {
    "ARGO_WORKFLOWS_USERNAME" = var.argo_workflows_s3_username 
    "ARGO_WORKFLOWS_PASSWORD" = random_password.seaweedfs_argo_workflows_password.result
  }
}

# postgres
resource "random_password" "postgres_postgresql_password" {
  length  = 30
  special = false
}

resource "random_password" "argo_postgresql_password" {
  length  = 30
  special = false
}

resource "random_password" "postgresql_reader_password" {
  length  = 30
  special = false
}

resource "random_password" "postgresql_writer_password" {
  length  = 30
  special = false
}

resource "random_password" "postgresql_admin_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "postgresql_data" {
  metadata {
    name      = "postgresql-admin-data"
    namespace = var.kubernetes_namespace
  }
  data = {
    password = random_password.postgres_postgresql_password.result
    argo     = random_password.argo_postgresql_password.result
    reader   = random_password.postgresql_reader_password.result
    writer   = random_password.postgresql_writer_password.result
    admin    = random_password.postgresql_admin_password.result
  }
  type = "Opaque"
}

resource "kubernetes_secret" "postgresql-initdb" {
  metadata {
    name      = "postgres-initdb"
    namespace = var.kubernetes_namespace
    labels = {
      "app" = "postgres"
    }
  }

  data = {
    "initdb.sql" = templatefile("${path.module}/initdb.sql", local.initdb_data)
  }

  type = "Opaque"

}

resource "kubernetes_secret" "postgres-config" {
  metadata {
    name      = "postgres-config"
    namespace = var.kubernetes_namespace
    labels = {
      "app" = "postgres"
    }
  }

  data = {
    argo-username                 = var.argo_postgresql_user
    database-password             = random_password.argo_postgresql_password.result
    argo-password                 = random_password.argo_postgresql_password.result
    postgres-username             = "postgres"
    postgres-password             = random_password.postgres_postgresql_password.result
    cosmotech-api-admin-username  = var.cosmotech_api_admin_username
    cosmotech-api-admin-password  = random_password.postgresql_admin_password.result
    cosmotech-api-reader-username = var.cosmotech_api_reader_username
    cosmotech-api-reader-password = random_password.postgresql_reader_password.result
    cosmotech-api-writer-username = var.cosmotech_api_writer_username
    cosmotech-api-writer-password = random_password.postgresql_writer_password.result
  }

  type = "Opaque"
}


# rabbitmq
resource "random_password" "rabbitmq_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "rabbitmq_listener_password" {
  length  = 30
  special = false
}

resource "random_password" "rabbitmq_sender_password" {
  length  = 30
  special = false
}

resource "kubectl_manifest" "rabbitmq_load_data" {
  yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  name: rabbitmq-data-secret
  namespace: ${var.kubernetes_namespace}
type: Opaque
stringData:
  admin: ${random_password.rabbitmq_admin_password.result}
  listener: ${random_password.rabbitmq_listener_password.result}
  sender: ${random_password.rabbitmq_sender_password.result}
YAML
}

resource "kubernetes_secret" "rabbitmq-secret" {
  metadata {
    name      = "rabbitmq-${var.kubernetes_namespace}-secret"
    namespace = var.kubernetes_namespace
    labels = {
      "app" = "rabbitmq"
    }
  }

  data = {
    admin-username    = "admin"
    admin-password    = random_password.rabbitmq_admin_password.result
    listener-username = var.rabbitmq_listener_username
    listener-password = random_password.rabbitmq_listener_password.result
    sender-username   = var.rabbitmq_sender_username
    sender-password   = random_password.rabbitmq_sender_password.result
  }

  type = "Opaque"
}

resource "kubectl_manifest" "rabbitmq_load_definition" {
  yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  name: rabbitmq-${var.kubernetes_namespace}-load-definition
  namespace: ${var.kubernetes_namespace}
type: Opaque
stringData:
  load_definition.json: |-
      {
        "users": [
          {
            "name": "admin",
            "password": "${random_password.rabbitmq_admin_password.result}",
            "tags": "administrator"
          },
          {
            "name": "${var.rabbitmq_listener_username}",
            "password": "${random_password.rabbitmq_listener_password.result}",
            "tags": ""
          },
          {
            "name": "${var.rabbitmq_sender_username}",
            "password": "${random_password.rabbitmq_sender_password.result}",
            "tags": ""
          }
        ],
        "vhosts": [
          {
            "name": "/"
          }
        ],
        "permissions": [
          {
            "user": "admin",
            "vhost": "/",
            "configure": ".*",
            "write": ".*",
            "read": ".*"
          },
          {
            "user": "${var.rabbitmq_listener_username}",
            "vhost": "/",
            "configure": ".*",
            "write": ".*",
            "read": ".*"
          },
          {
            "user": "${var.rabbitmq_sender_username}",
            "vhost": "/",
            "configure": ".*",
            "write": ".*",
            "read": ".*"
          }
        ]
      }
  YAML  
}


# redis
resource "random_password" "redis_admin_password" {
  count   = var.first_tenant_in_cluster ? 0 : 1
  length  = 30
  special = false
}

resource "kubernetes_secret" "redis_admin_password" {
  count = var.first_tenant_in_cluster ? 0 : 1
  metadata {
    name      = "redis-admin-secret"
    namespace = var.kubernetes_namespace
  }
  data = {
    password = random_password.redis_admin_password.0.result
  }
  type       = "Opaque"
  depends_on = [kubernetes_secret.redis_admin_password]
}


# seaweedfs
resource "random_password" "seaweedfs_argo_workflows_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "s3_credentials" {
  metadata {
    name      = "seaweedfs-${var.kubernetes_namespace}-s3-auth"
    namespace = var.kubernetes_namespace
    labels = {
      "app" = "seaweedfs"
    }
  }
  type = "Opaque"
  data = {
    "argo-workflows-username" = var.argo_workflows_s3_username
    "argo-workflows-password" = random_password.seaweedfs_argo_workflows_password.result
  }
}

resource "kubernetes_secret" "s3_auth_config" {
  metadata {
    name      = "seaweedfs-${var.kubernetes_namespace}-s3-config"
    namespace = var.kubernetes_namespace
    labels = {
      "app" = "seaweedfs"
    }
  }

  type = "Opaque"
  data = {
    "config.json" = templatefile("${path.module}/s3_config.json", local.s3_config_values)
  }
}