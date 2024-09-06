locals {
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
  }
}


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
    namespace = var.tenant_resource_group
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

resource "random_password" "redis_admin_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "redis_admin_password" {
  metadata {
    name      = "redis-admin-secret"
    namespace = var.tenant_resource_group
  }
  data = {
    password = random_password.redis_admin_password.result
  }
  type = "Opaque"

  depends_on = [kubernetes_secret.redis_admin_password]
}


resource "kubernetes_secret" "postgresql-initdb" {
  metadata {
    name      = "postgres-initdb"
    namespace = var.tenant_resource_group
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
    namespace = var.tenant_resource_group
    labels = {
      "app" = "postgres"
    }
  }

  data = {
    argo-username                 = var.argo_postgresql_user
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
